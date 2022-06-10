#####################################
#  _               _                #
# | |__   __ _ ___| |__  _ __ ___   #
# | '_ \ / _` / __| '_ \| '__/ __|  #
# | |_) | (_| \__ \ | | | | | (__   #
# |_.__/ \__,_|___/_| |_|_|  \___|  #
#                                   #
#####################################

# ================  PS1 (Linux syntax)  ====================
# PS1_magenta='\[\e[0;32m\]' # Green PWD
# PS1_normal='\[\e[0;35m\]' # purple Text
PS1_magenta='\[\e[0;35m\]' # Purple PWD
PS1_normal='\[\e[0;32m\]' # Green Text
PS1_curdir='$(truncate "\w")'
PS1="\u ${PS1_magenta}${PS1_curdir}${PS1_normal}\$ "

# ================  Aliases  ====================
# alias c="clear; ls"
alias dota="clear; dotnet build; clear; dotnet run"
alias dotb="clear; dotnet build"
alias dotr="clear; dotnet run"
alias ga="git add"
alias gp="git pull"
alias gs="git status"
alias gtc="git clone"
alias gtodo="git commit -m 'updated todo list'"
alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias ls="ls --color" # necessary on linux, not on mac if you use export CLICOLOR=1
alias main="clear; python main.py"
alias mup="mupdf"
alias mutt="neomutt"
alias mv="mv -v"
alias ncm="python /home/iainw/Programming/ncmusic/src/main.py"
alias o="open"
alias pacupgrade="sudo pacman -Syy"
alias py="python"
alias pass="pwgen -cdp"
alias psp="psp-gcc"
alias mpvv="mpv --no-video"
alias rm="rm -i"
alias scs="cmatrix"
alias smi="sudo make install"
alias settings="xfce4-settings-manager"
alias st="start"
alias sql="sqlitebrowser"
alias update="sudo pacman -Svyu"
alias v="gvim"

# ================  Export  ====================
export PYENV_ROOT="$HOME/.pyenv"
export DOTNET_ROOT=$HOME/dotnet
export PATH=/usr/local/sbin:/home/iain/.local/bin:/home/iain/Shell/:$HOME/dotnet/:/usr/local/bin/:/usr/bin/:/usr/share/dotnet/:$PYENV_ROOT/bin:$PATH # Put your own path here
export CLICOLOR=1
export LS_COLORS="di=1;36;40:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43" # Linux formatting
export BROWSER=opera
export EDITOR=gvim # would be mvim on MacOS
export BASH_SILENCE_DEPRECATION_WARNING=1 # Make bash shut up about switching to zsh

# ================  Eval  ====================
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
# Pyenv stuff, always very good to have

# ================  Functions  ====================
function c() {
        if [[  -n $1  ]]; then
                command cd "$@"
                clear
                ls
        else
                clear
                ls
        fi
}

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

# This only takes two arguments
function gFull() {
command git add "$1" &&
command git commit -m "$2" &&
command git push
}

# ================  Scripts to run on startup  ====================
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# neofetch --ascii_distro mac
neofetch --ascii_distro arch
ls
