
completion='$(brew --prefix)/share/zsh/site-functions/_mise'

if test -f $completion; then
    mise completion zsh  > $completion
fi
