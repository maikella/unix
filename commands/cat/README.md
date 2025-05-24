## Cat
O comando `cat` tem como finalidade cocatenar arquivos, porém ele também pode ser usado para `ler` e `gravar` o conteúdo de arquivos na saída padrão (stdout). O comando `cat` é mais comumente usado para exibir o conteúdo de um ou vários arquivos de texto, combinar arquivos anexando(unindo) o conteúdo de um arquivo ao final de outro arquivo e criar novos arquivos.
## Redirecionando o conteúdo do arquivo
Você pode modificar o fluxo padrão do comando `cat`, que é a saída padrão (stdout) na tela redirecionando para o final de um outro arquivo:
```
file1.txt > file2.txt
```
Esse comando copia o conteúdo do arquivo `file1.txt` para o arquivo `file2.txt`. Vale a observação de que, caso o arquivo `file2.txt` já tenha um conteúdo existente, esse comando, irá sobrescrever TODO o conteúdo do arquivo `file2.txt` pelo conteúdo do arquivo `file1.txt`, isto é, o comando `cat` irá substituir TODO o conteúdo existente para o novo.

Se a sua intenção é copiar o arquivo, use o camando `cp`.
```
cp file.txt file_copy
```
Outra possibilidade é o arquivo `file2.txt` não existir. Caso ele não exista, o comando `cat` criará, caso contrário, ele o sobrescreverá.

Caso o arquivo exista e você não quer sobrescrever todo o conteúdo, você pode usar o operador duplo de maior `>>`. Ao fazer isso, o cocomando `cat` vai adicionar o conteúdo do arquivo `file1.txt` ao final do arquivo `file2.txt`.
## Referências
https://linuxize.com/post/linux-cat-command/
