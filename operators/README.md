## (&) "e" comercial
Ao usar um único `&`, faz com que o comando seja executado em segundo plano, em suma, você vai executar mais de um comando em segundo plano. Por exemplo, atualizar o sistema em segundo plano:
```
sudo dnf update -y &
```
Também é possível rodar múltiplos comandos em segundo plano:
```
sudo dnf update -y & shutdown +3 &
```
## Operador AND (&&)
O operador `AND` executará o segundo comando somente se a execução do primeiro for bem sucedida. Por exemplo, quero desligar o sistema, mas, antes disso, quero verificar se ele está atualizado.
```
sudo dnf update -y && shutdown +3
```
## Referências

https://www.tecmint.com/chaining-operators-in-linux-with-practical-examples/

https://unix.stackexchange.com/questions/159513/what-are-the-shells-control-and-redirection-operators

https://www.networkworld.com/article/2516127/linux-operators-using-and-many-more.html

https://www.makeuseof.com/linux-command-line-chaining-operators/

