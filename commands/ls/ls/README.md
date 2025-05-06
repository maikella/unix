## ls (abriviação de list)
O comando `ls` tem como objetivo listar o conteúdo de um diretório. Por padrão, ele vai listar arquivos em ordem alfabética.
```
ls
```
Arquivos que começam com ponto (.), chamados de `dot files`, não são listados, a menos que você adicione a flag `-a` ou `-A`. Esses arquivos são chamados de arquivos ocultos, que são arquivos especiais que armazenam configurações do usuário e dados de configuração, usados programas e serviços em execução para ler e armazenar informações.

Por exemplo, o arquivo `.bashrc` é um script que contém as configurações do usuário conectado no momento, incluindo aliases de comando, histórico do shell, a cor da fonte do terminal, etc.

O arquivo .bash_logout é executado quando você sai das suas sessões bash. Ele é usado principalmente para fins de limpeza, ou seja, para realizar quaisquer operações que precisem ser realizadas após você sair do shell bash.

Para listar arquivos e diretórios.
```
ls -a
```
## Mostrar Arquivos Ocultos sem . e .. Implícitos
Ao listar arquivos ocultos, os primeiros "arquivos" são `.` e `..`, que são diretórios implícitos. Para omitir esses arquivos, use a flag `-A`.
```
ls -A
```
Para informações mais detalhadas, adicione o argumento `-l`. A saída já vai ter um formato em colunas, com informações adicionais, como proprietário do arquivo, data e hora de modificação, etc.
```
ls -l

drwxr-xr-x. 1 user001 user001  56 Feb 11 13:54 bsd
drwxr-xr-x. 1 user001 user001  36 May  5 16:46 commands
drwxr-xr-x. 1 user001 user001  18 Apr 21 18:01 editors
drwxr-xr-x. 1 user001 user001 190 Feb  1 21:54 linux
-rw-r--r--. 1 user001 user001  73 Feb  2 13:38 README.md
drwxr-xr-x. 1 user001 user001  40 Feb  2 13:16 shell
```

- Primeira coluna são as permissões que cada diretório e arquivo possuem.

- Segunda coluna são números de links simbólicos que cada arquivo possue.

- Terceira e Quarta coluna são as entidades que são donas desses arquivos.

- Quinta coluna indica o tamanho em `bytes` de cada arquivo.

- Sexta, Sétima e Oitava coluna é a data e hora da última modificação do arquivo.

- A última coluna se refere ao nome do arquivo/diretório

## Listar todos os arquivos
```
ls -a
```
## Listar arquivos com tamanho em um formato legível
Com isso, agora a saída exibe o tamanho do arquivo em quilobytes, megabytes e gigabytes, enquanto por padrão é em `bytes`.
```
ls -lh
```
## Distinguir Diretórios e Arquivos no Linux
Em um cenário onde você não tem as cores para ajudar a distinguir diretórios de arquivos, você pode adicionar a flag `-F`.
```
ls -F
```
## Classificando Arquivos em Ordem Reversa
Por padrão, o comando ls classifica arquivos e diretórios em ordem alfabética (de A a Z). Você pode optar por classificar o conteúdo do diretório em ordem reversa usando a opção -r (Z a A).
```
ls -r
```
## Listar Arquivos Recursivamente no Linux
A opção -R lista arquivos recursivamente. Primeiro, o comando lista todos os arquivos e diretórios no seu diretório atual e, a cada diretório, ele vai listar todo o conteúdo desse diretório, caso haja subdiretórios dentro desse diretório, ele também vai listar todo o conteúdo contido neles e assim sucessivamente.
```
ls -R
```
## Classificar arquivos por hora de modificação no Linux
Com a flag `-t` é possível exibir arquivos recentemente modificados com base na data/hora da última modificação.
```
ls -t
```
## Classificar arquivos por tamanho no Linux
Com a combinação da opção -lS, o tamanho do arquivo será exibido em ordem decrescente (do maior para o menor).
```
ls -S
```
## Omita a Propriedade (coluna) Grupo no Formato de Lista Longa
Por padrão, a flag `-l`, lista tanto as propriedades do usuário quanto do grupo. Você pode optar por omitir a coluna da entidade grupo passando a opção apenas a flag `-g`.
```
ls -g
```
## Listar Tipos de Arquivo ou Extensões Específicas
Para listar tipos de arquivo ou extensões específicas, use a notação curinga (wildcard notation) (\*) seguida da extensão do arquivo.
```
ls *jpeg
ls *png
ls *txt
```
## Listar todos os alias do sistema
```
alias
```
## Adicionar um alias
```
alias ls='ls --color=auto'
```
## Remover um alias de um comando
```
unalias ls
```
## Referências

- https://www.tecmint.com/ls-command-in-linux/

