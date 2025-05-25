## Cat
O comando `cat` tem como finalidade cocatenar arquivos, porém ele também pode ser usado para `ler` e `gravar` o conteúdo de arquivos na saída padrão (stdout). O comando `cat` é mais comumente usado para exibir o conteúdo de um ou vários arquivos de texto, combinar arquivos anexando(unindo) o conteúdo de um arquivo ao final de outro arquivo e criar novos arquivos.
## Redirecionando o conteúdo do arquivo
Você pode modificar o fluxo padrão do comando `cat`, que é a saída padrão (stdout) na tela redirecionando para o final de um outro arquivo:
```
cat file1.txt > file2.txt
```
Esse comando copia o conteúdo do arquivo `file1.txt` para o arquivo `file2.txt`. Vale a observação de que, caso o arquivo `file2.txt` já tenha um conteúdo existente, esse comando, irá sobrescrever TODO o conteúdo do arquivo `file2.txt` pelo conteúdo do arquivo `file1.txt`, isto é, o comando `cat` irá substituir TODO o conteúdo existente para o novo.

Se a sua intenção é copiar o arquivo, use o camando `cp`.
```
cp file.txt file_copy
```
Outra possibilidade é o arquivo `file2.txt` não existir. Caso ele não exista, o comando `cat` criará, caso contrário, ele o sobrescreverá.

Caso o arquivo exista e você não quer sobrescrever todo o conteúdo, você pode usar o operador duplo de maior `>>`. Ao fazer isso, o comando `cat` vai adicionar o conteúdo do arquivo `file1.txt` ao final do arquivo `file2.txt`.
```
cat file1.txt >> file2.txt
```
Vale mencionar também que, caso o arquivo em que você queira redirecionar o conteúdo não exista, o comando `cat`, vai criar esse arquivo.
## Exibir o número de linha
Para exibir o conteúdo do arquivo e ao mesmo tempo o número de linhas, adicione o argumento `-n`:
```
cat -n glinda.txt

     1	linha 5 muito bonita
     2	linha 6 muito feia
     3	linha 7 muito bonita
     4	linha 8 muito feia
     5	linha 1
     6	linha 3 nova
     7	linha 4
```
## Cocatenar arquivos
Ao passar dois ou mais nomes de arquivos como argumentos para o comando `cat`, o conteúdo dos arquivos será cocatenado. O comando `cat`, vai ler os arquivos na mesma sequência que foi passada em seus argumentos e exibe o conteúdo do arquivo na mesma sequência. Por elo:
```
cat -n glinda2.txt glindaC.txt
```
Por padrão, a saída do comando `cat` é na tela (stdout), mas caso você queira gravar a saída em outro arquivo:
```
cat glinda2.txt glindaC.txt > exemplo1.txt
```
Lembrando que, se o arquivo `exemplo1.txt` já existir, o comando `cat` o sobrescreverá. Mas se sua intenção não é sobrescrever o arquivo, você pode usar o operdaor maior duplo `>>` ao invés de um único operador maior como no exemplo acima.
```
cat glinda2.txt glindaC.txt >> exemplo1.txt
```
## Criar arquivos
Criar arquivos pequenos com `cat` é mais fácil em comparação com outros editores de texto. Para criar um novo arquivo, use o comando `cat` seguido do operador de redirecionamento `>` e o nome do arquivo que deseja criar. Pressione a tecla `Enter`, digite o texto e, ao terminar, pressione `Ctrl+D` para sair e salvar o arquivo.
```
cat > ariana.txt
```
Se um arquivo `ariana.txt` já estiver presente em seu diretório, ele será sobrescrito. Use o duplo operador de redirecionamento `>>` para que ele adicione o conteúdo logo após de onde você parou.
## Referências
https://linuxize.com/post/linux-cat-command/
