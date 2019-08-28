### Indicar Revisor (CSU04) ###
**Sumário:** Administrador Atribui a tarefa de Revisar um artigo a um Professor  
**Ator Primário:** Administrador  
**Atores Secundários:** Usuário, Professor  
**Precondições:** Administrador identificado pelo sistema  
**Fluxo Principal:**  
  1. include CSU01(Pesquisar Evento);  
  2. Sistema informa que há artigos pendentes para atribuição de Revisor e os lista;  
  3. Administrador seleciona um Artigo submetido no Evento;
  4. include CSU03(Procurar Professor);  
  5. Administrador informa a Sistema que o Professor escolhido será aquele o selecionado no passo anterior;  
  6. Sistema pede confirmação;  
  7. Administrador Confirma;
  9. Sistema atualiza a situação do Artigo de "Aguardando Revisão" para "Em Revisão" (RN06);
  8. Sistema Envia Mensagem a Professor informando que há uma nova revisão que lhe fora atribuída;  
  9. Sistema Envia Mensagem aos Autores do Artigo da mudança de status do artigo, obedecendo à RN06;  
  10. Fim do Caso de Uso.  

**Fluxo Alternativo (3-6):** Administrador deseja cancelar a operação  
  1. Administrador informa ao sistema que deseja cancelar a ação de Indicar um Revisor a um Artigo;  
  2. Sistema pede Confirmação;  
  3. Usuário confirma;  
  4. Sistema Cancela Operação;
  5. Fim do Caso de Uso;

**Fluxo de Exceção (5):** Violação da RN04  
  1. Caso o Administrador tente indicar um dos Autores do Artigo como seu Revisor, o sistema o informará que tal ação não é permitida, e pedirá que escolha outro;  
  2. O Caso de Uso segue no passo 4;  

**Fluxo de Exceção (5):** Violação da RN05  
  1. Caso o Administrador tente indicar um Professor que possui 2 artigos na fila de revisão, o sistema o informará que tal ação não é permitida, e pedirá que escolha outro;  
  2. O Caso de Uso segue no passo 4;  

**Pós-condição:** Mudança de situação do Artigo; Revisor do Artigo e Usuário publicador são informados do ocorrido.  
**Regras de Negócio:** RN04, RN05, RN06  
