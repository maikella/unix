## ed
```
ed
```
- Ao digitar comandos desconhecidos pelo `ed`, é retornado um sinal de exclamação (?).
```
?
```
- Para conferir, digite `h`. Esse comando vai retornar a causa do erro.
```
h
Unknown command
```
- Caso queira que todas às vezes que houver um erro e quer que, imediatamente, retorne a mensagem de erro, digite `H`
```
H
Unknown command

b
Unknown command
```
- Para sair do `ed`, pressione `q` ou `Q`
```
q

ou

Q
```
- Sair do modo de entrada de linhas, pressione ponto (.)
```
.
```
- Imprimir a linha ATUAL, pressione `p` ou ponto (.)
```
p

ou 

.
```
- Imprimir a linha ATUAL e com o número da linha, pressione `n`
```
n
```
- Mudar de linha, pressione o número da linha
```
3
linha 3
```
- Adicionar uma linha APÓS a atual, pressione `a`
```
a
```
- Adicionar uma linha ANTES da atual, pressione `i`
```
i
```
- Substituir uma linha INTEIRA, pressione `c`
```
c
```
- Excluir uma linha INTEIRA, pressione `d`
```
d (excluir linha atual)

2d (excluir linha 2)
```
- Ver `buffer` INTEIRO, pressione `,p` ou `1,$p`
```
,p
```
- Ver apenas um intervalo específico do `buffer`, pressione `1,np`, onde `n`, é o intervalo que você vai definir
```
1,2p (imprimir apenas as duas primeiras linhas do buffer)
```
- Pesquisar de forma progressiva (de frente para trás)
```
/Ariana
```
- Pesquisar de forma regressiva ( de trás para frente)
```
?Ariana
```
- Para TODAS as informações do `buffer`, pressione `w` seguido do nome do arquivo de preferência. Ao fazer isso, será retornado o número de `bytes` escritos no arquivo.
```
w glinda.txt
```
- Para salvar apenas um subconjunto específico de informações, o `w`, aceita um intervalo específico.
```
1,2w glinda.txt (salvar apartir da linha 1 à linha 2)
4,7w glinda.txt (salvar apartir da linha 4 à linha 7)
```
- Caso queira adicionar uma informação em um arquivo já existente, e não quer substituí-lo, use `W`. Note que, essa informação, vai ser adicionada ao final do arquivo que você escolher.
```
1,3W glinda.txt
```
- Retornar o número de linhas de um arquivo
```
r glinda.txt
109
```
## Para editar um arquivo existente
```
ed glinda.txt
```
## Referências
Básico

- https://medium.com/predict/using-ed-the-unix-line-editor-557ed6466660

- https://wiki.c2.com/?EdIsTheStandardTextEditor

