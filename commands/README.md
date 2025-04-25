## Comandos de gerenciamento de aplicativos
Os comandos abaixo se aplicam ao trabalhar com aplicativos e executáveis de um computador:

- `whitch`

É um comando externo (dependência) do shell que retorna a localização do arquivo executável de um programa/aplicativo no sistema
```
$ which firefox
/usr/bin/firefox
```
Existe um comando interno do próprio shell, que reproduz o mesmo resultado
```
$ type -p firefox
/usr/bin/firefox
```
ou também
```
command -v firefox
/usr/bin/firefox
```
ou também
```
sh -c 'command -v ls'
```
Porém, esses dois comandos não detecta se de fato um programa existe, mas sim se ele é encontrado na variável `$PATH`. Para verficar de fato se um programa com um determinado nome existe em um sistema de arquivos, use `find`
```
sudo find / -name firefox
```
- https://stackoverflow.com/questions/37056192/which-vs-command-v-in-bash

- https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-then


o .rc (o .profile serve para configurar seu ambiente, não o shell em si).

## Referências
- https://developers.redhat.com/cheat-sheets/linux-commands-cheat-sheet

- https://developers.redhat.com/cheat-sheets/intermediate-linux-cheat-sheet

- https://developers.redhat.com/cheat-sheets/advanced-linux-commands

systemd

- https://developers.redhat.com/cheat-sheets/systemd-commands-cheat-sheet

bash

- https://developers.redhat.com/cheat-sheets/bash-shell-cheat-sheet
