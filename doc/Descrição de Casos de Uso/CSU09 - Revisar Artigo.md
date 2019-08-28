### Revisar Artigo (CSU09) ###
**Sumário:** Professor revisa artigo que lhe foi atribuído  
**Ator Primário:** Professor  
**Precondições:** Professor identificado pelo sistema  
**Fluxo Principal:**  
  1. include CSU08(Listar Revisões);  
  2. Sistema informa que há artigos pendentes a serem revisados e os lista;  
  3. Professor seleciona um Artigo de Revisão pendente;  
  4. Sistema envia o artigo em questão;  
  5. Professor informa se o tal artigo foi ou não aprovado;  
  6. Sistema atualiza a situação do Artigo de "Em Revisão" para "Aprovado" ou "Reprovado", dependendo da decisão do Professor;  
  7. Sistema Envia Mensagem a Usuário que submeteu Artigo avisando da mudança de situação deste;  
  8. Fim do Caso de Uso;  

**Fluxo Alternativo (3-5):** Professor deseja cancelar operação  
  1. Administrador informa a Sistema que deseja cancelar operação;  
  2. Sistema pede Confirmação;  
  3. Usuário Confirma;  
  4. A Operação é Cancelada;  
  5. Fim do Caso de Uso;  

**Pós-condição:** Mudança na Situação do Artigo; Usuário publicador informado do ocorrido.  
**Regras de Negócio:** RN06  
