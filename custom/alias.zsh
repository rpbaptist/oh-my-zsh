#! /bin/sh

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

alias todo="subl ~/Drive/Notes/my.tasks"

alias dirsize="du -sch ./* | sort -h"

# alias git="lab"

# Save files, save lives
alias tp="trash-put"
alias rm='echo "Careful now!"; false'

alias dockerprune='docker rmi $(docker images -f "dangling=true" -q)'

alias crontab='EDITOR=vi crontab'

alias ansible-update="ANSIBLE_CONFIG=$HOME/.ansible/ansible.cfg \
                      ansible-playbook $HOME/.ansible/main.yml \
                      --inventory $HOME/.ansible/hosts \
                      --vault-password-file $HOME/.ansible/vault-pass.txt"

alias qmk='cd ~/code/qmk_firmware'

alias arst="asdf"
alias qmkcli="/home/richard/.local/bin/qmk"

# git

alias gs='git status'
alias gdh='git diff HEAD'
alias gdm='git diff master'
alias gpu='git push -u'

alias grho='git reset --hard @{upstream}'
alias gcf='git commit --fixup'

# Delete merged branches on master
alias gbdm='git branch --merged | egrep -v "(^\*|master|production)" | xargs -r -n 1 git branch -d'

alias gsync='git fetch && git pull && gbdm && git remote prune origin'
alias gclean='git reset --hard && git clean -fd'

# hub shortcuts
alias gpr='hub pull-request'
alias gprc='hub pull-request'

# coding
alias wga='cd ~/code/webinargeek/app'
alias wgp='cd ~/code/webinargeek/phoenix'
