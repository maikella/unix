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
