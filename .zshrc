PATH=/usr/local/Cellar/python:$PATH
PATH=/usr/local/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
bindkey -e
autoload -U compinit
compinit
autoload predict-on
predict-on

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

alias g="git"
alias ll="ls -al"
function spec () { ruby ~/work/spmh/script/spec  $1 }
alias -s rb=spec
alias emacs="emacs -nw"
alias -s py="python"
alias rs="rails s"
alias rc="rails c"
alias rg="rails g"
alias r="ruby"
