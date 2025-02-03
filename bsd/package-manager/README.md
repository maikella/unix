## Gerenciamento de pacotes binários
Verificar se `pkg` está instalado
```
pkg -N
```
### Brach Quarterly e Latest

- Branch Quarterly

É uma branch mais estável. Você vai receber atualizações de pacotes e portes estáveis. Também visa receber correções de segurança, de bugs e conformidade de portas ou alterações de estrutura.

- Branch Latest

Receber as últimas atualizações.
```
# mkdir -p /usr/local/etc/pkg/repos

# echo 'FreeBSD: { url: "pkg+http://pkg.FreeBSD.org/${ABI}/latest" }' > /usr/local/etc/pkg/repos/FreeBSD.conf
```
Agora, para puxar os pacotes locais da nova branch `Latest`
```
pkg update -f
```
### pkg
Pesquisar uma aplicação
```
pkg search firefox
```
Installar uma aplicação
```
pkg install gdm
```
Remover uma aplicação
```
pkg delete gdm
```
Listar pacotes e dependências de pacotes 
```
pkg info
```
Buscar um pacote no repositório para instalá-lo mais tarde ou em outro diretório
```
# pkg fetch -d -o /usr/home/user/packages/ nginx-lite
```
-d: usado para buscar todas as dependências

-o: usado para especificar o diretório de download

Para instalar esse pacote:
```
# cd /usr/home/user/packages/
# pkg install nginx-lite-1.22.1,3.pkg
```
### Obter informações de pacotes instalados
Quando não é passado nenhum argumento, ele listará a versão de todos os pacotes instalados, porém, é possível especificar um pacote
```
pkg info vim
```
### Remover pacotes não utilizados
Geralmente, esses pacotes, são dependências de pacotes que já foram desinstalados:
```
pkg autoremove
```
Pacotes instalados como dependências são chamados de Pacotes automáticos. Pacotes não automáticos, são pacotes que não foram instalados como uma dependência, podem ser listados como:
```
pkg prime-list
```
`pkg prime-list` é um comando alias declarado em /usr/local/etc/pkg.conf. Há muitos outros que podem ser usados para consultar o banco de dados de pacotes do sistema. Por exemplo, o comando pkg prime-origins pode ser usado para obter o diretório de porta de origem da lista mencionada acima:
```
pkg prime-origins
```
### Remover pacotes obsoletos
/var/cache/pkg
Limpar por completo o cache
```
pkg clean -a
```
## Referências
https://docs.freebsd.org/en/books/handbook/ports/
