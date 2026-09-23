# Troca da Terra

Aplicação de **troca direta de produtos rurais** entre habitantes de uma vila portuguesa.
Projeto **independente** (não depende da Algo369; arquitetura preparada para integração futura por API).

**Estado: Fase 1 — protótipo navegável.** Não há base de dados, contas reais nem app publicada.

## Como ver o protótipo
Abre `prototipo/index.html` no browser (ou no telemóvel). Funciona sem internet e sem instalar nada.
O fluxo completo está clicável: início → anúncio → propor troca → conversa → confirmar → avaliar, mais o ecrã de moderação (Perfil → Moderação local).

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
