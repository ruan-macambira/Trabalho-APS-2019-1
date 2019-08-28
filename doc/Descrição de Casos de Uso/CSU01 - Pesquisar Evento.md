### Pesquisar Evento (CSU01) ###
**Sumário:** Usuário/Administrador procura por um Evento utilizando-se de alguns parâmetros   
**Ator Primário:** Usuário e Administrador  
**Precondições:** Usuário Identificado pelo Sistema  
**Fluxo Principal:**  
  1. Usuário informa ao sistema que deseja Buscar por um Evento;  
  2. Sistema apresenta parâmetros nos quais a busca podem ser feitas:  
     * Nome;  
     * Situação;  
     * Palavras-Chave;
  3. Usuário preenche as informações que ele tem sobre o Evento buscado;  
  4. Sistema Mostra uma Lista contendo todos os Eventos que se encaixam nos parâmetros apresentados pelo Usuário;  
  5. Usuário escolhe o Evento que buscava;  
  6. Fim do Caso de Uso.  

**Fluxo de Exceção(3):** Usuário não informa nada ao sistema  
  1. Sistema Mostra uma Lista contendo todos os Eventos registrados no sistema;  
  2. O Caso de uso segue no passo 5.  

**Fluxo de Exceção (4):** Não há nenhum evento que condiza com as especificações do Usuário  
  1. Sistema Informa a Usuário que nenhum Evento corresponde à busca;  
  2. Fim do Caso de Uso.  

**Pós-condição:** Em caso de sucesso, o Usuário está visualizando um dos Eventos do sistema   
