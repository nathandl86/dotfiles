
echo -e "\n>> Installing pyenv"
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

echo -e "\n>> Installing Python"
pyenv install 3.7.13
pyenv install 3.9.7
pyenv isntall 3.11.3

pyenv global 3.11.3

echo -e '\n>> Installing pypi packages'
pip install --upgrade pip
pip install pipenv poetry jupyter devpi-server devpi-web
