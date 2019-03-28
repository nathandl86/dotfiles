alias pmr='python manage.py runserver'
alias pmshell='python manage.py shell'
alias pmdb='python manage.py dbshell'
alias pycache_clear='find . | grep -E “(__pycache__|\.pyc|\.pyo$)” | xargs rm -rf'

# dev-pi: https://devpi.net/docs/devpi/devpi/stable/%2Bd/index.html
# devpi-server --start --init will be need the first time
alias start_devpi='devpi-server --start'
alias stop_devpi='devpi-server --stop'
