# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mamborn"

# Example aliases
alias zshconfig="mvim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PAGER=less
export LESS=-R
export LC_CTYPE=sv_SE.UTF-8
export EDITOR=mvim
export VISUAL=/Users/ma/bin/mvim_fg.sh

local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"
PROMPT='%{$fg[blue]%}%~%{$reset_color%}
${smiley} %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt i v p)$(git_prompt_info)%{$reset_color%}'

PATH=/usr/local/bin:/usr/local/sbin:$PATH:/usr/local/heroku/bin:/Users/ma/bin:/usr/local/share/npm/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias g='git'
alias gms='git merge --squash'
alias h='heroku'
alias halog='heroku logs -t -a alpha-publish'
alias hblog='heroku logs -t -a beta-publish'
alias hc='heroku run console -a magplus-publish'
alias hca='heroku run console -a alpha-publish'
alias hcb='heroku run console -a beta-publish'
alias hcg='heroku run console -a gamma-publish'
alias heroku='nocorrect heroku '
alias hglog='heroku logs -t -a gamma-publish'
alias hlog='heroku logs -t -a magplus-publish'
alias hslog='heroku logs -t -a magplus-staging'
alias agr="alias | grep"
alias gcah='git commit --amend -C HEAD'
alias grb='git rebase'
