# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# inlcude homedir local bins
export PATH=$HOME/.local/bin:$PATH

# include .zsh_profile
source ~/.zsh_profile

# define current OS
if [[ "$(uname -s)" == *"Darwin"* ]]; then
    CURRENT_OS=MacOS
elif [[ "$(uname -s)" == *"Linux"* ]]; then
    CURRENT_OS=Linux
else
    echo "Unknown system type! Add it to .zshrc"
    CURRENT_OS="Something else"
fi


# Applications
# ------------


# Alacritty
if [[ $CURRENT_OS == "MacOS" ]]; then
    alias alacritty="/Applications/Alacritty.app/Contents/MacOS/alacritty"
fi


# ranger
# 
# MacOS Only
if [[ $CURRENT_OS == "MacOS" ]]; then
    # alias ranger="$HOME/ranger-1.9.2/ranger.py"
fi


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# uv - Python package manager & virtualenv manager
which uv
if [ $? -eq 0 ]; then
    eval "$(uv generate-shell-completion bash)"
    eval "$(uv generate-shell-completion zsh)"
    eval "$(uvx --generate-shell-completion bash)"
    eval "$(uvx --generate-shell-completion zsh)"
fi


# psql
# 
# MacOS Only
if [[ $CURRENT_OS == "MacOS" ]]; then
    # export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
fi


# FFMPEG
# 
# MacOS Only
if [[ $CURRENT_OS == "MacOS" ]]; then
    # export PATH=$HOME/ffmpeg-7.1:$PATH
fi


# nvim (built from source)
# 
# MacOS Only
if [[ $CURRENT_OS == "MacOS" ]]; then
    #export PATH=$HOME/nvim-macos-x86_64/bin:$PATH
fi
# 
# Linux Only
if [[ $CURRENT_OS == "Linux" ]]; then
    #export PATH=$HOME/nvim-linux-x86_64/bin:$PATH
fi
alias vim="nvim"

# ripgrep
# 
# MacOS Only
if [[ $CURRENT_OS == "MacOS" ]]; then
    # export PATH=$HOME/ripgrep-14.1.0-x86_64-apple-darwin:$PATH
fi

# MongoDB
# 
# MacOS Only
if [[ $CURRENT_OS == "MacOS" ]]; then
    # export PATH=$HOME/mongodb-macos-x86_64-8.0.9/bin:$PATH
fi



# ---------------------
# Programming languages
# ---------------------


# Go (Golang) variables
go env
if [ $? -eq 0 ]; then
    export GOBIN="$(go env GOPATH)/bin"
    export PATH=$GOBIN:$PATH
fi



# Python settings
#
# Add bin dir to PATH 
# only for MacOS as it has only symlink to real python binary in /usr/local/bin
if [[ $CURRENT_OS == "MacOS" ]]; then
    export PYTHONBINPATH="$(readlink $(which python3) | sed -E 's/[./]+(\/.*)\/.*$/\1/g')"
    export PATH=$PYTHONBINPATH:$PATH
fi



# ---------------------
# Oh-My-Zsh
# ---------------------


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mgutz" # set by `omz`

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
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
#


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi


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



# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
    . '/Users/guff192/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/guff192/google-cloud-sdk/completion.zsh.inc' ]; then
    . '/Users/guff192/google-cloud-sdk/completion.zsh.inc';
fi

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/guff192/yandex-cloud/path.bash.inc' ]; then
    source '/Users/guff192/yandex-cloud/path.bash.inc';
fi

# The next line enables shell command completion for yc.
if [ -f '/Users/guff192/yandex-cloud/completion.zsh.inc' ]; then
    source '/Users/guff192/yandex-cloud/completion.zsh.inc';
fi

# The next line updates PATH for Yandex Cloud YDB CLI.
if [ -f '/Users/guff192/ydb/path.bash.inc' ]; then
    source '/Users/guff192/ydb/path.bash.inc';
fi

