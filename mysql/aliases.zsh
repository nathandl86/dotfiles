# Mysql
alias startdb='brew services start mysql@5.7'
alias stopdb='brew services stop mysql@5.7'
alias restartdb='brew services restart mysql@5.7'
alias importdb='echo "mysql -u <username> -p <databasename> < <filename.sql>"'
