## userdel
Quando `userdel` é invocado, ele lê o arquvivo `/etc/logindefs`. As propriedades definidas nesse arquivo substituem o comportamento padrão de `userdel`. Se `USERGROUPS_ENAB` estiver definido como `yes`, `userdel` vai excluir o grupo com o mesmo nome do usuário, caso não haja nenhum outro usuário nesse mesmo grupo. O comando remove as entradas de usuários dos arquivos `/etc/passwd` e `/etc/shadow`.

Na maioria das distribuições Linux, ao usar o `userdel` sem argumentos para remover um usuário, o diretório `home`, não é removido. Mas ao adicionar o argumento `-r (--remove)`, você força o `userdel` a remover o diretório `home`.
```
userdel -r ari
```
Caso o usuário esteja logado ou se houver processos em execução, o comando `userdel` não permitirá a remoção. Para desconectar e encerrar todos os processos em execução:
```
killall -u ari
```
Alternativamente, você pode usar o argumento `-f (--force)`, que informa ao `userdel` a remoção do usuário, mesmo que ele ainda esteja logado ou se houver processos em execução.
## Referências
https://linuxize.com/post/how-to-delete-users-in-linux-using-the-userdel-command/
