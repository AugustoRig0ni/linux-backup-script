#!/usr/bin/env bash

set -euo pipefail


echo "==========================="
echo " II  Linux Backup Tool  II "
echo "==========================="

check_args() {
if [ $# -eq 0 ]; then
	echo "Uso: ./backup.sh"
exit 1
fi
}

check_dir() {

if 
	[ ! -d "$DIRETORIO" ]; then 
	echo "Diretório não existe: $DIRETORIO"
	exit 1
fi
}


create_backup() {

	mkdir -p backups
	data=$(date +"%Y%m%d_%H%M%S")
	nome_arquivo="backup_$data.tar.gz"
	tar -czf "backups/$nome_arquivo" "$DIRETORIO"
	echo "Backup criado com sucesso"
}

show_result(){

	du -h "backups/$nome_arquivo"
	echo "Backup realizado em $(date)" >> backup.log
}

main() {
	check_args "$@" 
	DIRETORIO="$1"
	check_dir
	create_backup
	show_result
}
main "$@"
