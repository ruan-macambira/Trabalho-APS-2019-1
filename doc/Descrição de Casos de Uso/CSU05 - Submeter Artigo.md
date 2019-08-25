### Submeter Artigo (CSU04) ###
**Sumário:** Usuário submete um artigo para revisão num evento  
**Ator Primário:** Usuário  
**Precondições:** Usuário identificado pelo sistema  
**Fluxo Principal:**
  1. include CSU01(Pesquisar Evento);
  2. Usuário informa ao sistema que deseja submeter um artigo ao Evento em questão;  
  3. Sistema pede para que Usuário informe:
     * Título;  
     * Autores;  
     * Resumo;  
  e que envie um arquivo contendo o texto do artigo;  
  4. Usuário envia informações que lhe foram requisitadas ao Sistema;
  5. Sistema registra uma nova requisição de Artigo no Evento;
  6. Sistema envia a Usuário uma mensagem avisando-o da atual situação do Artigo, como definido na RN06;
  7. Fim do caso de uso.

**Fluxo Alternativo (2-4)):** Usuário deseja cancelar submissão  
  1. Usuário informa a sistema que deseja cancelar submissão de artigo;
  2. Sistema pede confirmação;
  3. Usuário confirma;
  4. Fim do caso de Uso;

**Fluxo de Exceção (2):** Violação da RN02  
  1. Caso o Usuário tente submeter um artigo num Evento onde o período de submissão já se encerrou, o Sistema o avisará disso;
  2. Fim do Caso de Uso.

**Fluxo de Exceção (4):** Usuário não informa todas as informações pedidas
  1. Caso o Usuário não informe todas as informações pedidas pelo sistema, ele é avisado disso;
  2. Caso de Uso continua no passo 3.

**Pós-condição:** Em caso de sucesso, um novo artigo que será submetido a revisão foi adicionado no sistema.  
**Regras de Negócio:** RN02, RN06