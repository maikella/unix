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
shutdown -h 18:00 'O computadores serão desligados às 18h, horário do fim do expediente'
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

