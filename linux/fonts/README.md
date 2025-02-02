## baixar font

[Terminus](https://sourceforge.net/projects/terminus-font/)

```
gzip -d terminus-font-4.46.tar.gz
```
converter font para ttf
```
sudo dnf install fontforge

fontforge Downloads/terminus-font-4.46/ter-u32n.bdf

File > Generate Fonts

em "No Outline Font", escolher a opção TrueType (ttf)
```
disponibilizar a fonte para um usuário específico
```
mv Downloads/ter-u32n.ttf .local/share/fonts
```
disponibilizar para todo o sistema
```
mv Downloads/ter-u32n.ttf /usr/share/fonts
```
regenerar o cache das fontes
```
fc-cache -f -v
```
verificar o nome da fonte
```
fc-list | grep Terminus
```
avisar para o gnome sua fonte padrão
```
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/Terminal/Legacy/Profiles:/d5479e56-699a-4308-92f0-a6001925e312/ font "Terminus"
```
## referências
- https://medium.com/source-words/how-to-manually-install-update-and-uninstall-fonts-on-linux-a8d09a3853b0

