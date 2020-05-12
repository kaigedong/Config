# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="robbyrussell"
# ZSH_THEME="random"

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS=true
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  extract
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# git config --global http.proxy 'socks5://127.0.0.1:2333'
# git config --global https.proxy 'socks5://127.0.0.1:2333'
# export all_proxy=http://127.0.0.1:2444
# export http_proxy=http://127.0.0.1:2444
# export https_proxy=http://127.0.0.1:2444

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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

alias emacs="emacs -nw"
alias vim="emacs"
alias ls="lsd"
alias la="ls -lth"
alias sabaki="/opt/Sabaki/sabaki"

#rustlang
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static         # update toolchain
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup  # update rustup
export WASM_BUILD_TYPE=release

#pyenv
export PYENV_ROOT="$HOME/.pyenv"

#GOlang
export GOPATH="$HOME/go"
export GO111MODULE=on
#export GOPROXY=https://mirrors.aliyun.com/goproxy/

# ibus engine libpinyin
# screenfetch -A 'Arch Linux' | lolcat

#tmux
session="workspace"
tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
  # Set up your session
  export PATH="$HOME/.cargo/bin:$PYENV_ROOT/bin:$GOPATH/bin:/home/bobo:$PATH"

  eval "$(pyenv init -)"
  tmux new-session -s $session
fi

typeset -U PATH
