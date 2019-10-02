#! bin/sh

alias resh=". ~/.zshrc"
alias zshenv="$EDITOR ~/.zshenv"
alias zshrc="$EDITOR ~/.zshrc"
alias omz="$EDITOR ~/.oh-my-zsh"

alias sudo="sudo "
alias sl="subl"
alias scp="noglob scp"

# I want to use gs for "git status"
alias ghostscript="/usr/bin/gs"
alias toclip="xclip -sel clip <"

alias todo="subl ~/Dropbox/Notes/my.tasks"

alias dirsize="du -sch ./* | sort -h"

alias git="lab"

# Save files, save lives
alias tp="trash-put"
alias rm='echo "Careful now!"; false'

alias dockerprune='docker rmi $(docker images -f "dangling=true" -q)'

alias crontab='EDITOR=vi crontab'

alias ansible-update="ANSIBLE_CONFIG=$HOME/.ansible/ansible.cfg \
                      ansible-playbook $HOME/.ansible/main.yml \
                      --inventory $HOME/.ansible/hosts \
                      --vault-password-file $HOME/.ansible/vault-pass.txt"

