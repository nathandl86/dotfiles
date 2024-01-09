
echo "\n>> Installing Node"

lts=$(curl https://nodejs.org/dist/index.json | jq -r '.[] | select(.lts) | .version' | head -n 1 | tail -c +2)
cts=$(node --version)

global_default_version=$lts
node_versions=(
  latest  # latest will be current but likely not yet in LTS
  $global_default_version
)

for v in "${node_versions[@]}"; do
    if [[ -z $(mise ls -i | grep node | grep $v) ]]; then
        echo "Installing Node $v"
        mise install node@$v
    else
        echo "Node $v is already installed"
    fi
done

mise use -g node@$global_default_version

# reload shell so `npm` is now available
eval "$(mise activate zsh)"

if test $(which npm)
then
  npm update npm -g
fi

lnv=$(npm info npm | grep -o -m 1 "version: '.*'" | sed "s/version: '//g" | sed "s/'//g")
cnv=$(npm -v)

if [[ $lnv != $cnv ]]
then
  echo "updating npm $cnv -> $lnv"
  npm install npm -g
else
  echo "npm is current"
fi

echo '\n>> Installing node packages'

global_node_packages=(
    "nodemon"
    "eslint"
    "instant-markdown-d"
)

if test $(which npm); then
    for p in "${global_node_packages[@]}"; do
        if test ! $(which $p); then
            echo ">> Installing $p"
            npm install $p -g
        else
            echo ">> $p is already installed"
        fi
    done
fi

unset global_default_version
unset global_node_packages
unset lts
unset cts
