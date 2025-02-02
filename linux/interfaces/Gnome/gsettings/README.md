## sitema
dark
```
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```
claro
```
gsettings set org.gnome.desktop.interface color-scheme 'default'
```
alternativamente
```
gsettings set org.gnome.desktop.interface color-scheme prefer-light
```
## terminal
dark
```
gsettings set org.gnome.desktop.interface gtk-theme prefer-dark
```
ou
```
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
```
claro
```
gsettings set org.gnome.desktop.interface gtk-theme prefer-light
```
ou
```
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
```
## desabilitar face browser
permite que você tenha uma lista de usuários na tela de login
```
gsettings set org.gnome.login-screen disable-user-list true
```
## referência

- https://help.gnome.org/admin/gdm/stable/overview.html.en_GB
