### Manter Evento (CSU 02) ###
**Sumário:** Administrador usa sistema para atualizar cadastros de Eventos  
**Ator Primário:** Administrador  
**Precondições:** Administrador identificado pelo sistema  
**Fluxo Principal:**  
  1. O Administrador indica ao sistema que deseja cadastrar um Evento no sistema  
  2. O Sistema pede para que o Administrador que informe detalhes sobre o evento
  3. O Administrador informa dados referentes ao Evento:
     * Nome do Evento;  
     * Data de Início do Evento;  
     * Data de Término do Evento;  
     * Data de Inicío da Submissão de Artigos;  
     * Data do Fim do prazo de Submissão;  
     * Área de Concentração (escolher entre cadastradas no sistema);  
     * Palavras-Chave (escolher entre cadastradas no sistema);  
  4. O Sistema registra um novo Evento no Sistema  

**Fluxo Alternativo 00(FP: 2,3; FA01: c,d):** Administrador deseja  cancelar operação 
  a. Administrador informa que deseja cancelar operação 
  b. Sistema pede confirmação  
  c. Usuário confirma  
  d. Fim do Caso de Uso  

**Fluxo Alternativo 01(1):** Administrador deseja editar as informações de um dado Evento  
  a. include CSU01  
  b. Administrador informa ao sistema que deseja alterar informações do Evento em questão  
  c. Sistema apresenta todas as informações do Evento, pedindo que Administrador informe que informações deseja alterar  
  d. Administrador informa quais informações ele deseja alterar, bem como pelo que ele há de substituir  
  e. Sistema registra alterações feitas no Evento  
  f. Fim do Caso de Uso  

**Fluxo Alternativo 02(1):** Administrador deseja remover um Evento
  a. include CSU01  
  b. Administrador informa ao sistema que deseja remover o Evento em questão  
  c. Sistema pede confirmação  
  d. Administrador confirma  
  e. Sistema remove Evento do sistema
  f. Fim do Caso de Uso

**Fluxo de Exceção (FP: d):** Violação à RN01
  a. Caso o Evento que o Administrador deseja excluir contenha artigos vinculados a ele, o Sistema deve impedir sua remoção, informando ao Administrador do ocorrido
  b. Fim do Caso de Uso

**Pós-condição:** A Base de Dados de Eventos é atualizada  
**Regras de Negócio:** RN01  