## Shutdow command
- Desligar o sistema imediatamente
```
sudo shutdown -h now
```
- Reinicializar o sistema imediatamente
```
sudo shutdown -r now
```
- Agendar um desligamento com uma mensagem
```
shutdown -h 18:00 'Os computadores serão desligados às 18h, horário do fim do expediente'
```
- Agendar um desligamento após `x` minutos
```
shutdown -h +5 //5 minutos
```
- Reinicializar o sistema com uma mensagem
```
shutdown -r +5 'Os computadores serão reinicializados em 5 minutos para aplicar as atualizações de sistema'
```
- Cancelar agendamento de desligamento
```
shutdown -c
```
## Referências
https://linuxstans.com/shutdown-linux/

https://www.tecmint.com/shutdown-poweroff-halt-and-reboot-commands-in-linux/

https://www.redhat.com/en/blog/linux-boot-shutdown-systemd

https://www.cyberciti.biz/faq/howto-shutdown-linux/

https://askubuntu.com/questions/73696/what-is-the-proper-terminal-way-to-shutdown

https://serverfault.com/questions/49367/how-to-properly-shutdown-or-reboot-a-unix-linux-server

https://unix.stackexchange.com/questions/562371/how-to-instant-shutdown-or-halt-in-linux-without-wait-the-system-or-apps-or-pro

https://unix.stackexchange.com/questions/640854/bash-shutdown-command-not-found

https://unix.stackexchange.com/questions/195898/what-is-the-difference-between-these-commands-for-bringing-down-a-linux-server

https://www.ionos.com/digitalguide/server/configuration/linux-shutdown-command/

diferença entre Halt e Shutdown

https://unix.stackexchange.com/questions/8690/what-is-the-difference-between-halt-and-shutdown-commands

safe

https://www.quora.com/What-is-the-absolute-fastest-way-to-shutdown-Linux-safely-I-have-a-need-for-shutting-it-down-as-quickly-as-possible-but-also-cant-risk-corruption-so-it-needs-to-be-safe
