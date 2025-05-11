## adduser
No Fedora, não há diferença. `adduser` é um link simbólico para `useradd`. Isso pode ser verificado acessando `/usr/sbin/`. Isso significa que, os dois fazem a mesma coisa. Porém em outros sistemas operacionais como no Debian (e suas variações), tem um comportamento diferente.
```
useradd ariana
```
Ao adicionar um novo usuário, ele é criado em um estado "bloqueado", pois ainda não definimos a senha
```
passwd ariana
```
Oficialmente criado, ele é adicionado em `/etc/passwd`. O arquivo `passwd`, é usado para armazenar informações do usuário.
```
ariana:x:1001:1001::/home/ariana:/bin/bash
```
A entrada acima contém 7 campos separados por dois pontos:

- Primeiro campo - Nome do usuário

O nome do usuário, é usado para efetuar o login no sistema.

- Segundo campo - Senha (x)

O caractere `x`, representa a senha do usuário. Ela é armazenada no arquivo `/etc/shadow` em um formato criptografado.

- Terceiro campo - ID do usuário (1001)

Cada usuário deve ter um ID de usuário (UID), que é o número de identificação do usuário no sistema. Por padrão, o `UID 0`, é reservado para o usuário `root` e os UIDs de 1 a 99 são reservados para outras contas predefinidas. Já os UIDs de 100 a 999, são reservados para contas e grupos do sistema.

- Quarto campo - ID do grupo (1001)

O ID do grupo primário (GID), siginica que é o número de identificação do grupo no sistema, armazenado no arquivo `/etc/group`.

- Quinto campo - Informações do usuário (Opcional)

Este campo permite definir informações extras sobre o usuário, como o nome completo. Essas informações podem ser preenchidas usando comando `finger`.

- Sexto campo - Diretório home

A localização absoluta do diretório home do usuário.

- Sétimo campo - Shell

A localização do shell do usuário, isto é, o shell que o usuário está usando.
## Criar usuário com UID específico e adicioná-lo a um grupo existente
```
sudo useradd -u 1004 -g ariana3 ariana4
```
Por padrão, ao criar usuários, cada um possui o seu próprio GID (identificador de grupo) semelhante ao UID. Com esse comando, estamos criando um usuário, `ariana4`, e especificando seu UID como `1004` com o argumento `-u`, e especificando o GID, adicionando em um grupo diferente (existente) chamado, `ariana3`.

Para verificar qual é o GID de um usuário:
```
id -gn ariana4
```
O argumento `-g`, retorna o GID do grupo primário do usuário (grupo do qual foi criado junto com ele). Já o `-n`, retorna o nome do grupo.
## Como adicionar um usuário a vários grupos
Com o argumento `-G`, é possível adicionar um usuário a grupos adicionais. O nome de cada grupo deve ser separados por vírgula sem espaço entre eles. Lembre-se que só funciona com grupos preexistentes:
```
usermod -aG group1,group2,group user001
```
Por ser um usuário existente, deve ser usado o argumento `-a`, porque ele vai garantir que os grupos anteriores da qual esse usuário faz parte, se mantenham com a adição de novos grupos. Caso seja um novo usuário, o argumento pode ser omitido, visto que, ele ainda não foi inserido no sistema, então não possue grupos.
```
useradd -G group1,group2,group newUser
```
Para verficar quais grupos um usuário faz parte, existem duas formas:
```
id user001
```
Alternativamente:
```
groups user001
```
## Criar um usuário com data de expiração
Por padrão, ao adicionar um usuário, a conta nunca expira, porque sua data de expiração foi definida como `0`. No entanto, adicionando o argumento `-e`, podemos definir uma data de expiração. O formato é `YYYY-MM-DD`. Isso é útil para criar contas temporárias por um período específico.
```
useradd -e 2025-05-11 arianaGrande
```
O usuário `arianaGrande` tem agora uma data de expiração, que 11 de maio de 2025. Para verificar informações de validade de uma conta e da senha, use o comando `chage`:
```
sudo chage -l arianaGrande
```
## Criar um usuário com data de expiração de senha
O argumento `-f` é usado para definir o número de dias após a expiração de uma senha. O valor `0` desativa a conta do usuário assim que a senha expira. Por padrão, o valor de expiração da senha é definido como `-1` (nunca expira).
```
useradd -e 2025-05-11 -f 1 arianaGrande
```
## Referências
https://www.tecmint.com/add-users-in-linux/
