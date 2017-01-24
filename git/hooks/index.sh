#!/bin/bash

hooks=( "applypatch-msg" "commit-msg" "post-update" "pre-applypatch" "pre-commit" "pre-push" "pre-rebase" "prepare-commit-msg" "update" )

backup(hook) {
  file_path="$(pwd)/.git/hooks/$hook"
  if [ -z "$file_path" ]
  then
    cp -f "$file_path" "$fle_path.bak"
  fi
}

backup_all() {
  for hook in "${hooks[@]}"
  do
    backup($hook)
  done
}

install($hook) {
   cp -f "./$hook" "$(pwd)/.git/hooks/$hook"
}

install_all() {
  for hook in "${hooks[@]}"
  do
    if [ -z "./$hook" ]
    then
      backup($hook)
      install($hook)
    fi
  done
}

restore(hook) {
  file_path="$(pwd)/.git/hooks/$hook"
  if [ -z "$file_path.bak" ]
  then
    mv -f "$file_path.bak" "$fle_path"
  fi
}

restore_all() {
  for hook in "${hooks[@]}"
  do
    restore($hook)
  done
}

clean_all(hook) {
  rm -f *.bak 
}
