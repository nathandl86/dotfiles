
echo -e "\n>> Installing pyenv"
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

# Installing Python 2 and 3
echo -e "\n>> Installing Python 2 and 3"
pyenv install 3.7.10
pyenv install 3.8.12
pyenv install 3.9.7

pyenv global 3.9.7

echo -e '\n>> Installing Poetry'
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

# Install pipenv
pip install --upgrade pip
pip install pipenv jupyter devpi-server devpi-web
