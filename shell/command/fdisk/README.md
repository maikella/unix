## remover todas as partições
```
sudo sfdisk --delete /dev/sdc
```
## criar tabela de partição
entrar no fdisk
```
sudo fdisk /dev/sdc
```
- g para criar partição GPT 
- o para uma tabela de partição MBR
```
o
```
## partições
criar uma partição
```
n
```
vai ser nescessário setar o valor inicial e o valor final da partição. o valor inicial, pode deixar como padrão dando enter, até chegar ao setor inicial.
```
First sector (2048-31260671, default 2048):
```
o padrão para o setor inicial é 2048, vamos deixar assim, enter
```
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-31260671, default 31260671)
```
caso queira aproveitar 100% da unidade coloque o valor 31260671. como pretendo criar duas partições, vou dividir esse valor por 2.
```
15630335 (7.5 GiB) que no caso seria 8G
```
### tipo de partição
ao usar MBR, o fdisk solicitará o tipo de partição MBR. digite p para criar uma partição primaria ou e para criar uma estendida. neste caso p.
## número da partição
o número da partição é a identificação de uma partição em específico como, sdc1.
### tornando a partição MBR botavél
```
a
```
## revisar alterações na tabela de partição
- p para imprimir alterações
- q para abortar alterações
- w para gravar alterações no disco e sair
## identificação da partição
```
sudo blkid /dev/sdb3
```
## verificar partições
```
cat /proc/partitions
```
## valores
```
echo 8G | numfmt --from=iec
```
## desmontagem
```
lsblk

sdc      8:32   1  14.9G  0 disk
├─sdc1   8:33   1   2.1G  0 part /run/media/user001/Fedora-WS-Live-40-1-14
├─sdc2   8:34   1  12.5M  0 part /home/user001/music
└─sdc3   8:35   1   300K  0 part
```
temos 3 partições alocadas no dispositivo /dev/sdc.
```
sudo umount /run/media/user001/Fedora-WS-Live-40-1-14

sudo umount /home/user001/music
```
verfique se estão desmontadas
```
lsblk

sdc      8:32   1  14.9G  0 disk
├─sdc1   8:33   1   2.1G  0 part
├─sdc2   8:34   1  12.5M  0 part
└─sdc3   8:35   1   300K  0 part
```
ao entrar na cli do fdisk, listar as partições
```
sudo fdisk /dev/sdc
p
```
agora exclua essa partições
```
d
```
caso tenha mais de uma, você pode especificar o número da partição. por padrão, ele apaga a mais recente, neste caso, sdc3.

agora salve essas modificações
```
w
```
criar tabela gpt
```
g
```
salvar e verificar
```
w
sudo fdisk -l
```
criar partição
```
n
```
sdc1 último setor 3G 
```
+3G
```
sdc2 9G
```
setor final 31258623
30000000 (9.7G)
```
sdc3 1G
```
9663676
```
salve as alterações
```
w
```
depois de criar as partições, você deve formatar
```
sudo mkfs.btrfs /dev/sdc1
```
verificar a consistência 
```
sudo e2fsck -f /dev/sdc1

sudo e2fsck -f /dev/sdc2
```
for

## referências
- https://access.redhat.com/articles/1190213

- https://www.msp360.com/resources/blog/linux-resize-partition/ 

- https://www.baeldung.com/linux/resize-partitions

- https://www.reddit.com/r/linux/comments/nq5wxi/does_anyone_still_use_a_home_partition_and_why/

- https://www.reddit.com/r/linuxquestions/comments/mv59rt/when_i_install_a_distro_how_do_i_partition_my/

- https://www.redhat.com/sysadmin/partitions-fdisk

- https://unix.stackexchange.com/questions/704604/fdisk-or-sfdisk-how-to-show-the-disks-size-in-gib-and-not-in-gb

- https://commandmasters.com/commands/fdisk-linux/

- https://superuser.com/questions/1194426/units-misunderstanding-in-fdisk-gdisk-parted

- https://superuser.com/questions/1499619/how-to-calculate-fdisk-values
