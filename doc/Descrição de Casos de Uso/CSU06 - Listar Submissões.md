### Listar Submissões (CSU06) ###
**Sumário:** Lista as Submissões Feitas pelo Usuário    
**Ator Primário:** Usuário  
**Precondições:** Usuário identificado pelo sistema  
**Fluxo Principal:**
  1. Usuário Informa a Sistema que deseja visualizar suas submissões;  
  2. Sistema retorna todas as suas submissões;  
  3. Usuário pede para que sistema filtre os resultados baseado em:
     * Status; (RN06)
     * Evento;
     * Data de Submissão;
  4. Sistema exibe resultados filtrados;
  5. Fim do caso de uso;

**Fluxo Alternativo (1-4):** Usuário deseja cancelar operação  
  1. Usuário informa ao sistema que deseja cancelar operação;
  2. Sistema pede que Usuário confirme;  
  3. Usuário confirma;  
  4. Operação é cancelada;  
  5. Fim do Caso de Uso;  

**Fluxo de Exceção XX:** Não há nenhuma submissão que condiza com os filtros definidos pelo Usuário  
  1. Sistema informa a Usuário que nenhum item corresponde à busca;
  2. Fim do Caso de Uso;

**Pós-condição:** Usuário é capaz de visualizar suas submissões  
**Regras de Negócio:** RN06  