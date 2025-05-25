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
- Caso tenha terminado de inserir as informações nescessárias, para sair do modo de entrada de linhas, pressione ponto (.)
```
.
```
- Imprimir a linha ATUAL, pressione `p` ou ponto (.)
```
p ou .
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
- Excluir uma linha INTEIRA (ou intervalo), pressione `d`
```
d (excluir linha atual)

2d (excluir linha 2)

5,7d //excluir o intervalo entre 5 e 7, e eles mesmos
```
- Ver `buffer` INTEIRO, pressione `,p` ou `1,$p`
```
,p
```
- Ver `buffer` INTEIRO COM NÚMERO de linhas, pressione `,n` ou `1,$n`
```
,n
```
- Ver apenas um intervalo específico do `buffer`, pressione `1,np`, onde `n`, é o intervalo que você vai definir
```
1,2p (imprimir apenas as duas primeiras linhas do buffer)
```
## Operações de pesquisa
- Pesquisar de forma progressiva (de frente para trás ou de cima para baixo)
```
/Ariana
```
- Pesquisar de forma regressiva (de trás para frente ou debaixo para cima)
```
?Ariana
```
Para continuar a pesquisa, execute o comando novamente até chegar ao objetivo. Caso queira ver o número da linha ao encontrar o valor da pesquisa, adicione `/n`, seguida da pesquisa:
```
/Ariana/n

?Ariana?n
```
### Operação de pesquisa sem diferenciar letras maiúsculas de minúsculas
Para que o `ed` busque algo sem se importar com a capitalização, adicione no final do comando `I`:
```
/ariana/I
```
O mesmo vale para a pesquisa regressiva:
```
?ariana?I
```
## Salvar buffer 
- Para salvar TODAS as informações do `buffer`, pressione `w` seguido do nome do arquivo de preferência. Ao fazer isso, será retornado o número de `bytes` escritos no arquivo.
```
w glinda.txt //caso o arquivo não exista, adicione o nome e sua extenção

w //caso o arquivo já exista
```
Caso o arquivo já exista, e queira gravar as modificações em um arquivo diferente do atual, expecifique um nome de arquivo diferente:
```
w glinda2.txt
```
- Para salvar apenas um subconjunto específico de informações, o `w`, aceita um intervalo específico.
```
1,2w glinda.txt (salvar apartir da linha 1 à linha 2)
4,7w glinda.txt (salvar apartir da linha 4 à linha 7)
```
- Caso queira adicionar uma informação em um arquivo já existente, e não quer substituí-lo, use `W`. Note que, essa informação (conteúdos da linha 1 à linha 3, neste caso), vai ser adicionada ao final do arquivo que você escolher.
```
1,3W glinda.txt
```
## Juntar conteúdo de dois (ou mais) arquivos diferentes
Para juntar TODO o conteúdo de um arquivo com o atual, pressione `r` seguido do arquivo que quer fazer a junção
```
r glinda.txt //ao final do buffer atual
109
```
Caso queira fazer juntar TODO o conteúdo e inserí-lo APÓS uma linha específica:
```
6r glinda.txt //após alinha 6, o conteúdo de glinda.txt vai ser inserido
```
## Número de linhas
- Quantas linhas há no arquivo
```
$= ou .=
```
## Navegação
Para mover uma linha por vez para frente (forma progressiva) no buffer
```
<Enter>
```
Para mover uma linha por vez para trás (forma regressiva) no buffer 
```
- (hífen)
```
- COPIAR linha para outro local, digite o número (ou intervalos) da linha que deseja copiar e, em seguida, pressione `t` seguida da posição (linha) de destino. Ao fazer isso, a linha a ser copiada, será adicionado ABAIXO da linha que você especificar.
```
3,4t0 //copia intervalos entre 3 e 4, incluíndo eles, para a posição 0

3t0 //copia uma linha para a posição 0
```
- MOVER linha para outro local
```
7,9m0 //move intervalos entre 7 e 9, incluíndo eles, para a posição 0

3m0 //move uma linha para a posição 0
```
Note que a linha 1, se equivale a 0, e assim sucessivamente.
## Editar o buffer
Para editar o buffer, vá para a linha que deseja editar e, em seguida, invoque a função de pesquisa, inserindo `s/substituir/substituir-por
```
5
s/Aris/Ariana
```
Caso não insira o número da linha, o resultado será aplicado na linha de trabalho atual (p). Ou você pode inserir o número da linha durante a invocação
```
5s/Aris/Ariana
```
Caso deseje alter várias string dentro de um intervalo de linhas:
```
1,3s/muito/muito2 //alterar muito para muito2 das linhas entre 1 e 3
```
Note que ele sempre vai alterar a primeira ocorrência que ele encontrará, isto é, se houver duas ocorrências iguais, ele vai alterar apenas a primeira. Você pode especificar qual ocorrência quer modificar, adicionado o número:
```
1,3s/0/a/2 //alterar a segunda ocorrência de 0 para a
```
Ele vai pular a primeira ocorrência e alterar a segunda. Para alterar TODAS as ocorrências, adicione `/g`, operador global
```
1,3s/a/0/g //alterar TODAS as ocorrências de a para 0
```
Para DELETAR TODAS as ocorrências de uma palavra da LINHA ATUAL
```
s/Ariana//
```
## Limpar o buffer
Para apagar todos as informações pressione `c`
```
c
```
## Sair do ed
Existem três maneiras de encerrar uma sessão ed: `q`, `Q` ou `Ctrl + D`
## Manual completo do ed
```
info ed
```
## Remover vários caracteres diferentes de todo o buffer
```
96	- continue
97	
98	A instrução `continue` ignora a iteração atual e passa para a próxima.
99	
100	Observe que temos dois loop `for`, e internamente no segundo for, colocamos a instrução `break`. Isso significa que o `for` mais interno será executado apenas uma vez a cada repetição do `for` externo. Se tivéssemos omitido a instrução `break`, a cada loop do `for` externo, o `for` interno, executaria o loop completo a cada repetição do loop `for` externo.
101	https://www.quora.com/What-is-iteration-What-does-it-mean-to-iterate-through-an-array-in-Java
102
```
Por exemplo, quero remover a sequência numérica 96-102:
```
,s/\(96\|99\)//
```
No exemplo acima, você teria que especificar cada caractere por vez. Caso queira remover um intervalo:
```
,s/\(9[7-8]\|10[0-1]\)//
```
Para não acontecer de você remover partes de números como `1996, 1010101`, user o `\b`. Ele garante que você substitua exatamente o que você especificou ao invés de remover frações contidadas em partes de outros números.
```
,s/\b\(9[7-8]\|10[0-1]\)//
```
## Referências
Básico

- https://medium.com/predict/using-ed-the-unix-line-editor-557ed6466660
- https://www.ibm.com/docs/en/zos/2.3.0?topic=files-using-ed-editor

- https://wiki.c2.com/?EdIsTheStandardTextEditor

youtube

https://www.youtube.com/watch?app=desktop&v=mRZsV7aMK0I&list=PL0qfF8MrJ-jxAGRC2PJFrHNdsMRzMx6GD&index=7
