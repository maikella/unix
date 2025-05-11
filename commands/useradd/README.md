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
## Como adicionar um usuário a vários grupos
Com o argumento `-G`, é possível adicionar um usuário a grupos adicionais. O nome de cada grupo deve ser separados por vírgula sem espaço entre eles. Lembre-se que só funciona com grupos preexistentes:
```
usermod -aG group1,group2,group user001
```
Por ser um usuário existente, deve ser usado o argumento `-a`, porque ele vai garantir que os grupos anteriores da qual esse usuário faz parte, se mantenham com a adição de novos grupos. Caso seja um novo usuário, o argumento pode ser omitido, visto que, ele ainda não foi inserido no sistema, então não possue grupos.
## Referências
https://www.tecmint.com/add-users-in-linux/
