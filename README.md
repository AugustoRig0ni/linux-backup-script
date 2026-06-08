# backup.sh


# O que faz

- Script simples e bem orientado a fazer backups conforme o usuário declara qual dirétorio ele gostaria que fosse feito o backup

# Como usar

```
chmod +x .backup.sh

./backup.sh /home/augusto/projetos

```
# Requisitos

- Testado no (Ubuntu | Debia)
- Bash 4.0 +
- Comandos: `tar`,`du`,`mkdir`,`date`. 

## Agendamento automático (opcional)

Para rodar o backup automaticamente todo dia às 02:00:

```bash
crontab -e
```

Adicione a linha:

```
0 2 * * * /caminho/para/backup.sh /diretório/para/backup
```
