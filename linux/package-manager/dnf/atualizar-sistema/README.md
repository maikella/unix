## atualizar versão atual do fedora
verificar se não tem nenhuma atualização
```
sudo dnf upgrade --refresh
```
para garantir que não existe nenhum problema de dependência de pacote. esse comando, tentará fazer que seus pacotes instalados/atualizados, tenha a mesma versão em seus repositórios atualmente habilitados
```
sudo dnf distro-sync
```
Você também pode usar a opção --allowerasing para remover pacotes com dependências que não podem ser satisfeitas. Sempre revise quais pacotes serão removidos antes de confirmar isso:
```
sudo dnf distro-sync --allowerasing
```
limpar o cache
```
sudo dnf clean all
```
**AGORA, reinicie o computador**

essa etapa é importante, pois as atualizações do sistema são necessárias para receber chaves de assinaturas de lançamentos de versões mais recentes e elas corrigem problemas relacionados ao processo de atualização
## baixar pacotes atualizados
```
sudo dnf system-upgrade download --releasever=39
```
o sistema suporta no máximo 2 versões por verz (por exemplo, 38 para 40). caso queira atualizar mais versões, é recomendável fazê-lo em várias etapas menores

depois, o fedora vai te fazer várias perguntas, apenas confirme com um Yes. No final, você verá isso.
```
Transaction saved to /var/lib/dnf/system-upgrade/system-upgrade-transaction.json.
Download complete! Use 'dnf system-upgrade reboot' to start the upgrade.
To remove cached metadata and transaction use 'dnf system-upgrade clean'
The downloaded packages were saved in cache until the next successful transaction.
You can remove cached packages by executing 'dnf clean packages'.
```
você vai executar esses comando quando a instalação for concluída com sucesso.
## ativar processo de atualização
isso reiniciará sua máquina (imediatamente!, sem contagem regressiva ou confirmação, então feche outros programas e salve seu trabalho) no processo de atualização em execução em um terminal de console:
```
sudo dnf system-upgrade reboot
```
uma vez que o processo de atualização seja concluído, seu sistema reiniciará uma segunda vez na versão de lançamento atualizada do Fedora Linux.

## 
após a instalação concluída, rode alguns comando para 
## verificar versão
```
cat /etc/fedora-release
```

## referência

- https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/
