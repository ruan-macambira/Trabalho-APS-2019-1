## REGRAS DE NEGÓCIO ##
**RN01:** Um Evento só pode ser removido se nenhum artigo tiver sido submetido  
**RN02:** Quando um evento tem seu deadline ultrapassado, ele deve ser automaticamente fechado  
**RN03:** Um administrador não pode ser um aluno  
**RN04:** Um administrador não pode indicar como revisor um autor do artigo  
**RN05:** Um professor só pode revisar no máximo 2 artigos ao mesmo tempo  
**RN06:** Um artigo em um Evento pode estar em quatro estados:  
  * Aguardando Revisão: No momento da submissão do artigo;
  * Em Revisão: Quando foi atribuído um Revisor para o artigo;  
  * Aceito: A Revisão aprovou o Artigo;  
  * Rejeitado: A Revisão rejeitou o Artigo.  

Sempre que houver uma mudança no estado do Artigo, uma mensagem deve ser enviada ao usuário que o submeteu