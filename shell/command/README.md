## Comandos Básicos do Linux

### Criar diretório

```
$ mkdir new-directory
```

  * Com nome composto: `$ mkdir "New Directory"`
 
    * Existem outras alternativas para alcançar o mesmo resultado como: `$ mkdir 'New Directory'` e `$ mkdir New\ Directory` (Não esqueça o espaço após a barra invertida)

  * Criar vários diretórios com apenas um comando: `$ mkdir directory1 directory2 directory3`
  
    * Com nome composto: `$ mkdir "Directory 1" 'Directory 2' Directory\ 3`
  
  * Criar diretório e subdiretório no mesmo comando: `$ mkdir -pv directory/subdirectory`

* Copiar diretório: ``$ cp -r path/from/source/ /path/to/destination/``

  * O comando `cp`, tem como objetivo copiar arquivos e diretórios e, o argumento `-r`, permite que você copie diretórios de forma recursiva, que significa que ele copiará todos os arquivos e subdiretórios dentro do diretório de origem

 ### Remover arquivo
 
```
$ rm file.txt
```

* Removendo vários arquivos: `$ rm file1.txt file2.txt file3.txt` 

* Removendo arquivos com caracteres especiais e com espaço: `$ rm "file(1).txt" file\[2\].txt 'file{3}.txt' file\ \?4\!.txt `

 ### Remover diretório

```
$ rm -r directory
```

  * O argumento `-r`, irá remover o diretório de forma recursiva, excluíndo todos os arquivos e subdiretórios que ele contenha

    * Existe também uma outra opção caso você não consiga remover um diretório, que é adicionando o argumento `-f`. Use com muito cuidado, pois é um processo irreversível: `$ rm -rf directory`
     
    * Uma outra opção impopular é o comando `rmdir`, ele remove diretório mas apenas se estiver vazio: `$ rmdir directory`

## grep command
filtrar mais de um termo adicione a flag -E. E para forçar o grep filtrar apenas palavras ao invés de fragmentos, adicione a flag -w. caso queira pesquisar tanto por maiúsculas como minúsculas, adicione a flag -i.
```
lscpu | grep -Ewi 'architecture|model name|cpu mhz'
```

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
