
echo "\n>> Installing Python"

global_default_version="3.11.3"
python_versions=(
    "3.7.13"
    "3.9.7"
    $global_default_version
)

for v in "${python_versions[@]}"; do
    if [[ -z $(mise ls -i | grep python | grep $v) ]]; then
        echo "Installing Python $v"
        mise install python@$v
    else
        echo "Python $v is already installed"
    fi
done

echo "Setting global default Python version to $global_default_version"
mise use -g python@$global_default_version

# reload shell so `pip` is now available
eval "$(mise activate zsh)"

echo '\n>> Installing pypi packages'

global_python_packages=(
    "pipenv"
    "poetry"
    "jupyter"
    "ipython"
    # "devpi-server"
    # "devpi-web"
)

if test $(which pip); then
    pip install --upgrade pip

    for p in "${global_python_packages[@]}"; do
        if test ! $(which $p); then
            echo ">> Installing $p"
            pip install $p
        else
            echo ">> $p is already installed"
        fi
    done
fi

unset python_versions
unset global_default_version
unset global_python_packages
