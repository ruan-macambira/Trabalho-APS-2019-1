### Manter Cadastro de Usuário (CSU07) ###
**Sumário:** Usuário gerencia seu cadastro  
**Ator Primário:** Usuário  
**Precondições:** Nenhuma  
**Fluxo Principal:** Cadastro
  1. Usuário informa ao Sistema que deseja se cadastrar;
  2. Sistema pede que Usuário informe:
     * Nome Completo;
     * E-mail;
     * Confirmação do E-mail;
     * Senha;
     * Confirmação da Senha;
     * Instituição;
     * Matrícula, caso seja Aluno;
     * Titulação, caso seja Professor;
     * Área de Pesquisa, caso seja Professor;
  3. Usuário envia informaçõe requisitadas pelo Sistema;
  4. Sistema registra novo Usuário no Sistema;
  5. Fim do Caso de Uso;

**Fluxo Alternativo 00(2, 3):** Usuário deseja cancelar Operação
  1. Usuário informa que deseja cancelar operação de cadatro;
  2. Sistema pde confirmação;
  3. Usuário confirma;
  4. A Operação é cancelada;
  5. Fim do Caso de Uso;

**Fluxo Alternativo 01(1):** Usuário deseja editar seu cadastro
  1. Usuário se identifica ao Sistema;
  2. Sistema reconhece Usuário;
  3. Usuário informa a Sistema que deseja alterar suas informações de cadastro;
  4. Sistema envia as informações cadastrais que o Usuário pode alterar e pede para que ele informe quais deseja alterar, bem como com o que será substituído;
  5. Usuário informa o que o Sistema requisitou;
  6. Sistema atualiza as informações do cadastro com as que foram enviadas pelo Usuário;
  7. Fim do Caso de Uso.  

**Fluxo Alternativo 02(1):** Usuário deseja remover seu próprio cadastro
  1. Usuário se identifica ao sistema;
  2. Sistema reconhece Usuário;
  3. Usuário informa a Sistema que deseja remover seu cadastro;
  4. Sistema pede confirmação;
  5. Usuário confirma;
  6. Sistema remove Usuário da base de dados, e não mais o identifica;
  7. Fim do Caso de Uso.  

**Fluxo de Exceção (3):** Usuário não informa todas as informações requisitadas pelo Sistema
  1. Sistema avisa que usuário não enviou todas as informações pedidas, e pede para que o faça;
  2. Caso de Uso continua no passo 3.

**Fluxo de Exceção (3):** Usuário enviou informações inconsistentes ao Sistema
  1. Caso o usuário tenha enviado uma confirmação (de E-mail ou senha) que não esteja exatamente igual a seu respectivo campo de comparação, o sistema informa e pede para que ponha o mesmo valor nos campos;
  3. Caso de Uso continua no passo 3.

**Pós-condição:** Base de Dados de Usuários atualizada  
**Regras de Negócio:** Regras de Negócio  