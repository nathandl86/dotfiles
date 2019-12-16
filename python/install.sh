
echo -e "\n>> Installing pyenv"
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

# Installing Python 2 and 3
echo -e "\n>> Installing Python 2 and 3"
pyenv install 2.7.14
pyenv install 3.6.4
pyenv install 3.7.5
pyenv install 3.8.0
pyenv global 3.7.5

# Install pipenv
pip install pipenv jupyter devpi-server devpi-web
