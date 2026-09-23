# Como as pessoas entram — e como tu entras (decisão 2 e 3)

> Pergunta do CEO (23/09): *«e a forma de registo das pessoas, ou a minha como fundador?»*
> Resposta: são **dois caminhos diferentes**, de propósito. O teu é uma vez só e feito por dentro; o dos vizinhos tem de ser à prova de quem nunca instalou nada.

---

## 1. Tu, fundador

Não te registas como toda a gente. A tua conta é **semeada** na base de dados no dia em que ligarmos o Supabase:

- conta criada por mim com o teu email
- papéis: `admin` **e** `utilizador` (um papel não tira o outro — é a mesma regra do IDENTITY369: uma pessoa, vários papéis)
- verificação: `verificado_local` desde o primeiro dia
- acesso ao painel de administração (categorias, utilizadores, denúncias, métricas, exportar CSV)

**Ninguém se pode registar como administrador pela aplicação.** Só existe administrador se for criado por dentro. É a diferença entre uma porta e um botão.

## 2. Os teus pais — moderadores locais

Contas normais, criadas por ti no painel, com o papel `moderador` acrescentado.

**Podem:**
- validar vizinhos que conhecem pessoalmente («esta pessoa é de cá») → o vizinho ganha o selo ✔
- ajudar a publicar um anúncio pelo telemóvel da pessoa, com ela ao lado e com o consentimento registado
- receber e resolver denúncias
- ver quem pediu ajuda

**Não podem — e isto está no código, não na boa vontade:**
- ver palavras-passe (ninguém vê, nem eu)
- concluir uma troca em nome de outra pessoa
- alterar dados de outra pessoa
- apagar avaliações sem deixar registo

Cada ação de moderação fica gravada com quem fez, quando e porquê (`moderation_actions` + `audit_logs`).

## 3. Os vizinhos — três formas de entrar, por ordem de facilidade

### A. Convite (a via normal do piloto)
Tu ou os teus pais geram um **link de convite**. A pessoa toca, escreve nome, escolhe a freguesia, cria palavra-passe. Fica logo ligada a quem a convidou — e é assim que se sabe que não entrou ninguém de fora.

### B. Registo assistido (para quem não se desenrasca com telemóveis)
O teu pai ou a tua mãe estão ao lado, com o telemóvel **da pessoa** na mão. Preenchem juntos, a pessoa escolhe a palavra-passe (ou o moderador gera uma e ela muda depois), e a aplicação regista: *conta criada com apoio de [moderador], com consentimento presencial*.

### C. Só a ver (sem conta)
Uma pessoa pode espreitar os anúncios sem se registar. Só precisa de conta para **propor troca ou publicar**. Tira o medo a quem não quer «dar os dados» logo à primeira.

## 4. Email ou telemóvel? — a minha recomendação, com o custo à vista

| | Email + palavra-passe | Telemóvel + código SMS |
|---|---|---|
| Custo | **0 €** | ~0,03–0,05 € por SMS (paga-se por cada tentativa, inclusive as falhadas) |
| Quem não tem | alguns idosos não têm email | quase toda a gente tem telemóvel |
| Esquecimento | recupera por email | recupera por SMS (paga outra vez) |
| Tempo até funcionar | imediato | precisa de conta e saldo num fornecedor de SMS |

**Recomendação: email+palavra-passe no piloto.** O campo do telemóvel já está na base de dados (`profiles.telefone` + `telefone_verif`) — ligamos o SMS na 2.ª fase, se o piloto provar que vale a pena.

**E quem não tem email?** Duas saídas, ambas previstas:
- o moderador cria um email gratuito com a pessoa (5 minutos, fica dela);
- ou usa-se o email de um familiar com autorização, e o nome de exibição é o da pessoa.

## 5. Quem são os primeiros — resposta ao teu ponto 3

Percebi: **os teus pais entram porque têm produtos**, não só porque moderam. São as duas coisas, e não há conflito nenhum nisso — desde que fique claro na app.

Proposta concreta para o arranque:

| Quem | Papel | Porquê |
|---|---|---|
| Tu | admin + utilizador | dono do projeto |
| Pai | moderador + utilizador | tem produtos e conhece toda a gente |
| Mãe | moderadora + utilizadora | idem, e é quem ajuda quem tem menos prática |
| 8–15 vizinhos | utilizadores verificados | os que a Fase 0 identificar com excedentes reais |

**Regra de honestidade que vou pôr no código:** quando um moderador publica um anúncio **seu**, o anúncio aparece marcado como qualquer outro — sem destaque, sem prioridade na lista. Um moderador não tem montra maior do que um vizinho. Se isso não ficar claro, a confiança da vila desfaz-se ao segundo mês.

## 6. O que isto muda no que já está feito

- `sql/001_schema.sql` já tem `roles`, `user_roles`, `estado_verificacao` e `consent_records` — cobre tudo isto sem alterações.
- Falta acrescentar, quando fizermos a Fase 2: tabela `invites` (código do convite, quem convidou, usado em) e o registo de «conta criada com apoio de X».
