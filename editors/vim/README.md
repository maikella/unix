### vi

#### NORMAL MOD

* `(dd)` Recortar (delete) linha inteira
  * d7, contando com a linha atual, vai deletar 7 linhas de baixo
* `(yy)` Copiar (yank) linha inteira
colar antes do cursor
```
Shift + P
```
colar (put = colocar) após o cursor
```
P
```
colar 10 vezes um valor após o cursor que foi copiado
```
10p
```
excluir até o final da linha após o cursor e entrar no modo insert
```
Shift + C
```
excluir linha inteira e entrar no modo insert
```
cc
```
excluir uma palavra e entrar no modo insersão
```
cw
```
apagar palavra que esta SOB o cursor
```
ciw
```
* `(s)` Exclur um char (letra)
* `(S)` Excluir uma linha inteira
* `(r)` substituir UM caractere SOB o cursor
* `(R)` modo Replace ANTES do cursor

Desfazer alterações
```
U 3u, 5u...
```
Refazer alterações
```
Ctrl + R
```
* `(x)` Apagar caracter SOB o cursor
* `(ESC)` Entrar no NORMAL MOD

#### COMMAND

* `(:w)` Renomear e salvar arquivo
* `(:q)` Sair
* `(:q!)` Sair sem salvar
* `(:x)` ou `(:wq)` Salvar e sair

#### INSERT MOD

* `(i)` Inserir texto sob o cursor
* `(a)` Inserir texto DEPOIS do cursor
* `(o)` Inserir texto em nova linha ABAIXO
* `(Shift + A)` Inserir texto NO FIM da linha
* `(Shift + I)` Inserir texto NO INÍCIO da linha
* `(Shift + O)` Inserir texto em nova linha ACIMA

#### Navegação

* `(k)` Mover para cima
* `(h)` Mover para esquerda
* `(l)` Mover para direita
* `(j)` Mover para baixo

* `(4k)` Subir 4 linhas
* `(6j)` Descer 6 linhas
* `(:20)` Ir para a linha 20 de um arquivo
* `(H)` Top line on screen
* `(M)` Middle line on screen
* `(L)` Bottom line o screen

#### percorrer frase
Mover para o INÍCIO da linha atual
```
0
```
Mover para o FIM da linha atual
```
$
```
AVANÇAR para o INÍCIO de uma palavra
```
W
```
VOLTAR para o INÍCIO de uma palavra
```
B
```
Ir para o FINAL da palavra
```
E
```
#### percorrer texto
Mover para frente para c
```
fc 
```
Mover para trás para c
```
Fc 
```
Move a tela para cima de uma linha
```
Ctrl + Y
```
Move a tela para baixo uma linha
```
Ctrl + E
```
#### deletar
deletar caracteres após o cursos
```
X
```
deletar caracteres antes do cursor
```
Shift + X
```
deletar até o fim da linha
```
d$ ou Shift + D
```
#### página
Mover um parágrafo para trás
```
{ 
```
Mover um parágrafo para frente
```
} 
```
Mover para o topo da tela
```
H 
```
Mover para o meio da tela
```
M 
```
Mover para o fundo da tela
```
L 
```
scrolling meia página para cima
```
Ctrl + U
```
scrolling meia página para baixo
```
Ctrl + D
```
ROLAR uma página para CIMA
```
Ctrl + B
```
ROLAR uma página para BAIXO
```
Ctrl + F
```
Ir para o INÍCIO da PÁGINA 
```
gg
```
Ir para o FIM da PÁGINA
```
G
```
### pesquisar
pesquisar ariana grande
```
/ariana grande
```
ir para a próxima instância
```
N
```
voltar para instância anterior
```
Shift + N
```
ignora maiúsculas e minúsculas ao pesquisar no vim
```
/\c
```
pesquisar string puramente minúsculas
```
/\C
```
#### replace
substituição em todo o documento
```
:℅s/ariana grande/ariana grande2
```
apenas em cima no cursor
```
:s/Ariana/Abriana/
```
#### VISUAL MOD

* `(v)` Selecionar caracteres
* `(Shift + V)` Selecionar linhas
* `(Ctrl + v)` Selecionar bloco
* `(d)` Recortar seleção (delete)
* `(y)` Copiar seleção (yank)

### Documentação

* Linux: `$ vimtutor` para vim. `$ man vi` para vi.
* Windows: `$ vimtutor.bat`

vim rolar página
- https://stackoverflow.com/questions/3458689/how-to-move-screen-without-moving-cursor-in-vim#3458821
- https://web.archive.org/web/20190714183245/http://www.lagmonster.org/docs/vi2.html
