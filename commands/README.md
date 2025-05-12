## Comandos de gerenciamento de aplicativos
Os comandos abaixo se aplicam ao trabalhar com aplicativos e executáveis de um computador:

- `whitch`

É um script externo externo (dependência) do shell que retorna a localização do arquivo executável de um programa/aplicativo no sistema
```
$ which firefox
/usr/bin/firefox
```
Existe um comando interno do próprio shell, que reproduz o mesmo resultado
```
$ type -p firefox
/usr/bin/firefox
```
O argumento `-p` (não aliases, funções...) significa que `type` vai procurar apenas executáveis. Por ter acesso aos componentes internos do shell, ele pode fornecer informações mais precisas (até certo ponto)

Em outros shells, um equivalente a `type -p` é:
```
whence -p
```
No shell `tcsh`, o comando `type -a` é equivalente a:
```
where
```
O shell `zsh`, possui todos eles.

Outras alternativas são:
```
command -v firefox
/usr/bin/firefox
```
e também:
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
## Comandos de gerenciamento de console e saída
Os comandos nesta seção se aplicam ao trabalho com dados enviados para stdout ou exibidos na janela de terminal de um computador.

## Variáveis
- PATH

https://www.linfo.org/path_env_var.html

https://medium.com/towards-data-engineering/understanding-the-path-variable-in-linux-2e4bcbe47bf5

https://www.baeldung.com/linux/path-variable

https://unix.stackexchange.com/questions/227989/complete-view-of-where-the-path-variable-is-set-in-bash

## whoami

https://www.reddit.com/r/SysAdminBlogs/comments/16n6s1c/whoami_a_comprehensive_guide_to_user/

A variável `PATH` permite que você execute um executável independentemente de qual diretório você esteja.
## Binário
Um binário (ou um executável) é um programa que pode ser executado porque ele é marcado como executado (.sh)
## Referências
- https://developers.redhat.com/cheat-sheets/linux-commands-cheat-sheet

- https://developers.redhat.com/cheat-sheets/intermediate-linux-cheat-sheet

- https://developers.redhat.com/cheat-sheets/advanced-linux-commands

systemd

- https://developers.redhat.com/cheat-sheets/systemd-commands-cheat-sheet

bash

- https://developers.redhat.com/cheat-sheets/bash-shell-cheat-sheet
