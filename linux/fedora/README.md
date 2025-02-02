## criar um novo usuario

### Adicionar um usuário com diretório home com o comando useradd
```
sudo useradd -m username
```
### Defina uma senha para o novo usuário:
```
sudo passwd username
```
### wheel
Adicione o novo usuário ao grupo wheel (fedora) (ou outro grupo de administradores, dependendo da configuração do seu sistema):
```
sudo usermod -aG wheel username
```
### sudoers (wheel)
Edite o arquivo sudoers, se necessário:

Use visudo para editar o arquivo sudoers e conceder ao novo usuário permissão para usar o sudo. Adicione a seguinte linha ao arquivo:
```
sudo visudo
novousuario ALL=(ALL:ALL) ALL
```
### Teste o novo usuário:

Saia da sessão root e faça login como o novo usuário para verificar se ele tem acesso aos privilégios de administrador. Certifique-se de que tudo esteja funcionando corretamente.

### verificar usuarios
```
sudo -u username whoami
```
### verificar o acesso sudo
```
sudo -l -U <username>
```
### listar usuários
Para exibir todos os usuários do sistema, você pode usar o comando:
```
cat /etc/passwd
```
### Listar apenas os usuários ativos: 
```
cut -d: -f1 /etc/passwd | sort
```
### Listar os usuários em ordem alfabética: 
```
cut -d: -f1 /etc/passwd | sort
```
### remover usuário
-f, –force: Força a remoção da conta do usuário, mesmo que ele esteja logado. Isso também remove o diretório home e o spool de e-mail. No entanto, essa opção deve ser evitada, pois pode deixar o sistema em um estado inconsistente.
exclui o usuário e o diretório home em uma única etapa. A opção -r indica que o comando deve remover o diretório home do usuário.
```
sudo userdel -r nome_do_usuario 
```
Após excluir a conta de usuário e o diretório home, é recomendável limpar o cache do sistema para remover qualquer referência à conta de usuário. Para fazer isso, digite o seguinte comando:
```
$ dnf clean all
```
### listar grupos de um usuário
Execute o seguinte comando para listar os grupos atuais do usuário:
```
groups nome_do_usuário
```
Em seguida, execute o comando para remover o usuário do grupo sudo:
```
sudo gpasswd -d nome_do_usuário wheel
```
eu executei o comando 'dnf clean all', e apareceu ' 71 files' removed. como verifico quais arquivos foram removidos.

Quando você executa dnf clean all, ele remove os arquivos temporários e os caches de pacotes.

ls /var/cache/dnf

### shell para o usuário
Você também pode alterar o shell padrão de um usuário com comando usermod. Digamos que você queira alterar o shell de login para zsh, aqui está o que você pode fazer:
```
sudo usermod -s /bin/zsh username
```
## adicionar usuário simplificado
```
useradd -m -g users -G wheel username
```
