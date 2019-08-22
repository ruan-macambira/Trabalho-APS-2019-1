### Pesquisar Evento (CSU01) ###
**Sumário:** Usuário/Administrador procura por um Evento utilizando-se de alguns parâmetros   
**Ator Primário:** Usuário e Administrador  
**Precondições:** Usuário Identificado pelo Sistema  
**Fluxo Principal:**  
  1. Usuário informa ao sistema que deseja Buscar por um Evento
  2. Sistema apresenta parâmetros nos quais a busca podem ser feitas:  
     * Nome  
     * Situação  
     * Palavras-Chave
  3. Usuário preenche as informações que ele tem sobre o Evento buscado
  4. Sistema Mostra uma Lista contendo todos os Eventos que se encaixam nos parâmetros apresentados pelo Usuário
  5. Usuário escolhe o Evento que buscava
  6. Fim do Caso de Uso

**Fluxo de Exceção(3):** Usuário não informa nada ao sistema  
  a. Sistema Mostra uma Lista contendo todos os Eventos registrados no sistema 
  b. O Caso de uso segue no passo 5  
**Fluxo de Exceção XX:** Não há nenhum evento que condiza com as especificações do usuário  
  a. Sistema Informa a Usuário que nenhum Evento corresponde à busca
  b. Fim do Caso de Uso
**Pós-condição:** Usuário está visualizando um dos Eventos do sistema   
**Regras de Negócio:** Regras de Negócio  