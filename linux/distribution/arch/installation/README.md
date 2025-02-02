### fonte
```
setfont ter-132n
```
### layout do teclado
```
localectl list-keymap | grep abnt
```
Shift + } para fazer o |
```
loadkeys br-abnt2
```
### verificar modo de inicialização
```
# cat /sys/firmware/efi/fw_platform_size
```
se o comando retornar 64, o sistema será inicializado no modo UEFI e terá um UEFI x64 de 64 bits. se o comando retornar 32, o sistema será inicializado no modo UEFI e terá um UEFI IA32 de 32 bits; embora isso seja suportado, limitará a escolha do carregador de inicialização para systemd-boot e GRUB. se o arquivo não existir, o sistema poderá ser inicializado no modo BIOS (ou CSM). se o sistema não inicializar no modo desejado (UEFI vs BIOS), consulte o manual da sua placa-mãe.

### conectar-se à internet
para configurar uma conexão de rede, certifique-se de que sua interface de rede esteja listada e habilitada
```
ip link
```
para wireless e WWAN, certifique-se de que a placa não esteja bloqueada com rfkill.

Conectar-se à rede:

Ethernet: conecte o cabo.

para wi-fi, autentique-se na rede wireless usando
```
iwctl
```
a conexão pode ser verificada com ping:
```
ping arianagrande.com
```
### atualizar o relógio do sistema

Atualizar o relógio do sistema

no ambiente ao vivo, systemd-timesyncd é habilitado por padrão e o horário será sincronizado automaticamente assim que uma conexão com a internet for estabelecida. use timedatectl para garantir que o relógio do sistema esteja sincronizado
```
timedatectl
```
### particionar disco
listar dispositivos
```
fdisk -l ou lsblk
```
resultados terminando em rom, loop ou airootfs podem ser ignorados. dispositivos mmcblk* terminando em rpbm, boot0 e boot1 podem ser ignorados.

as seguintes partições são necessárias:

- uma partição para o diretório raiz (/)
- para inicializar no modo UEFI, crie uma partição de sistema EFI

para modificar tabelas de partição, use ferramentas de particioamento como, fdisk ou gdisk.
```
gdisk /dev/vda

n: para criar uma nova partição
enter: para deixar o número da partição como padrão
enter: para deixar o inicio do primeiro setor como padrão
8M: o último setor define o tamanho da partição
tipo: ef00 é o código para criar uma partição EFI

/ e /home podem ser do tipo Linux Filesystem (não precisa fornecer um código)

w: salvar alterações e Y para confirmar
```
verificar se as partições foram criadas corretamente
```
lsblk
```
### partições
gdisk /dev/sdc
- efi
```
n
número na partição (enter para padrão)
setor inicial: deixe como padrão
setor final: +300M
código: ef00 (para partição efi)
```
- swap 
```
setor inicial: deixe como padrão
setor final: +2G
código: 8200
```
### formatar as partições
cada partiçao deve ser formatada com um sistema de arquivo adequado.

- partição EFI 
```
mkfs.fat -F32 /dev/vda3
```
- partição swap
```
mkswap /dev/vda2
```
ativar a partição swap
```
swapon /dev/vda2
```
- partição /home e /
```
mkfs.btrfs /dev/vda4
```
formate a partição do sistema EFI somente se você a criou durante a etapa de particionamento. se já havia uma partição do sistema EFI no disco antes, reformatá-la pode destruir os carregadores de inicialização de outros sistemas operacionais instalados.
### montar sistemas de arquivos
criar o ponto de montagem para a partição /dev/vda4
```
mount /dev/vda4 /mnt
```
/mnt é onde vamos instalar o sistema. agora vamos criar o subvolume raiz
```
btrfs su cr /mnt/root
btrfs su cr /mnt/root/@
btrfs su cr /mnt/root/@snapshots
btrfs su cr /mnt/root/@var_log

ou

btrfs su cr /mnt/root
btrfs su cr /mnt/@

umount /mnt
```
criar o ponto de montagem para home (montar
```
mount /dev/vda1 /mnt

btrfs su cr /mnt/@home
btrfs su cr /mnt/@snapshots

umount /mnt
```
é preciso desmontar o diretório de montagem para remontarmos os subvolumes em seus respectivos diretórios (que ainda vamos criar)

- montar o subvolume raiz:
```
mount -o noatime,compress=lzo,space_cache=v2,subvol=@ /dev/vda4 /mnt/root/
```
criar diretórios:
```
mkdir -p /mnt/{boot,home,.snapshots,var_log}
```
- montar home:
```
mount -o noatime,compress=lzo,space_cache=v2,subvol=@home /dev/vda5 /mnt/@home
```
- montar .snapshots
```
mount -o noatime,compress=lzo,space_cache=v2,subvol=@snapshots /dev/vda4 /mnt/.snapshots
```
- montar var_log
```
mount -o noatime,compress=lzo,space_cache=v2,subvol=@var_log /dev/vda4 /mnt/var_log
```
- montar partição EFI
```
mount /dev/vda3 /mnt/boot
```
verificar pontos de montagens
```
lsblk
```
### pacotes
pacstrap /mnt nome_pacote
```
base
base-devel
linux-headers
linux
linux-firmware
git
vim
amd-ucode (processador amd)
btrfs-progs
mullvad-browser-bin
firefox
```
### gerar tabela do sistema de arquivos
é nesse arquivo que ser armazenado todos os pontos de montagem do sistema
```
genfstab -U (UUIDs) /mnt >> /mnt/etc/fstab
```
verificar se tudo ocorreu bem
```
cat /mnt/etc/fstab
```
### entrar no sistema temporariamente
```
arch-chroot /mnt
```
### fuso horário
```
timedatectl list-timezones | grep America
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
```
### sincronizar relógio do hardware e o relógio do sistema
```
hwclock --systohc
date
```
### idioma do sistema
```
localectl list-locales | grep -i us

vim /etc/locale.gen

en_US.UTF-8

locale-gen (para gerar o arquivo de localidade)
```
variáveis de ambiente
```
vim /etc/locale.conf
LANG="en_US.UTF-8"
```
### nome da máquina na rede
```
vim /etc/hostname
01000001
```
### ips internos da máquina
```
vim /etc/hosts

127.0.0.1   localhost 
::1         localhost 
127.0.0.1   01000001.localdomain 01000001
```
### definir senha usuário root
```
passwd
enter e ensira a senha
```
### instalar pacotes no sistema
```
pacman -S grub (bootloader) efibootmgr networkmanager (ferramenta de rede) network-manager-app (gerenciador de painel de rede) dialog wpa_supplicant (wifi) mtools dosfstools (duas ferramentas para trabalhar com sistemas de arquivos fat) git reflector snapper bluez bluez-utils (dois adaptadores bluetooth) cups (sistema de impressão) hplip (impressoras hp) xdg-utils xdg-user-dirs (diretórios home) alsa-utils pulseaudio pulseaudio-bluetooth inetutils (utilitário que contém os comandos hostnamectl) 
```
## referências
[Installation guide](https://wiki.archlinux.org/title/Installation_guide)

youtube

[ É hoje que você instala o Arch Linux! - Tutorial COMPLETO! ](https://www.youtube.com/watch?v=4orYC5ARfn8)

[ Arch Linux Install: January 2021 ISO With BTRFS & Snapshots ](https://www.youtube.com/watch?v=Xynotc9BKe8)

wifi (iwctl)

[Arch Linux July 2020 ISO: Wi-Fi with iwd](https://www.youtube.com/watch?v=bOzLwODMqIo)

luks

[ Arch Linux Monthly Install: April 2022 ](https://www.youtube.com/watch?v=HIXnT178TgI)
