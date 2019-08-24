### Pesquisar Professor (CSU03) ###
**Sumário:** Administrador pesquisa por um professor por nome ou Área de Concentração   
**Ator Primário:** Administrador  
**Precondições:** Administrador identificado pelo Sistema  
**Fluxo Principal:**
  1. Administrador informa ao sistema que deseja pesquisar por um professor;  
  2. Sistema pede para que Administrador informe alguns parâmetros a fim de filtrar a busca, nenhum deles obrigatório:
     * Nome;  
     * Área de Concentração  
  3. Administrador Informa os parâmetros ao Sistema;  
  4. Sistema exibe resultados filtrados pelos parâmetros informados pelo Administrador;  
  5. Administrador Escolhe um dos Professores;  
  6. Fim do Caso de Uso.

**Fluxo Alternativo (3):** Administrador não informa nenhum parâmetro ao sistema  
  1. Sistema exibe todos os professores registrados no sistema;  
  2. Caso de Uso segue no Passo 5.  

**Fluxo de Exceção (4):** Não há Professores registrados que condizam com os parâmetros do Administrador  
  1. Sistema informa que nenhum professor corresponde à busca;  
  2. Fim do Caso de Uso.  

**Pós-condição:** Em caso de sucesso, Administrador selecionou um professor  