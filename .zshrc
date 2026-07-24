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


# Bat config
export BAT_THEME="gruvbox-dark"
alias f="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# Lazy
alias lg="lazygit"

# direnv
eval "$(direnv hook zsh)"


############
# Starship #
############
eval "$(starship init zsh)"

#######################################
# Everything below here is MacOS only #
#######################################
# ZSH Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(direnv hook zsh)"
