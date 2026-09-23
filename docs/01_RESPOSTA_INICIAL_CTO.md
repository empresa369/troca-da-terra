# Troca da Terra — Resposta Inicial do CTO
**Data:** 23/09/2026 · **Para:** CEO (Rui) · **Origem:** prompt do CPO (`00_PROMPT_ORIGINAL_CPO.md`, secção 18)

> Regra do projeto (secção 1 do prompt): *não inventar resultados, utilizadores, testes ou funcionalidades concluídas.*
> Estado deste documento: **planeado**. Nada está implementado em produção. O que existe hoje é o **protótipo navegável** em `prototipo/index.html` (Fase 1) — mock data, sem base de dados, sem contas reais.

---

## 1. Resumo da solução proposta

Uma aplicação para telemóvel onde moradores de uma vila publicam o que têm a mais (ovos, batatas, mel, lenha, mudas) e propõem **trocas diretas** por outros produtos. Sem dinheiro, sem moeda virtual, sem entregas profissionais. O valor não está na tecnologia — está na **confiança local**: os pais do fundador validam pessoas conhecidas e ajudam quem tem menos prática digital.

O produto resume-se a 5 ecrãs (Início, Procurar, Publicar, Trocas, Perfil) e a um fluxo único que tem de funcionar sem falhas:

```
publicar → alguém encontra → propõe troca → conversam → combinam → ambos confirmam → avaliam
```

Tudo o resto (mapas, créditos, pagamentos, leilões, IA) fica de fora do MVP, como o prompt manda.

## 2. Suposições que estou a fazer

1. A vila tem cobertura móvel razoável mas telemóveis modestos → a app tem de ser leve e funcionar com net fraca.
2. A maioria dos participantes iniciais **conhece-se pessoalmente** — a verificação forte é presencial (pelos moderadores), não digital.
3. O piloto é **convidado**, não aberto: ninguém entra sem link/convite.
4. Ninguém paga nada no piloto; não há receita nesta fase e não se promete nenhuma.
5. O fundador (CEO) é o responsável legal pelos dados nesta fase; não há empresa registada.
6. Os produtos são trocados **entre as pessoas**; a plataforma nunca fica no meio (não guarda, não transporta, não garante qualidade).

## 3. As 3 perguntas que bloqueiam mesmo o início

(O prompt limita a três. Cada uma tem a minha recomendação — podes responder só «ok» a todas.)

| # | Pergunta | Recomendação do CTO |
|---|---|---|
| 1 | **Vila, concelho e distrito** (e o nome definitivo, se já tiveres) | Manter *Troca da Terra* como nome provisório e preencher a vila quando disseres. O protótipo usa `[A NOSSA VILA]` até lá. |
| 2 | **Registo: telemóvel com SMS ou email+password?** | **Email+password no piloto.** SMS custa dinheiro por mensagem e trava logo; o telefone fica preparado na base de dados para a 2.ª fase. Quem não tem email → o moderador cria a conta com consentimento presencial. |
| 3 | **Quem são os moderadores e o que podem fazer** (nomes/papéis dos teus pais) | Papel «Moderador local»: validar pessoas conhecidas, ajudar a publicar (com consentimento), receber denúncias. **Nunca** ver palavras-passe, nunca concluir trocas por outros. Basta dizeres «pai e mãe» e eu configuro. |

## 4. Arquitetura recomendada e custo mensal real

| Camada | Escolha | Custo no piloto |
|---|---|---|
| Protótipo (agora) | **1 ficheiro HTML** que abre em qualquer telemóvel pelo browser | **0 €** |
| App (Fase 2) | React Native + **Expo** + TypeScript (Android e iPhone, um só código) | 0 € (desenvolvimento) |
| Distribuição no piloto | **Expo Go / link direto** — sem lojas de aplicações | **0 €** |
| Backend | **Supabase** free tier (Postgres + auth + storage + realtime) | **0 €** até 500 MB BD / 1 GB imagens |
| Painel de moderação | Página web no mesmo Supabase (ou ecrã dentro da app) | 0 € |
| Notificações | Expo Push | 0 € |
| Mapas | **Nenhum** no piloto (só localidade + distância aproximada) | 0 € |

**Custo total do piloto: 0 €/mês.** As únicas despesas possíveis, e só se decidires publicar nas lojas *depois* do piloto: Google Play 25 $ (uma vez) e Apple 99 $/ano. Enquanto for teste fechado com 20–50 pessoas, **não é preciso publicar em loja nenhuma** — e isto respeita a nossa regra «lucro antes de despesas».

## 5. Plano por etapas pequenas

| Fase | O que entrego | Quem faz | Estado |
|---|---|---|---|
| **0 — Descoberta** | Guião de 8 perguntas para os teus pais + 5 moradores; lista dos produtos reais da vila; riscos | CEO entrevista (30 min), CTO escreve o guião | guião **feito** (`02_GUIAO_DESCOBERTA.md`) |
| **1 — Protótipo** | Protótipo navegável, em português, botões grandes, o fluxo todo clicável | CTO | **FEITO hoje** (`prototipo/index.html`) |
| **2 — MVP** | App Expo + Supabase: contas, anúncios, pesquisa, propostas, chat, confirmação, avaliações, moderação | CTO | à espera de aprovação |
| **3 — Piloto** | 20–50 convidados, 4–8 semanas, apoio presencial dos teus pais | CEO + pais | depois da Fase 2 |
| **4 — Decisão** | Relatório verdadeiro: o que funcionou, o que falhou, custos | CTO escreve, CEO decide | — |

**Ordem deliberada:** o protótipo vem antes do código porque muda-se um ecrã em 10 minutos e uma app em 3 dias. Mostra-se aos teus pais **no telemóvel** e corrige-se a linguagem antes de programar.

## 6. Primeiras páginas da aplicação

1. **Entrada** — o que é, em 3 linhas, e «Entrar» / «Criar conta».
2. **Início** — o que há de novo na vila (últimos anúncios) + «Publicar».
3. **Procurar** — pesquisa + filtros por categoria e localidade.
4. **Anúncio** — fotos, quantidade, o que a pessoa quer em troca, botão «Propor troca».
5. **Propor troca** — escolher o que ofereço + mensagem curta.
6. **Trocas** — recebidas / enviadas / concluídas, com o estado bem visível.
7. **Conversa** — chat só dentro da proposta, com aviso de segurança.
8. **Confirmar troca** — os dois carregam; só depois disso se pode avaliar.
9. **Avaliar** — estrelas + etiquetas simples.
10. **Perfil** — os meus anúncios, as minhas avaliações, selo de «verificado localmente».
11. **Moderação** (só moderador) — pedidos de ajuda, validar pessoa, denúncias.

## 7. Modelo inicial de dados

19 tabelas, todas com UUID, descritas em `docs/03_MODELO_DADOS.md` e prontas em SQL em `sql/001_schema.sql` (ainda **não** aplicado a nenhuma base de dados).
Núcleo: `profiles · roles · user_roles · locations · categories · listings · listing_images · listing_wanted_items · exchange_proposals · proposal_items · conversations · messages · exchange_confirmations · ratings · favorites · reports · moderation_actions · consent_records · audit_logs`.

Princípios aplicados: autorização **no backend** (RLS do Postgres, não botões escondidos); morada exata nunca pública; eliminação de conta prevista desde o início.

## 8. Riscos principais (honestos)

**Técnicos**
- Fotos pesadas em net fraca → comprimir antes de enviar (já previsto).
- Expo Go obriga a instalar uma app intermédia no piloto — é o preço de não pagar as lojas.

**Legais**
- Produtos alimentares caseiros: a plataforma **não garante** segurança alimentar; tem de estar escrito e aceite. Compotas/conservas têm regras próprias — ficam com aviso.
- RGPD: fotos e localidade são dados pessoais. Precisamos de termos, privacidade e botão de apagar conta. Redação a validar por jurista antes de sair do círculo de conhecidos.
- Menores: idade mínima 18 no piloto (evita a camada legal mais pesada).

**Operacionais**
- O maior risco não é técnico: **é ninguém publicar nada**. Uma app vazia mata-se sozinha. Por isso a Fase 0 serve para os teus pais chegarem ao arranque com 10–15 anúncios reais já combinados.
- Uma troca correr mal (produto estragado, alguém não aparece) pode queimar a confiança da vila inteira. Resposta: moderação humana, regras claras, e a plataforma nunca a prometer o que não controla.

## 9. Critérios para decidir se o piloto continua

Aplicando a nossa lei (R2: só conta o que é verdadeiro e verificável), o piloto **só passa** se, em 4–8 semanas:

- **≥ 10 trocas concluídas e confirmadas pelas duas partes** (o número que interessa — não instalações);
- **≥ 15 pessoas ativas** na segunda metade do piloto (não só na semana do entusiasmo);
- **≥ 50 %** de quem fez uma troca faz **outra**;
- **0 incidentes graves** (fraude, dados expostos, conflito sério sem resolução);
- os moderadores dizem que **dá menos trabalho** do que o grupo de WhatsApp que já existe.

Se falhar: escrevemos o relatório verdadeiro, guardamos tudo, e não se gasta mais um dia. Nada morre — fica arquivado como o resto.

## 10. O que já está feito (verificável)

| Entregável | Ficheiro | Estado |
|---|---|---|
| Prompt original do CPO | `docs/00_PROMPT_ORIGINAL_CPO.md` | guardado |
| Resposta inicial (este doc) | `docs/01_RESPOSTA_INICIAL_CTO.md` | escrito |
| Guião da Fase 0 | `docs/02_GUIAO_DESCOBERTA.md` | escrito |
| Modelo de dados + RLS | `docs/03_MODELO_DADOS.md` · `sql/001_schema.sql` | escrito, **não aplicado** |
| Protótipo navegável | `prototipo/index.html` | **funciona** — abre no telemóvel |
| Regras da comunidade | `docs/04_REGRAS_COMUNIDADE.md` | rascunho |

**Próximo passo que peço:** responder às 3 perguntas da secção 3 e ver o protótipo no telemóvel com os teus pais. Só depois disso escrevo código de app.
