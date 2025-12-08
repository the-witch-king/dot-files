# plugins=(
#   wd
#  zsh-autosuggestions
#  git
# )

# History
HISTSIZE=1000000
SAVEHIST=1000000

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Warp drive
wd() {
    . ~/.local/wd/wd.sh
}

# Aliases for working with this file
alias src="source ~/.zshrc" 
alias rc="vim ~/.zshrc"

# Saving dot files to the repo
alias savevim="\cp -R ~/.config/nvim ~/code/dot-files"
alias saverc="\cp ~/.zshrc ~/code/dot-files/zshrc"
alias saveay="\cp ~/.config/alacritty/alacritty.yml ~/code/dot-files/alacritty/alacritty.yml"
alias saveconfigs="savevim; saverc; saveay;"

# Git
alias gitClean!='git branch | egrep -v "(^\*|master|main)" | xargs git branch -D'
alias gbsort='git branch --sort=committerdate'
alias rebranch='!git rebase -i `git merge-base HEAD master`'

function() gitClean() {
  # Prune first 
  echo "pruning...."
  git prune && git remote prune origin

  # Clean up Branches that have been merged 
  echo "cleaning up merged branches...."
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -D

  # Clean branches that are gone 
  echo "cleaning up gone branches...."
  git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs git branch -D
}

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

# Git
alias gpf="git push --force-with-lease"
# LazyGit
alias lg="lazygit"

# direnv
eval "$(direnv hook zsh)"

# Rust
. "/Users/mike/.asdf/installs/rust/1.82.0/env"

# Find in branch changes (doesn't look through deleted files, duh"
function findInBranch() {
  git diff --name-only master | xargs grep -l "$1"
}

#########
# Float #
#########
# Mobile
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

function pshell() {
  source .venv/bin/activate
}
alias one="vim ~/Documents/1on1s/next.md"
alias ngrok-core="ngrok http --region=us --domain=mike-django.ngrok.io 8000"
alias ngrok-rt-core="ngrok http --region=us --hostname=mikec.ngrok.dev 8000"
alias ngrok-rt-db="ngrok tcp --region=us --remote-addr=9.tcp.ngrok.io:22047 5432"
alias ngrok-flinks="ngrok http --domain=float-dev-flinks.ngrok.io 8000"
alias ngrok-ptc-interact="ngrok http --domain=float-dev-ptc-interac.ngrok.dev 8000"
alias ngrok-cc="ngrok http --url=dev-float-currency-cloud.ngrok.dev 8000"
alias rabbit-hole="ssh mq-jumpbox -NL 9999:b-ba8c3423-00fe-4c29-ba6a-ca96a07be19b.mq.us-east-2.amazonaws.com:443"
alias todo="vim ~/TODO.txt"
alias scratch="vim ~/test/scratch_pad"
export AWS_PROFILE="float-dev"

# Test helpers

# alias t="bin/test"
alias t="bin/non_docker_test.sh"
# Watch Tests, requried `entr`
function() wt() {
  find . -name '*.py' | entr -s "bin/non_docker_test.sh $1"
}


############
# Starship #
############
eval "$(starship init zsh)"

#############
# "Plugins" #
#############
# autoload -Uz compinit
# compinit
# source ~/.zsh_plugins/git.sh

#######################################
# Everything below here is MacOS only #
#######################################
# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH=$PATH:/Users/mike/.asdf/shims/ # Get python as global version lol
export GPG_TTY=$(tty)

# opam configuration
[[ ! -r /Users/mike/.opam/opam-init/init.zsh ]] || source /Users/mike/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# ZSH Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(direnv hook zsh)"

export PATH="$HOME/.local/bin:$PATH"
