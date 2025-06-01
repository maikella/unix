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

Por padrão, o comando `grep`, retorna apenas as linhas correspondêntes, porém, ao adicionar o argumento `-v`, o comando retornará todas as linhas que não correspondem a expressão:
```
grep -v Ariana sobre_ariana.txt

Gosta de experimentar coisas novas, assim como criar novas coisas.
Um ser humano encantador.
```
## Referências
https://www.digitalocean.com/community/tutorials/grep-command-in-linux-unix
