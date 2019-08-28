### Manter Evento (CSU 02) ###
**Sumário:** Administrador usa sistema para atualizar cadastros de Eventos  
**Ator Primário:** Administrador  
**Precondições:** Administrador identificado pelo sistema  
**Fluxo Principal:**  
  1. O Administrador indica ao sistema que deseja cadastrar um Evento no sistema;  
  2. O Sistema pede para que o Administrador que informe detalhes sobre o evento;  
  3. O Administrador informa dados referentes ao Evento:
     * Nome do Evento;  
     * Data de Início do Evento;  
     * Data de Término do Evento;  
     * Data de Início da Submissão de Artigos;  
     * Data do Fim do prazo de Submissão;  
     * Área de Concentração (escolher entre cadastradas no sistema);  
     * Palavras-Chave (escolher entre cadastradas no sistema);  
  4. O Sistema registra um novo Evento no Sistema.  

**Fluxo Alternativo 00(FP: 2, 3; FA01: 3, 4):** Administrador deseja cancelar operação 
  1. Administrador informa que deseja cancelar operação 
  2. Sistema pede confirmação;  
  3. Usuário confirma;  
  4. Fim do Caso de Uso.  

**Fluxo Alternativo 01(1):** Administrador deseja editar as informações de um dado Evento  
  1. include CSU01(Pesquisar Evento);  
  2. Administrador informa ao sistema que deseja alterar informações do Evento em questão;  
  3. Sistema apresenta todas as informações do Evento, pedindo que Administrador informe que informações deseja alterar;  
  4. Administrador informa quais informações ele deseja alterar, bem como pelo que ele há de substituir;  
  5. Sistema registra alterações feitas no Evento;  
  6. Fim do Caso de Uso.  

**Fluxo Alternativo 02(1):** Administrador deseja remover um Evento
  1. include CSU01(Pesquisar Evento);  
  2. Administrador informa ao sistema que deseja remover o Evento em questão;  
  3. Sistema pede confirmação;  
  4. Administrador confirma;  
  5. Sistema remove Evento do sistema;  
  6. Fim do Caso de Uso.  

**Fluxo de Exceção (FP: d):** Violação à RN01  
  1. Caso o Evento que o Administrador deseja excluir contenha artigos vinculados a ele, o Sistema deve impedir sua remoção, informando ao Administrador do ocorrido  
  2. Fim do Caso de Uso  

**Pós-condição:** A Base de Dados de Eventos é atualizada  
**Regras de Negócio:** RN01  
