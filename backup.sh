#! /bin/bash

echo "==========================="
echo " II  Linux Backup Tool  II "
echo "==========================="

read -p "Digite o diretório para backup: " diretorio_backup

if [ ! -d "$diretorio_backup" ]; then
	echo "Diretório não existe!"
	exit 1
fi

mkdir -p backups

data=$(date +"%Y%m%d_%H%M%S")

nome_arquivo="backup_$data.tar.gz"

tar -czf "backups/$nome_arquivo" "$diretorio_backup"

echo "Backup criado com sucesso"

du -h "backups/$nome_arquivo"

echo "Backup realizado em $(date)" >> backup.log
