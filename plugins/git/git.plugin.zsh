# Aliases
alias g='git'
compdef g=git
alias gs='git status'
compdef _git gst=git-status
compdef _git gd=git-diff
alias gds='git diff --staged'
compdef _git gdc=git-diff
alias gdh='git diff HEAD'
compdef _git gdc=git-diff
alias gdt='git diff-tree --no-commit-id --name-only -r'
compdef _git gdc=git diff-tree --no-commit-id --name-only -r
alias gl='git pull'
compdef _git gl=git-pull
alias gup='git pull --rebase'
compdef _git gup=git-fetch
alias gf='git fetch'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
alias gd='git diff'
alias gdm='git diff master'
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gdt='git difftool'
alias gc='git commit -v'
compdef _git gc=git-commit
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --amend --no-edit'
compdef _git gc!=git-commit
alias gca='git commit -v -a'
compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -a --no-edit --amend'
alias gcam='git commit -a -m'
alias gcf='git commit --fixup'

function gcfr() {
  git commit --fixup $1 && git rebase -i $1^
}

function grbi() {
  local commit_hash
  if [ -z "$1" ]
  then
  # First commit of the branch
    commit_hash="$(git cherry master -v | head -1 |  awk '{split($0,a," "); print a[2]}')^"
  else
    commit_hash=$1
  fi
  git rebase -i "$commit_hash"
}

alias gcb='git checkout -b'
alias gcl='git clone --recursive'
alias gcm='git checkout master'

alias grho='git reset --hard @{upstream}'

alias gcmsg='git commit -m'
compdef _git gcmsg=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gr='git remote'
alias grm='git rm'
compdef _git gr=git-remote
alias grv='git remote -v'
compdef _git grv=git-remote
alias grmv='git remote rename'
compdef _git grmv=git-remote
alias grrm='git remote remove'
compdef _git grrm=git-remote
alias grset='git remote set-url'
compdef _git grset=git-remote
alias grup='git remote update'
compdef _git grset=git-remote
alias grbc='git rebase --continue'
compdef _git grbc=git-rebase
alias grba='git rebase --abort'
compdef _git grba=git-rebase
alias grbs='git rebase --skip'
compdef _git grbs=git-rebase
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gbr='git branch --remote'
alias gbu='git branch -u'
alias gbl='git blame'
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcl='git config --list'
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'
alias glg='git log --stat --max-count=10'
compdef _git glg=git-log
alias glgg='git log --graph --max-count=10'
compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
compdef _git glgga=git-log
alias glo='git log --oneline --decorate --color'
compdef _git glo=git-log
alias glog='git log --oneline --decorate --color --graph'
compdef _git glog=git-log
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias gap='git add --patch'
alias gaa='git add --all'
alias gm='git merge'
alias gmff='git merge --no-ff'
compdef _git gm=git-merge
alias gma='git merge --abort'
alias grh='git reset HEAD'
alias grs='git reset --soft'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard && git clean -fd'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# Sign and verify commits with GPG
alias gcs='git commit -S'
compdef _git gcs=git-commit
alias gsps='git show --pretty=short --show-signature'
compdef _git gsps=git-show

alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gdw='git diff --word-diff'

#remove the gf alias
#alias gf='git ls-files | grep'

alias gpoat='git push origin --all && git push origin --tags'
alias gmt='git mergetool --no-prompt'
compdef _git gmt=git-mergetool

alias gg='git gui citool'
alias gga='git gui citool --amend'
alias gk='gitk --all --branches'

alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
compdef ggpull=git
alias ggpur='git pull --rebase origin $(current_branch)'
compdef ggpur=git
alias ggpush='git push origin $(current_branch)'
compdef ggpush=git
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
compdef ggpnp=git

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
alias glp="_git_log_prettily"
compdef _git glp=git-log

# Work In Progress (wip)
# These features allow to pause a branch development and switch to another one (wip)
# When you want to go back to work, just unwip it
#
# This function return a warning if the current branch is a wip
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}
# these alias commit and uncomit wip branches
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip-- [ci skip]"'

alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

# Delete merged branches on master
alias gbdm='git branch --merged | grep -v "\*" | grep -v master | grep -v production | xargs -n 1 git branch -d'

alias gts='git tag -s'
alias gtv='git tag | sort -V'

# these alias ignore changes to file
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream master'

alias gitmail='git config user.email'

# These are actually [hub](https://github.com/github/hub) aliasses
alias gpr='git pull-request'

alias gpu='git push -u'
alias gpf='git push --force-with-lease'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
