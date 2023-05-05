
completion='$(brew --prefix)/share/zsh/site-functions/_rtx'

if test -f $completion; then
    rtx completion zsh  > $completion
fi
