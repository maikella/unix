## grep (global regular expression print)
É um comando usado para pesquisar e comparar padrões de texto em arquivos contidos em expressões regulares. Esse comando pode ser usado para encontrar ou pesquisar uma expressão regular ou uma string em um arquivo de texto.

Temos o seguinte arquivo:
```
cat sobre_ariana.txt

Ariana é uma garota muito bonita, divertida, dócil, disciplinada.

Gosta de experimentar coisas novas, assim como criar novas coisas.

Um ser humano encantador.
```
- Procurar uma string

```
grep 'Ariana' sobre_ariana.txt

Ariana é uma garota muito bonita, divertida, dócil, disciplinada.
```
Caso haja uma correspondência, o comando grep, irá retornar TODAS as linha que tenham essa correspondência.

- Procurar uma string de forma recursiva

Se você está em um diretório e deseja procurar uma string dentro de outros subdiretórios, use o argumento `-r`:
```
grep -r 'Ariana' *
```
- Procurar uma string ignorando o case sensitive

Por padrão, o comando `grep`, vai procurar uma string exatamente igual ao que você forneceu, para contornar isso, adicione o argumento `-i`:
```
grep -i 'ariana' sobre_ariana.txt

Ariana é uma garota muito bonita, divertida, dócil, disciplinada.
```

- Retornar o número de correspondências encontradas
```
grep -c 'Ariana' sobre_ariana.txt
1
```

- Inverter saída do comando grep

Por padrão, o comando `grep`, retorna apenas as linhas correspondêntes, porém, ao adicionar o argumento `-v`, o comando retornará todas as linhas que NÃO correspondem a expressão:
```
grep -v Ariana sobre_ariana.txt

Gosta de experimentar coisas novas, assim como criar novas coisas.
Um ser humano encantador.

grep -vi ser\ humano\ encantador sobre_ariana.txt

Ariana é uma garota muito bonita, divertida, dócil, disciplinada.
Gosta de experimentar coisas novas, assim como criar novas coisas.
```

- Numerar as linhas que contêm o padrão de busca

Você também pode enumerar as linhas das correspondências encontradas, que vai te ajudar a identicar em que linhas elas se encontram:
```
grep -n um sobre_ariana.txt

1:Ariana é uma garota muito bonita, divertida, dócil, disciplinada.
5:Um ser humano encantador.
```
- Procurar a palavra correspondente exata

Por padrão, o grep procura não apenas palavras exatas como também procura dentro de outros palavras o padrão que foi adicionado. Poremplo, anteriormente, você buscou pela string `um`, e foi retornado linhas contendo `Um` e `uma`. Observe que existe `um` dentro de `uma`, mas caso você queira de fato apenas `um`, adicione o argumento `-w`:
```
grep -wi um sobre_ariana.txt

Um ser humano encantador.
```
- Usando o sinal pipe (|) com grep

Como o pipe, podemos filtrar a saída de qualquer comando.

Verificar se um pacote está instalado:
```
rpm -qa | grep gnome-terminal
```
Verificar quais processos estão em execução no seu sistema como usuário `user001`
```
ps -ef | grep user001
```
## Exibir apenas um número de linhas específico antes/depois do padrão 
Você pode usar os argumentos `-A` (After) para depois ou `-B` (Before) para antes, para exibir o número de linhas que sucedem (que vem depois) ou precedem (que vem antes) do padrão.
```
ifconfig | grep -A 2 enp
enp2s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.19  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fd00::eeec:341d:5c5d:c6ba  prefixlen 64  scopeid 0x0<global>
```
Lilhas que precedem o padrão
```
ifconfig | grep -B 3 -w lo
        TX packets 57128  bytes 9591582 (9.1 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
```
Observe que o espaço também foi contado.
## Usando espressões regulares (REGEX) com grep
REGular EXpression é uma sequência de caracteres usada para corresponder a um padrão.

- Procurar caracteres no início da linha `^`
- Procurar caracteres no final da linha `$`
- Procurar qualquer caracter `.`
- Procurar qualquer caracter entre A e Z `[a-z]`
## Referências
https://www.digitalocean.com/community/tutorials/grep-command-in-linux-unix

https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/

https://superuser.com/questions/600975/how-to-use-grep-to-search-for-regular-expressions-themselves-without-parsing-th

https://linuxize.com/post/how-to-use-grep-command-to-search-files-in-linux/

https://www.ibm.com/docs/en/aix/7.3.0?topic=g-grep-command

https://www.geeksforgeeks.org/grep-command-in-unixlinux/


expressões regulares

https://linuxize.com/post/regular-expressions-in-grep/
