
if test $(which helm)
then
    if ! helm plugin list | grep diff &> /dev/null
    then
        echo "installing helm-diff"
        helm plugin install https://github.com/databus23/helm-diff
    fi
else
    echo "helm is not installed"
fi
