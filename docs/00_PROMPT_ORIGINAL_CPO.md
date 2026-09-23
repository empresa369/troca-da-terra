# Prompt de desenvolvimento — Plataforma de Trocas Rurais

Copie integralmente o texto abaixo para a IA que irá planear e desenvolver o projeto.

---

## PAPEL

Atua como arquiteto de software, designer de produto, programador full-stack mobile, especialista em segurança e gestor técnico do projeto. A tua missão é desenvolver uma plataforma móvel simples, segura e económica para troca de produtos rurais entre habitantes de uma vila portuguesa.

Não inventes resultados, utilizadores, testes ou funcionalidades concluídas. Distingue sempre claramente entre: planeado, implementado, testado e aprovado para utilização real.

## 1. VISÃO DO PROJETO

Criar uma aplicação independente, com nome provisório **Troca da Terra**, destinada inicialmente a um teste-piloto numa vila de Portugal. A plataforma deve permitir que moradores publiquem produtos rurais que têm disponíveis e proponham trocas por outros produtos.

O projeto será desenvolvido de forma autónoma e não deverá depender da Algo369. No futuro poderá ser integrado na Algo369, por isso a arquitetura deve ser modular, documentada e preparada para integração por API, sem referências visuais ou técnicas obrigatórias à Algo369 na primeira versão.

Os pais do fundador vivem na vila e darão apoio local ao piloto. Eles devem conseguir ajudar pessoas com pouca experiência digital, validar participantes conhecidos e atuar como moderadores locais, sem acesso a dados sensíveis desnecessários.

## 2. OBJETIVO DO PILOTO

Validar se moradores da vila estão dispostos a:

- publicar produtos rurais excedentes;
- indicar o que desejam receber;
- fazer e aceitar propostas de troca;
- combinar a entrega ou recolha de forma segura;
- confirmar que a troca foi concluída;
- avaliar a experiência;
- voltar a utilizar a plataforma.

O piloto deve começar pequeno, preferencialmente com 20 a 50 pessoas conhecidas, e crescer apenas depois de haver utilização real e confiança.

## 3. UTILIZADORES E PAPÉIS

Criar estes papéis:

1. **Utilizador** — publica produtos, pesquisa, propõe trocas, conversa e avalia.
2. **Moderador local** — ajuda no registo, verifica membros conhecidos, analisa denúncias e modera anúncios. Este será o papel inicial dos pais do fundador.
3. **Administrador** — gere categorias, regras, utilizadores, denúncias, métricas e configurações.

Aplicar permissões no backend. Não confiar apenas em botões ocultos na interface.

## 4. ESCOPO DO MVP

### 4.1 Registo e perfil

- Registo por número de telemóvel com código de confirmação; se isso aumentar demasiado o custo do protótipo, permitir inicialmente e-mail e palavra-passe, deixando o telefone preparado para a segunda fase.
- Nome ou nome de exibição.
- Fotografia opcional.
- Freguesia/localidade, sem mostrar a morada exata publicamente.
- Pequena descrição.
- Estado de verificação: não verificado, conhecido/verificado localmente, moderador ou administrador.
- Aceitação obrigatória dos termos, política de privacidade e regras da comunidade.

### 4.2 Produtos rurais

Permitir anúncios de:

- frutas e legumes;
- ovos;
- mel;
- ervas aromáticas;
- sementes e mudas permitidas;
- cereais, farinha e outros produtos locais permitidos;
- compotas, conservas e produtos artesanais, sempre sujeitos às regras legais aplicáveis;
- lenha e produtos florestais de origem legal;
- ferramentas rurais pequenas e materiais relacionados, se o administrador ativar essa categoria.

Cada anúncio deve conter:

- título;
- categoria;
- descrição simples;
- uma a cinco fotografias;
- quantidade e unidade: kg, unidade, dúzia, caixa, saco, litro ou outra;
- estado do produto;
- disponibilidade e data aproximada de validade ou colheita, quando aplicável;
- localidade aproximada;
- raio ou opção de entrega/recolha;
- produtos desejados em troca;
- opção “aceito propostas”;
- estado: rascunho, publicado, reservado, trocado, expirado, removido ou bloqueado.

### 4.3 Pesquisa

- Lista e grelha de anúncios.
- Pesquisa por texto.
- Filtros por categoria, localidade, distância e disponibilidade.
- Ordenação por mais recentes e mais próximos.
- Favoritos.
- Mostrar localização aproximada; nunca revelar automaticamente a morada exata.

### 4.4 Propostas de troca

O utilizador deve poder selecionar um anúncio e propor:

- um produto seu já publicado;
- mais do que um produto, se necessário;
- uma mensagem curta;
- quantidade proposta;
- sugestão de local ou forma de entrega.

Estados da proposta: enviada, em negociação, aceite, recusada, cancelada, concluída ou em disputa.

Na primeira versão, não criar moeda virtual e não processar pagamentos. O foco é a troca direta de produtos. Preparar a estrutura para, mais tarde, permitir trocas mistas com complemento em euros, mas manter isso desativado no piloto.

### 4.5 Chat interno

- Conversa associada a cada proposta.
- Texto e, se for simples e económico, envio de fotografia.
- Notificações de novas mensagens.
- Botão para bloquear e denunciar.
- Não mostrar telefone, e-mail ou morada automaticamente.
- Aviso para não partilhar dados financeiros ou códigos de acesso.

### 4.6 Conclusão e reputação

- Ambas as partes confirmam a conclusão.
- Avaliação simples de 1 a 5 estrelas.
- Etiquetas: produto conforme, pessoa pontual, comunicação boa e troca segura.
- Comentário opcional sujeito a moderação.
- Não permitir avaliação sem proposta aceite.

### 4.7 Administração e moderação

Criar um painel simples, utilizável no telemóvel e no computador, com:

- lista de utilizadores;
- validação local de utilizadores;
- gestão de anúncios e categorias;
- denúncias e bloqueios;
- registo das decisões de moderação;
- métricas do piloto;
- possibilidade de suspender utilizadores;
- exportação dos dados e métricas em CSV;
- trilho de auditoria para ações administrativas.

## 5. O QUE FICA FORA DO PRIMEIRO MVP

Não implementar inicialmente:

- moeda própria ou sistema de créditos;
- pagamentos dentro da aplicação;
- leilões;
- entregas profissionais;
- venda nacional;
- animais vivos;
- medicamentos humanos ou veterinários;
- pesticidas, armas, tabaco, álcool ou produtos ilegais/regulados;
- inteligência artificial complexa;
- integração com a Algo369;
- múltiplos países e moedas.

Estes pontos podem ser avaliados apenas depois do piloto e de revisão legal específica.

## 6. EXPERIÊNCIA E DESIGN

A aplicação deve ser concebida para pessoas de várias idades e com diferentes níveis de experiência digital:

- português de Portugal como idioma inicial;
- letras legíveis e botões grandes;
- linguagem curta e clara;
- publicação de anúncio em poucos passos;
- navegação principal com: Início, Procurar, Publicar, Trocas e Perfil;
- cores inspiradas na terra, agricultura e natureza, com bom contraste;
- funcionamento aceitável em ligações móveis fracas;
- compressão de imagens antes do envio;
- acessibilidade básica e mensagens de erro compreensíveis;
- pedido de confirmação antes de ações importantes.

Criar primeiro wireframes das páginas principais e um protótipo navegável antes de implementar todas as funções.

## 7. TECNOLOGIA RECOMENDADA

Utilizar uma solução simples, económica e com capacidade de crescimento:

- **Aplicação:** React Native com Expo e TypeScript, para Android e iPhone a partir de uma base de código única.
- **Backend inicial:** Supabase com PostgreSQL, autenticação, armazenamento de imagens, funções de backend e atualizações em tempo real.
- **Painel administrativo:** aplicação web responsiva em Next.js ou painel seguro dentro do mesmo ecossistema, escolhendo a alternativa que reduza tempo e custo.
- **Notificações:** Expo Push Notifications.
- **Mapas:** evitar dependência de mapas no primeiro piloto; usar localidade e distância aproximada. Se necessário, integrar OpenStreetMap posteriormente.
- **Testes:** testes unitários das regras principais, testes de integração e roteiro de teste manual em telemóveis reais.

Se propuseres outra tecnologia, explica a vantagem concreta, o custo, a dificuldade de manutenção e o impacto numa futura integração com a Algo369. Não troques de tecnologia sem aprovação.

## 8. ARQUITETURA E PREPARAÇÃO PARA INTEGRAÇÃO FUTURA

- Separar interface, regras de negócio, dados e serviços externos.
- Criar API ou camada de serviços bem documentada.
- Utilizar identificadores UUID.
- Manter as regras de autorização no backend.
- Não colocar segredos ou chaves no código ou na aplicação móvel.
- Usar variáveis de ambiente.
- Criar migrações de base de dados versionadas.
- Documentar eventos importantes: utilizador criado, anúncio publicado, proposta aceite e troca concluída.
- Permitir exportação dos dados pertencentes ao projeto em formatos abertos.
- Preparar autenticação para futura federação de identidade, mas sem ligação real à Algo369 nesta fase.
- Não usar “Algo369” no nome, domínio, logótipo, base de dados pública ou experiência do utilizador do MVP.

## 9. MODELO DE DADOS MÍNIMO

Planear e implementar, pelo menos, estas entidades:

- users/profiles;
- roles e user_roles;
- locations;
- categories;
- listings;
- listing_images;
- listing_wanted_items;
- exchange_proposals;
- proposal_items;
- conversations;
- messages;
- exchange_confirmations;
- ratings;
- favorites;
- reports;
- moderation_actions;
- notifications;
- consent_records;
- audit_logs.

Apresentar o esquema da base de dados, relações, índices, políticas de acesso e regras de eliminação antes da implementação definitiva.

## 10. SEGURANÇA E PRIVACIDADE

- Recolher apenas os dados realmente necessários.
- Cumprir o RGPD e preparar termos e política de privacidade adequados a Portugal, sujeitos a validação jurídica humana.
- Permitir pedido de cópia e eliminação da conta.
- Definir prazos de retenção para mensagens, denúncias e registos.
- Proteger o acesso administrativo com autenticação reforçada.
- Aplicar limitação de tentativas, validação de ficheiros, proteção contra spam e controlo de tamanho das imagens.
- Remover metadados de localização das fotografias quando possível.
- Guardar localização exata apenas se for indispensável e nunca torná-la pública sem consentimento explícito.
- Registar ações administrativas importantes.
- Fazer cópias de segurança e testar a recuperação.
- Nunca prometer que um produto alimentar é seguro ou legal apenas porque foi publicado.

## 11. REGRAS DA COMUNIDADE

Antes de publicar, o utilizador confirma que:

- é responsável pela descrição, origem e condições do produto;
- não publica produtos roubados, ilegais, perigosos ou proibidos;
- informa corretamente o estado, quantidade e eventuais alergénios conhecidos;
- respeita as regras alimentares, sanitárias, agrícolas, florestais e fiscais aplicáveis;
- combina entregas em locais seguros;
- trata os outros membros com respeito.

Adicionar denúncia rápida e revisão humana. Não bloquear automaticamente uma pessoa apenas com base numa única denúncia.

## 12. PAINEL E APOIO DOS PAIS DO FUNDADOR

Criar um modo de operação simples para os moderadores locais:

- lista de pedidos de ajuda;
- validação de pessoas conhecidas presencialmente;
- possibilidade de criar um anúncio assistido, sempre com consentimento do titular;
- instruções grandes e claras;
- nenhuma possibilidade de visualizar palavras-passe;
- nenhuma autorização para alterar dados sensíveis ou concluir trocas em nome de outra pessoa;
- registo de quem realizou cada ação de apoio.

Preparar também um guia curto, imprimível, com instruções para ajudar um morador a instalar a aplicação, criar conta, publicar um produto e responder a uma proposta.

## 13. MÉTRICAS DO PILOTO

Medir apenas o necessário:

- pessoas convidadas;
- contas criadas;
- utilizadores ativos por semana;
- anúncios publicados;
- propostas enviadas e aceites;
- trocas confirmadas;
- tempo médio até à primeira proposta;
- percentagem de pessoas que volta a utilizar a aplicação;
- denúncias, cancelamentos e problemas;
- categorias com maior procura e oferta;
- opinião dos participantes.

Não considerar o piloto bem-sucedido apenas pelo número de instalações. O principal indicador deve ser o número de trocas reais concluídas com segurança.

## 14. FASES DE EXECUÇÃO

### Fase 0 — Descoberta

- Substituir `[NOME DA VILA]`, `[CONCELHO]` e `[DISTRITO]` pelos dados reais.
- Entrevistar os pais do fundador e 5 a 10 moradores.
- Identificar os produtos mais comuns e a forma atual de troca.
- Confirmar conectividade móvel e tipos de telemóvel usados.
- Escrever riscos e hipóteses a validar.

### Fase 1 — Protótipo

- Criar nome provisório, identidade visual leve, mapa de navegação e wireframes.
- Produzir protótipo navegável das funções principais.
- Testar com os pais do fundador e três a cinco moradores.
- Corrigir linguagem e dificuldades antes da programação completa.

### Fase 2 — MVP funcional

- Implementar autenticação, perfis, anúncios, pesquisa, propostas, chat, confirmação, avaliações e moderação.
- Preparar dados de demonstração claramente identificados como fictícios.
- Testar permissões, privacidade, falhas e recuperação.

### Fase 3 — Piloto fechado

- Distribuir inicialmente por teste fechado, sem lançamento nacional.
- Integrar 20 a 50 moradores convidados.
- Dar apoio presencial com os pais do fundador.
- Recolher métricas e feedback por quatro a oito semanas.

### Fase 4 — Decisão

- Apresentar relatório verdadeiro do piloto.
- Identificar o que funcionou, o que falhou, custos e riscos.
- Decidir entre corrigir, expandir para freguesias próximas, monetizar ou encerrar.

## 15. ENTREGÁVEIS OBRIGATÓRIOS

Produzir e manter:

1. documento de visão e escopo;
2. histórias de utilizador e critérios de aceitação;
3. fluxos e wireframes;
4. modelo de dados e políticas de autorização;
5. repositório de código organizado;
6. aplicação Android e iPhone testável;
7. painel de administração/moderação;
8. instruções de instalação e execução;
9. ficheiro `.env.example` sem segredos;
10. testes automáticos e plano de testes manuais;
11. manual dos moderadores locais;
12. regras da comunidade e rascunhos de privacidade/termos;
13. plano de cópias de segurança e recuperação;
14. relatório do piloto e recomendação para a fase seguinte;
15. documento técnico de integração futura, sem efetuar ainda a integração com a Algo369.

## 16. CRITÉRIOS DE ACEITAÇÃO DO MVP

O MVP só pode ser considerado pronto para o piloto quando:

- um utilizador consegue registar-se e iniciar sessão;
- consegue publicar, editar, pausar e remover um anúncio;
- outro utilizador consegue encontrar o anúncio e enviar uma proposta;
- ambos conseguem conversar sem revelar automaticamente dados privados;
- a proposta pode ser aceite, recusada ou cancelada;
- ambas as partes conseguem confirmar a troca;
- apenas participantes de uma troca concluída conseguem avaliar;
- moderadores conseguem receber e tratar denúncias;
- utilizadores comuns não conseguem executar ações administrativas;
- a morada exata não aparece publicamente;
- os fluxos críticos foram testados em pelo menos um Android e um iPhone reais;
- existe procedimento para cópia de segurança e recuperação;
- não existem chaves, palavras-passe ou dados pessoais reais dentro do repositório.

## 17. FORMA DE TRABALHAR E COMUNICAR

- Trabalha por pequenas etapas verificáveis.
- Antes de programar, apresenta as decisões que alteram custo, segurança ou escopo.
- Em cada etapa informa: objetivo, ficheiros alterados, como testar, resultado do teste, limitações e próximo passo.
- Não declares “pronto” sem mostrar os testes efetuados.
- Não aumentes o escopo sem aprovação.
- Dá prioridade à simplicidade, confiança local e facilidade de utilização.
- Quando faltar uma decisão, faz no máximo três perguntas objetivas e oferece uma recomendação.
- Mantém um registo de decisões técnicas e de produto.

## 18. PRIMEIRA RESPOSTA ESPERADA

Não comeces imediatamente a escrever todo o código. Primeiro apresenta:

1. resumo da solução proposta;
2. suposições que estás a fazer;
3. perguntas que realmente bloqueiam o início;
4. arquitetura recomendada e custos mensais estimados para o piloto;
5. plano dividido em etapas pequenas;
6. lista das primeiras páginas da aplicação;
7. modelo inicial de dados;
8. principais riscos técnicos, legais e operacionais;
9. proposta de critérios para decidir se o piloto deve continuar.

Depois aguarda aprovação para iniciar a Fase 0 e o protótipo.

---

### Dados a preencher antes do início

- Nome provisório ou definitivo: `[NOME DO PROJETO]`
- Vila: `[NOME DA VILA]`
- Concelho: `[CONCELHO]`
- Distrito: `[DISTRITO]`
- Nome do administrador: `[NOME]`
- Moderadores locais iniciais: `[NOMES DOS PAIS OU PAPÉIS]`
- Duração pretendida do piloto: `[4 A 8 SEMANAS]`

