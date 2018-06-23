autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh
if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on $fg_bold[green]$(git_prompt_info)$reset_color"
    else
      echo "on $fg_bold[red]$(git_prompt_info)$reset_color"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with $fg_bold[magenta]unpushed$reset_color "
  fi
}

project_info() {
  if [[ -f package.json ]]
  then
    echo "$fg_bold[blue]/$reset_color$fg_bold[yellow]v$(jq -r .version package.json)$reset_color"
  elif [[ $VIRTUAL_ENV != "" ]]
  then
    echo "$fg_bold[blue]/$reset_color$fg_bold[yellow]$(basename $VIRTUAL_ENV)$reset_color "
  else
    echo ""
  fi
}

node_nvm_versions() {
  NODE_VER="$(node -v)"
  if ! [[ -z $NODE_VER ]]
  then
    echo "$fg_bold[blue]node/$reset_color$fg_bold[yellow]$NODE_VER$reset_color $fg_bold[blue]npm/$reset_color$fg_bold[yellow]$(npm -v)$reset_color "
  else
    echo ""
  fi
}

python_version() {
    echo "$fg_bold[blue]python/$reset_color$fg_bold[yellow]$(python -V | cut -f 2 -d' ')$reset_color "
}

user_info() {
  if [[ "${USER}" == "root" ]] then
    echo "$fg_bold[red]${USER}$reset_color"
  else
    echo "$fg_bold[green]${USER}$reset_color"
  fi;
}

git_info() {
  echo "$(git_dirty)$(need_push)"
}

current_dir() {
  echo $CURRENT_DIR_REV | cut -f1 -d'/' | rev
}

current_dir_path() {
  echo "~" $CURRENT_DIR_REV | cut -f2- -d'/' | rev
}

directory_info() {
  CURRENT_DIR_REV=$(pwd | rev)
  echo "$fg_bold[blue]$(current_dir)$(project_info)$reset_color @ $fg_bold[blue]$(current_dir_path)$reset_color"
}

version_info() {
  if [[ -f package.json ]]
  then
    echo "using $(node_nvm_versions)"
  elif find . -maxdepth 2 -path '*.py' -print -quit | grep -q . ;
  then
    echo "using $(python_version)"
  else
    echo ""
  fi
}

function prompt_right() {
  echo -e ""
}

function prompt_left() {
  echo -e "$(user_info) in $(directory_info) $(version_info)$(git_info)"
}

set_prompt () {
  export PROMPT=$'\n$(prompt_left)\n›› '
  export RPROMPT=$'$(prompt_right)'
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
