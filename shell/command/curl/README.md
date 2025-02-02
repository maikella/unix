### requisição de uma api
POST
```
$ curl -d '{"name":"Ariana Grande","album":"eternal sunshine"}' -H "Content-type: application/json" http://localhost:8080/save
```
GET
```
$ curl http://localhost:8080/get
```
PUT
```
$ curl -X PUT -d '{"name":"Ariana Grande","album":"yes, and?"}' -H "Content-Type: application/json" http://localhost:8080/api/id
```
### requisições maiores
criar um arquivo json com a requisição
```
$ vim request.json
```
adicionando a requisição
```
{
    "name":"Ariana Grande",
    "album": "eternal sunshine"
}
```
fazer a solicitação indicando o parâmetros e o caminho completo do arquivo
```
$ curl -X PUT -H "content-type: application/json" -d @/home/user001/request.json http://localhost:8080/api/id
```
