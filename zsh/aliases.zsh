# Reload it all
alias reload!='. ~/.zshrc'

# Code
alias ...='cd ../..'
alias ..='cd ..'
alias .d='cd ~/.dotfiles'
alias h='history'
alias js='node'
alias npm-exec='PATH=$(npm bin):$PATH'

# MacVim
alias vim='mvim -v'
alias v='mvim -v .'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Applications
alias mate='open -a "TextMate"'
alias bench='open -a "MySqlWorkbench"'
alias chrome='open -a "Google Chrome"'
alias firefox='open -a "Firefox"'
alias grip='open -a "Datagrip"'
alias pman='open -a "Postman"'
alias music='open -a "Spotify"'
alias note='open -a "OneNote"'
alias intj='open -b com.jetbrains.intellij'
alias testdisk='sudo testdisk'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias dt='date "+%F %T"'
alias df='df -h'
alias du='du -h -d 2'

# alias la='ls -lah $LS_COLOR'
alias la='eza -alhg --icons --git --classify --group-directories-first'
alias ll='ls -alGh'
alias ls='ls -Gh'
alias lsg='ll | grep'
function cl() { cd "$@" && la ; }

# editing
# alias ae='mvim -v ~/.dotfiles/zsh/aliases.zsh'
# alias de='mvim -v ~/.dotfiles'
# alias ge='mvim -v ~/.dotfiles/git/aliases.zsh'
# alias pe='mvim -v ~/.dotfiles/zsh/prompt.zsh'
# alias ve='mvim -v ~/.vimrc'
# alias ze='mvim -v ~/.zshrc'

alias onepassLogin="/usr/local/bin/oplogin && source /tmp/.opsession"

# mac netstat that sort of works
function macns() {
  netstat -Watnlv | grep LISTEN | awk '{"ps -o comm= -p " $9 | getline procname;colred="\033[01;31m";colclr="\033[0m"; print cred "proto: " colclr $1 colred " | addr.port: " colclr $4 colred " | pid: " colclr $9 colred " | name: " colclr procname;  }' | column -t -s "|"
}

# for x86 brew
alias brew86='arch -x86_64 /usr/local/homebrew/bin/brew'

alias cat='bat'
