# Troca da Terra

Aplicação de **troca direta de produtos rurais** entre habitantes de uma vila portuguesa.
Projeto **independente** (não depende da Algo369; arquitetura preparada para integração futura por API).

**Estado: Fase 1.5 — app de campo, a funcionar.** Guarda mesmo no telemóvel (localStorage), sem servidor e sem internet. Ainda não há Supabase nem contas na nuvem.

## A app (`app/`)
Abre `app/index.html` — ou, quando estiver publicada, `https://empresa369.github.io/troca-da-terra/`.
No telemóvel: menu do browser → **Adicionar ao ecrã principal** → fica com ícone, como uma aplicação.

Faz de verdade: criar utilizador · publicar produto com fotografias (encolhidas no telemóvel) · procurar e filtrar por categoria/freguesia · propor troca · conversar · confirmar dos dois lados · avaliar · **publicação assistida pelo moderador** (para quem não se desenrasca) · exportar tudo em JSON (Perfil → Guardar cópia).

**Testado no browser a 375 px (23/09):** publicação, publicação assistida, persistência depois de recarregar, proposta, mensagens, confirmação dupla → concluída. 0 erros de JavaScript.
⚠️ **Por verificar:** o funcionamento sem internet (service worker) não registou no painel de testes; tem de ser confirmado no telemóvel depois de publicada em HTTPS.

## O protótipo antigo (`prototipo/`)
Versão só de cliques, com exemplos fictícios. Serve para mostrar o aspeto; a app é a de cima.

## Material para a feira (`feira/`)
`FOLHA_DA_FEIRA.pdf` — A4 para imprimir: como mostrar em 2 minutos, como publicar por alguém, as 8 perguntas, tabela para anotar, o que responder às dúvidas típicas, e o QR para abrir no telemóvel.

## Estrutura
```
docs/  00_PROMPT_ORIGINAL_CPO.md     prompt integral do CPO (fonte)
       01_RESPOSTA_INICIAL_CTO.md    resumo, custos, riscos, plano, 3 perguntas
       02_GUIAO_DESCOBERTA.md        Fase 0: perguntas aos pais e a moradores
       04_REGRAS_COMUNIDADE.md       rascunho (a validar por jurista)
sql/   001_schema.sql                19 tabelas + RLS — escrito, NÃO aplicado
prototipo/index.html                 protótipo navegável (1 ficheiro, 0 dependências)
```

## Custo até aqui
0 €. Custo previsto do piloto: 0 €/mês (Expo Go + Supabase free). Lojas de aplicações só depois do piloto, se compensar.

## Decidido (23/09/2026)
1. **Vila Pouca de Aguiar, Vila Real** — 14 freguesias já no protótipo; nome «Troca da Terra» mantém-se por agora
2. **Registo por email+palavra-passe** no piloto (SMS custa por mensagem; campo do telefone já preparado) — ver `docs/06_REGISTO_E_PAPEIS.md`
3. **Moderadores: pai e mãe** — são também utilizadores com produtos; mais 8–15 vizinhos verificados

## Ainda por decidir
- Confirmar a data da Feira das Cebolas (25–26 set) e se os teus pais lá vão fazer a Fase 0
- Queijo fresco/requeijão: dentro ou fora do piloto (recomendação: fora)
