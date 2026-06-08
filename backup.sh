#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR/backups"
LOG_FILE="$SCRIPT_DIR/backup.log"


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


	mkdir -p "$BACKUP_DIR"
	data=$(date +"%Y%m%d_%H%M%S")
	nome_arquivo="backup_$data.tar.gz"
	tar -czf "$BACKUP_DIR/$nome_arquivo" "$DIRETORIO"
	echo "Backup criado com sucesso"
}

show_result(){

	du -h "$BACKUP_DIR/$nome_arquivo"
	echo "Backup realizado em $(date)" >> "$LOG_FILE"
}

main() {
	check_args "$@" 
	DIRETORIO="$1"
	check_dir
	create_backup
	show_result
}
main "$@"
