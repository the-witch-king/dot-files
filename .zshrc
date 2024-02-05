# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  wd
  zsh-autosuggestions
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Aliases for working with this file
alias src="source ~/.zshrc" 
alias rc="vim ~/.zshrc"

# Saving dot files to the repo
alias savevim="\cp -R ~/.config/nvim ~/code/dot-files"
alias saverc="\cp ~/.zshrc ~/code/dot-files/zshrc"
alias saveay="\cp ~/.config/alacritty/alacritty.yml ~/code/dot-files/alacritty.yml"
alias saveconfigs="savevim; saverc; saveay;"

# Git
alias git-clean='git branch | egrep -v "(^\*|master|main)" | xargs git branch -D'
alias gbsort='git branch --sort=committerdate'

# We use nvim for everything.
alias vim="nvim"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Docker-compose shortcut cause I'm lazy
alias dc="docker-compose"

# Docker stuff
function dockerRemoveImages() {
  docker rmi -f $(docker images -aq)
}

# Useful terminal command improvements
alias ls="lsd -a --group-directories-first"
alias cat="bat"
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir="mkdir -vp"
alias clearswap=" rm -rf ~/.local/state/nvim/swap/"


# Bat config
export BAT_THEME="gruvbox-dark"
alias f="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# direnv
eval "$(direnv hook zsh)"

# Float
alias pshell="NATIVE=true bin/manage shell_plus"
alias t="bin/non_docker_run_all_tests.sh"
alias one="vim ~/Documents/1on1s/next.md"
alias ngrok-core="ngrok http --region=us --domain=mike-django.ngrok.io 8000"
alias ngrok-rt-core="ngrok http --region=us --hostname=mikec.ngrok.dev 8000"
alias ngrok-rt-db="ngrok tcp --region=us --remote-addr=9.tcp.ngrok.io:22047 5432"
alias ngrok-flinks="ngrok http --domain=float-dev-flinks.ngrok.io 8000"


# eval "$(starship init zsh)"

#######################################
# Everything below here is MacOS only #
#######################################

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH=$PATH:/Users/mike/.asdf/shims/ # Get python as global version lol
export PATH="/Users/mike/.local/bin:$PATH" # Poetry

# Python & Poetry
export PATH=$PATH:$HOME/.local/bin # Poetry & others
export GPG_TTY=$(tty)

# opam configuration
[[ ! -r /Users/mike/.opam/opam-init/init.zsh ]] || source /Users/mike/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

