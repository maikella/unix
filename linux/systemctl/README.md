## gdm
desativar gdm
```
sudo systemctl disable gdm.service

sudo systemctl stop gdm.service
```
### configure o sistema para iniciar no TTY:
O Fedora, por padrão, inicia no nível de execução gráfico (runlevel 5). Você precisará alterar isso para o runlevel 3, que é o modo multiusuário com a linha de comando (sem GUI):

padrão
```
sudo systemctl get-default
graphical.target
```
trocar para o login sem GUI
```
sudo systemctl set-default multi-user.target
```
### iniciar GNOME manualmente após o login:
Após fazer login no TTY, você pode iniciar o GNOME manualmente usando o comando startx. No entanto, para que o GNOME seja iniciado corretamente, você pode criar ou editar um arquivo .xinitrc na sua home (~/.xinitrc), contendo o seguinte:
```
vim .xinitrc

exec gnome-session
```
## idioma diferente
se o GNOME está iniciando em outro idioma quando você o inicia via startx, isso pode estar relacionado à configuração de idioma no ambiente de login TTY ou à configuração de idioma global

no tty
```
sudo vim /etc/locale.conf

#LANG="pt_BR.UTF-8"
LANG=en_US.UTF-8
```
tem que ser o mesmo idioma que você usa de costume
