## B-Tree Filesystem (btrFS)
emitir o nome do sistema de arquivos do seu diretório
```
findmnt -no FSTYPE /home
```
verificar se o utilitários está instalados
```
which btrfs

/usr/sbin/btrfs
```
verificar o formato Btrfs
```
sudo btrfs filesystem show
```
alternativamente
```
sudo btrfs fi show
```
### alterar labels btrfs
mesmo depois de se tornar um sistema instalado, por padrão, a label fica como: "fedora_localhost-live".
```
sudo btrfs filesystem label /
```
renomeie
```
sudo btrfs filesystem label / fedora33workstation
```
### gerenciar os subvolumes
listar subvolumes
```
sudo btrfs subvolume list /
```
limitar a saída ao subvolumes da localização atual
```
sudo btrfs subvolume list -o .
```
criar um subvolume
```
sudo btrfs subvolume create /opt/ariana_grande
```
deletar um subvolume
```
sudo btrfs subvolume delete /opt/ariana_grande
```
alternativamente
```
sudo rm -r /opt/ariana_grande
```
### verificar uso de espaço
para mais precisão, use o utilitário btrfs
```
sudo btrfs filesystem df /home
```
### id do dispositivo de armazenamento
```
sudo blkid /dev/sdb*
```
### subvolumes vs partições
com partições, dedicamos para cada diretório importante impondo um limite específico para cada uma uma dessas partições. com subvolumes, também dividimos, porém todos os subvolumes, tem o mesmo tamanho ao invés de um tamanho fixo como as partições.

partições são tratadas como entidades separadas, enquanto subvolumes
### reverter alterações
ao criar um snapshot
```
sudo btrfs subvolume snapshot /home /home/home-snapshot-teste
Create snapshot of '/home' in '/home/home-snapshot-teste'
```
você deve pegar o ID  gerado para esse subvolume que corresponde ao snapshot, neste caso 261.
```
sudo btrfs subv list .

ID 256 gen 172488 top level 5 path home
ID 257 gen 172488 top level 5 path root
ID 258 gen 171910 top level 257 path root/var/lib/machines
ID 260 gen 172193 top level 256 path user001/btrfs-teste/ariana_grandeSUB2
ID 261 gen 172488 top level 256 path home-snapshot-teste
```
antes de editar o arquivo /etc/fstab, faça o backup do arquivo, pois modificá-lo, é sempre arriscado.
```
sudo cp /etc/fstab /etc/fstab.bak
```
o sistema usa esse arquivo para inicializar e caso seja danificado ou um erro de sintaxe, o sistema pode não inicializar.
```
sudo vim /etc/fstab
```
para uma maior segurança, ao invés de usar nomes de subvolumes, utilize seu ID para uma melhor precisão.
```
ao invés de subvol=home-snapshot-teste, utilize subvolid=261
```
reinicie a máquina. se tudo correr bem, não esqueça de trocar o ID do snapshot para sua home real.

### criar um subvolume raiz e home
```
sudo btrfs subv create /@
sudo btrfs subv create /@home
```
copiar diretório (o próprio cp vai criar)
```
sudo cp -r home/ /home_new2
```
copiar apenas o conteúdo do diretório (tem que está criado)
```
sudo cp -r home/. /home_new2
```
antes de mover os dados, monte um diretório temporário.
```
sudo mount -o subvol=@volume/@home /dev/sdb3 /mnt
```
use o rsync para mover os dados mantendo as permissões corretas.
```
sudo rsync -aXS /home/ /mnt/
```
alternativamente, você pode tirar um snapshot do diretório. estava dentro do diretório /, e tirei um snapshot do diretório atual
```
sudo btrfs subv snapshot . /@
```
antes de atualizar o arquivo fstab, pegue o UUID da sua partição btrfs onde os subvolumes estão localizados, neste caso, está no diretório root (/)
```
findmnt -vno SOURCE /
/dev/sdb3
```
### criar snapshot
criar snapshot do sistema
```
sudo btrfs subv snapshot / /@snapshots/@root-snapshot
```
criar snapshot /home apenas leitura
```
sudo btrfs subv snapshot -r /home /@snapshots/@home-snapshot
```
### conferir o consumo de armazenamento
verificar consumo de um diretório
```
sudo btrfs fi du /home -s
```
verificar consumo do disco
```
sudo btrfs fi df /home
```
verificar discos btrfs
```
sudo btrfs fi show
```
### /home para @home
para formatar para btrfs, ao escolher o dispositivo (sdc), ao invés de uma partição em específica, todas as partições serão deletadas. lembre-se de desmontar o dispositivo e suas partições
```
sudo mkfs.btrfs /dev/sdc
```
caso já tenha sistema de arquivos existente
```
sudo mkfs.btrfs -f /dev/sdc
```
pegue o id da partição onde vai ser a nova @home
```
sudo blkid /dev/sdb4
```
Primeiro, monte a nova partição em um diretório temporário e crie o subvolume:
```
sudo mount UUID=ae615d92-8ccf-4f16-a86e-749e7481aea3 /mnt

sudo btrfs subvolume create /mnt/@home
```
Copiar os dados atuais da /home para o novo subvolume

Monte o subvolume e copie os dados da sua /home atual para ele:
```
sudo mount -o subvol=@home UUID=ae615d92-8ccf-4f16-a86e-749e7481aea3 /mnt

sudo rsync -aAXv /home/* /mnt/@home/
```
Edite o arquivo /etc/fstab para montar a nova partição e subvolume como /home:
```
UUID=ae615d92-8ccf-4f16-a86e-749e7481aea3 /home btrfs subvol=@home,defaults 0 0
```
comente a home antiga e monte a nova
```
sudo mount -a
```
### / para @root
em live usb, mount a atual partição root em um diretório temporário
```
sudo mount /dev/sdb3 /mnt
```
entre e crie o novo subvolume root
```
cd /mnt

sudo btrfs sub snap root root/@
```
dentro do novo @, edite o arquivo fstab para apontar para o novo root 
```
sudo vim /etc/fstab

UUID=1700cf84-9f0e-4339-afee-9dc652ac14ab /                       btrfs   subvol=@,compress=zstd:1 0 0
```
ao alterar o arquivo fstab
```
sudo mount -a
```
- bootloader grub

em sistemas que usam o grub faça um teste para ver se funcionou

para entrar o grub
```
F4
```
edite o parâmetro do kernel apontando para o novo root
```
e 

BOOT_IMAGE=(hd0,gpt2)/vmlinuz-6.10.5-100.fc39.x86_64 root=UUID=1700cf84-9f0e-4339-afee-9dc652ac14ab ro rootflags=subvol=root/@ rhgb quiet

F10 ou Ctrl+X para inicializar com esses parâmetros
```
caso funcione, e queira tornar permanente, após a inicialização edite o arquivo /etc/default/grub se estiver utilizando grub-mkconfig e anexe o novo root

gerar um novo arquivo grub.cfg
```
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```
verificar se esta apontando para o novo root
```
sudo cat /boot/grub2/grub.cfg
```
e inicialize novamente e verifique se foi montado corretamente
```
mount -t btrfs
```
verifique os parâmetros do seu kernel boot
```
cat /proc/cmdline
```
### pós montagem 
ao alterar o arquivo fstab também é bom rodar o comando para atualizar o daemon
```
sudo systemctl daemon-reload
```

## Referências
- [Getting started with btrfs for Linux](https://opensource.com/article/20/11/btrfs-linux)

- [Working with Btrfs – Subvolumes](https://fedoramagazine.org/working-with-btrfs-subvolumes/)

- [The Beginner’s Guide to Btrfs](https://www.maketecheasier.com/the-beginners-guide-to-btrfs/)

- [Modernize your Linux Storage with btrfs!](https://www.youtube.com/watch?v=RPO-fS6HQbY&t=150s)

subvolumes

- [Btrfs/Getting Started](https://wiki.tnonline.net/w/Btrfs/Getting_Started)

- [Btrfs/Mount Options](https://wiki.tnonline.net/w/Btrfs/Mount_Options)

- [BTRFS - Subvolumes for / & /home, and being able to snapshot and restore from the snapshots?](https://unix.stackexchange.com/questions/511885/btrfs-subvolumes-for-home-and-being-able-to-snapshot-and-restore-from-th)

- [Como Gerenciar Pools de Armazenamento Btrfs, Subvolumes e Instantâneos no Linux (parte 1)](https://www.linux.com/training-tutorials/how-manage-btrfs-storage-pools-subvolumes-and-snapshots-linux-part-1/)

- [SysadminGuide](https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/SysadminGuide.html#Subvolumes)

- [Btrfs](https://wiki.archlinux.org/title/Btrfs#Sub-volumes)

- [Btrfs has subvolumes, does this mean I don't need a logical volume manager and I can create a big Btrfs filesystem on a raw partition?](https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/FAQ.html#Can_I_mount_subvolumes_with_different_mount_options.3F)

- [How to subvolume a btrfs root partition after installation?](https://www.reddit.com/r/archlinux/comments/dyh95n/how_to_subvolume_a_btrfs_root_partition_after/)

- [How to convert root directory into a subvolume in btrfs?](https://www.reddit.com/r/Gentoo/comments/qlskjp/how_to_convert_root_directory_into_a_subvolume_in/)

- [How to convert root directory into a subvolume in btrfs? part 2](https://www.reddit.com/r/btrfs/comments/qlt92u/how_to_convert_root_directory_into_a_subvolume_in/)

- [btrfs: browsing subvolumes](https://superuser.com/questions/1396245/btrfs-browsing-subvolumes)

youtube

- [BTRFS Guide | The Best Desktop File System](https://www.youtube.com/watch?v=J2QP4onqJKI)

- [The COMPLETE BTRFS Snapshot Guide](https://www.youtube.com/watch?v=P-9osuSdGGI)

root to @
- https://wiki.archlinux.org/title/Kernel_parameters#Configuration
