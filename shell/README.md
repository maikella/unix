## Zsh

### Executar um programa

Para executar um programa dentro do terminal zsh, você pode usar o comando ./nome_do_programa:
```
./firefox
```
Caso o programa estiver no seu path, você pode simplesmente digitar o nome dele no terminal e pressionar Enter. 
```
firefox
```
O comando which informa o local do arquivo executável de um programa. Você pode usar esse comando para verificar se um programa está instalado e para descobrir o caminho completo para o arquivo executável.
```
whereis firefox
```
Se você não tiver certeza do nome do programa, pode usar o comando apropos para pesquisar por programas que correspondam a uma palavra-chave:
````
apropos web browser
````
Você pode usar o comando man para ler a página de manual de um programa. A página de manual fornece informações sobre como usar o programa:
```
help which
```

### Navegação

## Como ir para o início e fim de uma linha no terminal zsh:

Mover o cursor para o início da linha
```
Ctrl + A
```
Mover o cursor para o fim da linha
```
Ctrl + E
```
Mover o cursor para a esquerda
```
Ctrl + B
```
Move o cursor para a direita
```
Ctrl + F
```

Deletar caracteres após o cursor
```
Ctrl + D
```
Deletar antes do cursor
```
Ctrl + H
```
Recortar linha completa após o cursor 
```
Ctrl + K
```
Recortar linha completa antes do cursor/apagar linha inteira(zsh)
```
Ctrl + U
```
Recortar palavra antes do cursor
```
Ctrl + W
```
Recortar palavra após o cursor
```
Alt + D
```
Excluir palavra anterior 
```
Alt + Backspace 
```
Trocar palavra atual com o anterior (zsh)
```
Alt + T
```
Reverter  alterações (zsh/bash)
```
Ctrl + 7
Isso funciona porque com ctrl + 7 você envia o sinal de sublinhado(_).
```
Reverter  alterações (bash)
```
Alt + R
```
Histórico de pesquisa
```
Ctrl + R
```
Sair do modo de pesquisa
```
Ctrl + G
```
Eliminar a palavra anterior
```
Alt + Backspace
```
Colar
```
Ctrl + Y
```
Versão do zsh
```
zsh --version
```
## References

https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

https://gist.github.com/2KAbhishek/9c6d607e160b0439a186d4fbd1bd81df

https://copperlight.github.io/shell/zsh-keyboard-shortcuts/

https://gist.github.com/acamino/2bc8df5e2ed0f99ddbe7a6fddb7773a6

https://www.tecmint.com/install-zsh-shell-in-fedora/

https://fedoramagazine.org/set-zsh-fedora-system/

https://zsh.sourceforge.io/
