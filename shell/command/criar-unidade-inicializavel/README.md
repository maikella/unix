## usb corrompido
verifique se a unidade esta formatada para FAT 32
```
sudo mkfs.vfat -F 32 /dev/sdc
```
para fazer isso, o dispositivo deve estar desmontado, como também todas as suas partições
```
sudo blkdiscard -s /dev/sdc
```
caso tenha um sistema de arquivos na unidade
```
sudo blkdiscard -sf /dev/sdc
```
substituir valores aleatórios
```
sudo shred -vzn88 /dev/sdc
````
## IMPORTANTE
antes de gravar a iso, verifique se ela não foi corrompida[^1]
```
md5sum ubuntu-19.04-desktop-amd64.iso
```
#### fedora
baixe o arquivo de assinatura e compare os valores
```
md5sum Fedora-Workstation-40-1.14-x86_64-CHECKSUM
```
### Unidade USB
verifique qual o nome e a localização da sua unidade USB
```
lsblk -f
```
para mais detalhes
```
sudo fdisk -l
```
após descobrir a unidade, faça a desmontagem
```
sudo umount /dev/sdb*
```
a imagem deve ser gravada no disco inteiro (sdb) e não em uma partição (sdb1)
### formatação
verifique primeiro se a sua BIOS é UEFI. se o comando conseguir localiz

se o diretório existir, é porque é UEFI
```
ls /sys/firmware/efi
```
alternativamente
```
sudo efibootmgr
```
Se você receber uma saída detalhada com informações sobre as entradas de inicialização, seu sistema está usando UEFI. Se o comando não estiver disponível ou não retornar informações úteis, você provavelmente está usando BIOS.
```
bootctl
```
se o sistema retornar informações sobre "Boot Loader", "System" e "Firmware", indicando que o sistema está gerenciando uma inicialização UEFI, então seu sistema está usando UEFI. Caso contrário, você verá uma mensagem indicando que a inicialização UEFI não está em uso.

para tornar a mídia bootável, é nescessário torná-la reconhecida como um dispositivo de inicialização pelo BIOS ou UEFI, para que seja possível executá-la durante o processo de boot.

a formatação também garante que não terá conflitos com dados antigos, corrompidos ou malwares, no processo de inicialização, pois serão apagados completamente durante a formatação.

mkfs para FAT32
```
sudo mkfs.vfat -F 32 /dev/sdX1
```
mkfs para exFAT
```
sudo mkfs.exfat /dev/sdX1
```
para remover o pen drive com segurança
```
sudo eject /dev/sdX
```
## cat
entre como root
```
sudo -s
```
coloque o caminho completo
```
cat /home/user001/Downloads/Fedora-Workstation-Live-x86_64-40-1.14.iso > /dev/sdc
```
pode demorar um pouco. verifique se o dispositivo esta formatado em FAT 32.

## dd
```
sudo dd if=/caminho/para/imagem.iso of=/caminho/para/pendrive bs=1M status=progress oflag=sync
```
```
sudo dd if=/home/ricardo/imagem_iso_ou_img of=/dev/sdb bs=5M;sync
```
```
sudo dd if=/caminho/para/sua/iso.iso of=/dev/sdX bs=4M status=progress && sync
```
- input file (if)
localização dos dados originais que serão copiados.
- output file (of)
destino para onde os dados serão copiados. pode ser um hd, pendrive ou um arquivo.
- block size (bs)
ele específica o tamanho de cada pedaço (bloco) do arquivo que será lido e gravado por vez.
- sync
ele sincroniza a entrada e saída dos arquivos. como a leitura dos arquivos é muito mais rápida que a gravação, este comando faz com que os blocos copiados e gravados estejam em sincronia
- status=progres
disponível apenas em versões mais atuais do linux, nos permite acompanhar o progresso na tela, caso contrário, não veríamos nada após executar o comando. independentemente da escolha, ao final, será exibido um relatório da cópia.[^2]

### bios
agora entre na bios
```
Delete ou ESC
```
### trocar de dispositivo
```
F11
```
### GRUB
```
F4
```
## referências
[^1]: [Como verificar se uma imagem ISO está corrompida ou adulterada](https://www.edivaldobrito.com.br/como-verificar-se-a-imagem-iso-baixada-no-ubuntu-13-10-esta-corrompida/)
[^2]: [Comando para criar uma pendrive bootavel a partir de uma imagem iso no terminal do linux](https://www.webig.pro.br/comando-para-criar-um-pendrive-bootavel-a-partir-de-uma-imagem-iso/)

usb corrompido

- https://unix.stackexchange.com/questions/252593/how-can-i-securely-delete-the-contents-of-a-thumb-drive-so-data-cant-be-recover

