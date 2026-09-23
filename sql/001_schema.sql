-- ============================================================================
-- Troca da Terra — esquema inicial (Supabase / PostgreSQL)
-- Estado: ESCRITO, NÃO APLICADO. Nenhuma base de dados foi criada.
-- Princípios: UUID em tudo · autorização no backend (RLS) · morada exata
-- nunca pública · eliminação de conta prevista · registo de auditoria.
-- ============================================================================

create extension if not exists "pgcrypto";

-- ---------------------------------------------------------------- pessoas ---
create table profiles (
  id                uuid primary key references auth.users(id) on delete cascade,
  nome_exibicao     text not null check (char_length(nome_exibicao) between 2 and 60),
  telefone          text,                         -- preparado p/ 2.ª fase (SMS)
  telefone_verif    boolean not null default false,
  foto_url          text,
  descricao         text check (char_length(descricao) <= 300),
  location_id       uuid references locations(id),
  morada_exata      text,                         -- NUNCA exposta publicamente
  estado_verificacao text not null default 'nao_verificado'
                    check (estado_verificacao in ('nao_verificado','verificado_local','suspenso')),
  criado_em         timestamptz not null default now(),
  apagado_em        timestamptz                   -- soft delete (RGPD)
);

create table roles (
  id     uuid primary key default gen_random_uuid(),
  chave  text unique not null check (chave in ('utilizador','moderador','admin')),
  nome   text not null
);

create table user_roles (
  user_id uuid references profiles(id) on delete cascade,
  role_id uuid references roles(id) on delete cascade,
  atribuido_por uuid references profiles(id),
  criado_em timestamptz not null default now(),
  primary key (user_id, role_id)
);

-- ------------------------------------------------------------ referências ---
create table locations (
  id        uuid primary key default gen_random_uuid(),
  nome      text not null,          -- freguesia / lugar
  concelho  text,
  distrito  text,
  ativo     boolean not null default true
);

create table categories (
  id      uuid primary key default gen_random_uuid(),
  chave   text unique not null,
  nome    text not null,
  ordem   int not null default 0,
  ativa   boolean not null default true
);

-- --------------------------------------------------------------- anúncios ---
create table listings (
  id            uuid primary key default gen_random_uuid(),
  owner_id      uuid not null references profiles(id) on delete cascade,
  category_id   uuid not null references categories(id),
  location_id   uuid not null references locations(id),
  titulo        text not null check (char_length(titulo) between 3 and 80),
  descricao     text check (char_length(descricao) <= 1000),
  quantidade    numeric(10,2),
  unidade       text check (unidade in ('kg','unidade','duzia','caixa','saco','litro','outro')),
  estado_produto text,
  disponivel_ate date,
  entrega       text check (entrega in ('recolha','entrega','combinar')),
  aceita_propostas boolean not null default true,
  estado        text not null default 'publicado'
                check (estado in ('rascunho','publicado','reservado','trocado','expirado','removido','bloqueado')),
  criado_em     timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);
create index on listings (estado, criado_em desc);
create index on listings (category_id);
create index on listings (location_id);

create table listing_images (
  id         uuid primary key default gen_random_uuid(),
  listing_id uuid not null references listings(id) on delete cascade,
  url        text not null,
  ordem      int not null default 0
);

create table listing_wanted_items (
  id         uuid primary key default gen_random_uuid(),
  listing_id uuid not null references listings(id) on delete cascade,
  descricao  text not null            -- «batata, couves, ajuda na horta»
);

create table favorites (
  user_id    uuid references profiles(id) on delete cascade,
  listing_id uuid references listings(id) on delete cascade,
  criado_em  timestamptz not null default now(),
  primary key (user_id, listing_id)
);

-- --------------------------------------------------------------- propostas --
create table exchange_proposals (
  id            uuid primary key default gen_random_uuid(),
  listing_id    uuid not null references listings(id) on delete cascade,
  proponente_id uuid not null references profiles(id) on delete cascade,
  dono_id       uuid not null references profiles(id) on delete cascade,
  mensagem      text check (char_length(mensagem) <= 500),
  quantidade_pedida text,
  local_sugerido text,
  estado        text not null default 'enviada'
                check (estado in ('enviada','em_negociacao','aceite','recusada','cancelada','concluida','em_disputa')),
  criado_em     timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  check (proponente_id <> dono_id)
);
create index on exchange_proposals (dono_id, estado);
create index on exchange_proposals (proponente_id, estado);

create table proposal_items (            -- o que o proponente oferece
  id          uuid primary key default gen_random_uuid(),
  proposal_id uuid not null references exchange_proposals(id) on delete cascade,
  listing_id  uuid references listings(id),      -- anúncio dele…
  descricao   text,                              -- …ou texto livre («tarde de poda»)
  quantidade  text
);

-- ------------------------------------------------------------------ chat ----
create table conversations (
  id          uuid primary key default gen_random_uuid(),
  proposal_id uuid not null unique references exchange_proposals(id) on delete cascade,
  criado_em   timestamptz not null default now()
);

create table messages (
  id              uuid primary key default gen_random_uuid(),
  conversation_id uuid not null references conversations(id) on delete cascade,
  autor_id        uuid not null references profiles(id) on delete cascade,
  corpo           text check (char_length(corpo) <= 2000),
  imagem_url      text,
  lida_em         timestamptz,
  criado_em       timestamptz not null default now()
);
create index on messages (conversation_id, criado_em);

-- ------------------------------------------------- conclusão e reputação ----
create table exchange_confirmations (
  id          uuid primary key default gen_random_uuid(),
  proposal_id uuid not null references exchange_proposals(id) on delete cascade,
  user_id     uuid not null references profiles(id) on delete cascade,
  criado_em   timestamptz not null default now(),
  unique (proposal_id, user_id)        -- cada um confirma uma vez
);

create table ratings (
  id          uuid primary key default gen_random_uuid(),
  proposal_id uuid not null references exchange_proposals(id) on delete cascade,
  autor_id    uuid not null references profiles(id) on delete cascade,
  alvo_id     uuid not null references profiles(id) on delete cascade,
  estrelas    int not null check (estrelas between 1 and 5),
  etiquetas   text[],                  -- produto_conforme, pontual, comunicacao, segura
  comentario  text check (char_length(comentario) <= 400),
  estado      text not null default 'pendente'
              check (estado in ('pendente','publicado','removido')),   -- passa por moderação
  criado_em   timestamptz not null default now(),
  unique (proposal_id, autor_id),
  check (autor_id <> alvo_id)
);

-- --------------------------------------------------------------- moderação --
create table reports (
  id            uuid primary key default gen_random_uuid(),
  denunciante_id uuid not null references profiles(id) on delete cascade,
  tipo_alvo     text not null check (tipo_alvo in ('anuncio','mensagem','perfil','avaliacao')),
  alvo_id       uuid not null,
  motivo        text not null,
  detalhe       text,
  estado        text not null default 'aberta'
                check (estado in ('aberta','em_analise','resolvida','arquivada')),
  criado_em     timestamptz not null default now()
);

create table moderation_actions (
  id           uuid primary key default gen_random_uuid(),
  moderador_id uuid not null references profiles(id),
  report_id    uuid references reports(id),
  tipo_alvo    text not null,
  alvo_id      uuid not null,
  acao         text not null,          -- remover, manter, suspender, verificar…
  motivo       text,
  criado_em    timestamptz not null default now()
);

create table notifications (
  id        uuid primary key default gen_random_uuid(),
  user_id   uuid not null references profiles(id) on delete cascade,
  tipo      text not null,
  titulo    text not null,
  corpo     text,
  lida_em   timestamptz,
  criado_em timestamptz not null default now()
);

-- --------------------------------------------------- RGPD e rastreabilidade -
create table consent_records (
  id         uuid primary key default gen_random_uuid(),
  user_id    uuid not null references profiles(id) on delete cascade,
  documento  text not null,            -- termos, privacidade, regras
  versao     text not null,
  aceite_em  timestamptz not null default now()
);

create table audit_logs (
  id         uuid primary key default gen_random_uuid(),
  ator_id    uuid references profiles(id),
  acao       text not null,
  tipo_alvo  text,
  alvo_id    uuid,
  detalhe    jsonb,
  criado_em  timestamptz not null default now()
);

-- ============================================================================
-- RLS — a autorização vive AQUI, não nos botões da aplicação.
-- ============================================================================
alter table profiles            enable row level security;
alter table listings            enable row level security;
alter table exchange_proposals  enable row level security;
alter table messages            enable row level security;
alter table ratings             enable row level security;

-- helper: o utilizador tem um papel?
create or replace function tem_papel(p_chave text) returns boolean
language sql stable security definer as $$
  select exists (
    select 1 from user_roles ur join roles r on r.id = ur.role_id
    where ur.user_id = auth.uid() and r.chave = p_chave);
$$;

-- perfis: toda a gente vê o público; só o próprio (ou moderador) edita.
create policy perfis_leitura on profiles for select using (apagado_em is null);
create policy perfis_edicao  on profiles for update using (id = auth.uid() or tem_papel('moderador'));

-- anúncios: publicados são visíveis a todos; só o dono mexe nos seus.
create policy anuncios_leitura on listings for select
  using (estado = 'publicado' or owner_id = auth.uid() or tem_papel('moderador'));
create policy anuncios_escrita on listings for all
  using (owner_id = auth.uid() or tem_papel('moderador'))
  with check (owner_id = auth.uid() or tem_papel('moderador'));

-- propostas: só as duas partes (e moderador) as veem.
create policy propostas_acesso on exchange_proposals for all
  using (proponente_id = auth.uid() or dono_id = auth.uid() or tem_papel('moderador'));

-- mensagens: só quem está na proposta.
create policy mensagens_acesso on messages for all
  using (exists (
    select 1 from conversations c join exchange_proposals p on p.id = c.proposal_id
    where c.id = messages.conversation_id
      and (p.proponente_id = auth.uid() or p.dono_id = auth.uid() or tem_papel('moderador'))));

-- avaliações: só se houver proposta CONCLUÍDA em que o autor participou.
create policy avaliacoes_leitura on ratings for select using (estado = 'publicado' or tem_papel('moderador'));
create policy avaliacoes_criar on ratings for insert with check (
  autor_id = auth.uid() and exists (
    select 1 from exchange_proposals p
    where p.id = ratings.proposal_id and p.estado = 'concluida'
      and (p.proponente_id = auth.uid() or p.dono_id = auth.uid())));

-- ============================================================================
-- Regra de negócio a implementar em função/trigger (não em código da app):
--   quando existirem 2 linhas em exchange_confirmations para a mesma proposta
--   → exchange_proposals.estado = 'concluida'. Só aí as avaliações abrem.
-- ============================================================================
