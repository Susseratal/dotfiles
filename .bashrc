#####################################
#  _               _                #
# | |__   __ _ ___| |__  _ __ ___   #
# | '_ \ / _` / __| '_ \| '__/ __|  #
# | |_) | (_| \__ \ | | | | | (__   #
# |_.__/ \__,_|___/_| |_|_|  \___|  #
#                                   #
#####################################

# ================  PS1 (OSX syntax)  ====================
PS1_magenta='\[\e[35;1m\]'
PS1_normal='\[\e[0m\]'
PS1_curdir='$(truncate "\w")'
PS1="\u ${PS1_magenta}${PS1_curdir}${PS1_normal}\$ "

# ================  PS1 (Linux syntax)  ====================
PS1_magenta='\[\e[0;35m\]'
PS1_normal='\[\e[0;32m\]'
PS1_curdir='$(truncate "\w")'
PS1="\u ${PS1_magenta}${PS1_curdir}${PS1_normal}\$ "

# ================  Aliases  ====================
alias c="clear; ls"
alias cdp="cd " #cd to directory where I store programming stuff
alias dot="clear; dotnet run main.cs"
alias ga="git add"
alias gp="git pull"
alias gs="git status"
alias gtc="git clone"
alias gtodo="git commit -m 'updated todo list'"
alias lsblk="diskutil list"
alias ipaddress="ipconfig getifaddr en0" #Only required on macos I believe
alias ls="ls --color" #necessary on linux, not on mac if you use export CLICOLOR=1
alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias main="clear; python main.py"
alias mup="mupdf-gl"
alias mutt="neomutt"
alias o="open"
alias py="python"
alias rm="rm -i"
alias v="vi"

# ================  Export  ====================
export PATH=$PATH #Put your own path here
export CLICOLOR=1
export LSCOLORS=Gafxcxdxbaegedabagacad # Both colour based things, would be different on linux
export LS_COLORS="di=1;36;40:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43" #Linux formatting
export BROWSER=opera
export EDITOR=gvim #would be mvim on MacOS
export BASH_SILENCE_DEPRECATION_WARNING=1 #Make bash shut up about switching to zsh

# ================  Eval  ====================
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#Pyenv stuff, always very good to have

# ================  Brew  ====================
. $(brew --prefix asdf)/asdf.sh

# ================  tns-completion  ====================
###-tns-completion-start-###
if [ -f /Users/iainwalker/.tnsrc ]; then 
    source /Users/iainwalker/.tnsrc 
fi
###-tns-completion-end-###
#I have no idea what this does, but I think it's important

# ================  Functions  ====================
function cd() {
command cd "$@"
ls
}

function mkcd() {
command mkdir "$@"
cd "$@"
}

function truncate() {
  tmp=$*
  if [ "${#tmp}" -le 32 ]; then
    echo "$tmp"
  else
    echo "...${tmp:${#tmp}-20}"
  fi
}

#Homebrew stuff - not necessary on linux - OSX specific
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# ================  Scripts to run on startup  ====================
#Whatever you may want here
