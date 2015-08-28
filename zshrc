# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby tmux)

zstyle ':completion:*' hosts off

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/derekbarber/.rbenv/shims:/Users/derekbarber/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=~/bin:~/workspace/ZendFramework/bin:$PATH
export PATH=/usr/local/mysql/bin:/usr/local/sbin:$PATH
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

export JSTESTDRIVER_HOME=~/bin

export LS_COLORS='di=01;33'

# aliases

alias cd..='cd ..'
alias l='ls -al'
alias lp='ls -p'

alias kp='ps auxwwww'

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gitlog='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# Start postgresql
alias startpg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

export RI="--format ansi --width 70"

eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add npm path
export PATH="/usr/local/share/npm/bin:$PATH"

# Automatically quote globs in URL and remote references
__remote_commands=(scp rsync)
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
zstyle -e :urlglobber url-other-schema '[[ $__remote_commands[(i)$words[1]] -le ${#__remote_commands} ]] && reply=("*") || reply=(http https ftp)'

export RMAGICK_BYPASS_VERSION_TEST=true
export PGHOST=localhost

DISABLE_CORRECTION="true"
unsetopt correct_all

export MANDRILL_USERNAME="derek@smartsettle.com"
export MANDRILL_APIKEY="dm00ryxv1N1LS-INWU2LBQ"
