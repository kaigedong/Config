# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/bobo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

#fpath+=$HOME/.zsh/pure
#autoload -U promptinit; promptinit
#prompt pure

#ZSH_THEME="spaceship"
#SPACESHIP_TIME_SHOW=true
#SPACESHIP_TIME_SHOW=true
#SPACESHIP_DIR_TRUNC=0

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(extract git zsh-autosuggestions zsh-syntax-highlighting)

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
alias emacs="emacs -nw"
alias vim="emacs"
alias ls="lsd"
alias la="ls -lth"
alias cp="ppcp"
alias grep="rg"
alias cat="bat"

export http_proxy="http://127.0.0.1:10809"
export https_proxy="http://127.0.0.1:10809"

#rustlang
#export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static         # update toolchain
#export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup  # update rustup

#export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup  # for stable

export RUSTUP_DIST_SERVER=http://mirrors.rustcc.cn
export RUSTUP_UPDATE_ROOT=http://mirrors.rustcc.cn/rustup

export PATH=$PATH:$HOME/.cargo/bin

export WASM_BUILD_TYPE=release

#pyenv
export PYENV_ROOT="$HOME/.pyenv"

#nvm
source /usr/share/nvm/init-nvm.sh

#GOlang
export GOPATH="$HOME/go"
export GO111MODULE=on
#export GOPROXY=https://mirrors.aliyun.com/goproxy/

# ibus engine libpinyin
# screenfetch -A 'Arch Linux' | lolcat

#A tool to infer progress speed
# sudo nethogs 

if [[ $UID -ge 1000 && -d $HOME/bin && -z $(echo $PATH | grep -o $HOME/bin) ]]
then
    export PATH="${PATH}:$HOME/bin"
fi

#tmux
session="workspace"
tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
  # Set up your session
  export PATH="$HOME/.cargo/bin:$PYENV_ROOT/bin:$GOPATH/bin:/home/bobo:$PATH"

  eval "$(pyenv init -)"
  tmux new-session -s $session 2>/dev/null
else
  tmux attach -t $session 2>/dev/null
fi

typeset -U PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bobo/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bobo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bobo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bobo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
