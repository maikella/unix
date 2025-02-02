criar uma entrada customizada no grub
```
sudo vim  /etc/grub.d/40_custom

#!/usr/bin/sh
exec tail -n +3 $0
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.

menuentry 'top level 5 Fedora 39' {
load_video
set gfxpayload=keep
echo    'Loading Kernel Linux 6.10.4...'
linux ($root)/vmlinuz-6.10.4-100.fc39.x86_64 root=UUID=1700cf84-9f0e-4339-afee-9dc652ac14ab ro rootflags=subvol=root rhgb quiet
echo    'Loading Linux IMAGE 6.10.4...'
initrd ($root)/initramfs-6.10.4-100.fc39.x86_64.img
}
```
atualizar o bootloader
```
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```
### prioridade
pode acontecer do bootloader iniciar em `root`ao invés de `root/@`, para evitar que isso aconteça, faça o seguinte:
```
vim /etc/default/grub
```
para salvar a última entrada usada, você adiciona GRUB_DEFAULT=saved e GRUB_SAVEDEFAULT=true. atualize o bootloader logo em seguida
```
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```
## referências
[Chapter 26. Working with GRUB 2](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/system_administrators_guide/ch-working_with_the_grub_2_boot_loader)

[README-custom-grub2-menu.md](https://gist.github.com/drmalex07/e9c44b9760b19c6211bc)

[Grub2/CustomMenus](https://help.ubuntu.com/community/Grub2/CustomMenus)

systemdboot

[Grub.d 40_custom](https://forum.endeavouros.com/t/grub-d-40-custom/38025)

grub

[GNU GRUB manual](https://www.gnu.org/software/grub/manual/grub/grub.html#menuentry)

[GRUB](https://wiki.archlinux.org/title/GRUB_(Portugu%C3%AAs))

fedora

[Working with the GRUB 2 Boot Loader](https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/kernel-module-driver-configuration/Working_with_the_GRUB_2_Boot_Loader/)

prioridade

[Change boot priority in Grub [duplicate]](https://askubuntu.com/questions/166730/change-boot-priority-in-grub)
