alias resh=". ~/.zshrc"
alias zshenv="$EDITOR ~/.zshenv"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

alias sudo='sudo '
alias sl='subl'
alias scp='noglob scp'
alias ghostscript='/usr/bin/gs'
alias toclip='xclip -sel clip <'

alias todo='subl ~/Sync/todo/my.tasks'

alias dirsize='du -sch ./* | sort -h'

alias git='hub'

# Generate tags for sublime in a project.
alias tags='ctags -R -f .tags'

# Save files, save lives
alias tp="trash-put"

alias dockerprune='docker rmi $(docker images -f "dangling=true" -q)'
