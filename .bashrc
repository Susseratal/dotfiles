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
#PS1_magenta='\[\e[0;32m\]' #Green PWD
#PS1_normal='\[\e[0;35m\]' #purple Text
PS1_magenta='\[\e[0;35m\]' #Purple PWD
PS1_normal='\[\e[0;32m\]' #Green Text
PS1_curdir='$(truncate "\w")'
PS1="\u ${PS1_magenta}${PS1_curdir}${PS1_normal}\$ "

# ================  Aliases  ====================
alias audio="pavucontrol & disown"
alias battery="cat /sys/class/power_supply/BAT0/capacity"
alias c="clear; ls"
alias cdp="cd " #cd to directory where I store programming stuff
alias checkwifi="nmcli device wifi list"
alias dot="clear; dotnet run main.cs"
alias emc="v main.c"
alias emcs="v main.cs"
alias emp="v main.py"
alias firefox="firefox & disown; exit"
alias ga="git add"
alias gp="git pull"
alias gs="git status"
alias gtc="git clone"
alias gtodo="git commit -m 'updated todo list'"
alias ipaddress="ipconfig getifaddr en0" #Only required on macos I believe
alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias ls="ls --color" #necessary on linux, not on mac if you use export CLICOLOR=1
alias lsblk="diskutil list"
alias main="clear; python main.py"
alias mup="mupdf-gl"
alias mutt="neomutt"
alias mv="mv -v"
alias o="open"
alias pacupgrade="sudo pacman -Syy"
alias py="python"
alias rm="rm -i"
alias scs="cmatrix"
alias sleep="xset dpms force off"
alias smi="sudo make install"
alias sql="sqlitebrowser"
alias update="sudo pacman -Svyu"
alias v="vi"
alias wifimenu="sudo wifi-menu"

# ================  Export  ====================
export PATH=$PATH #Put your own path here
export CLICOLOR=1
export LSCOLORS=Gafxcxdxbaegedabagacad # OSX Formatting
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
