# Environment Variables
export GITHUB_USER='shaunbent'

# Sync location
syncfolder="$HOME/Google Drive/System Configuration" # sourcing a file breaks with backslashes
syncfolderalias="$HOME/Google\ Drive/System\ Configuration" # aliasing needs backslashes as it's an actual command

# Export the path so it can be used elsewhere (such as in our .vimrc file)
export SYNCFOLDER=$syncfolder
export SYNCFOLDERALIAS=$syncfolderalias

# Vagrant fixes issue with Chef not completing
if `tty -s`; then
   mesg n
fi

# reorder PATH so local bin is first
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# When installing Node via Homebrew you may need to add NPM to your $PATH
    # export PATH="$PATH:/usr/local/share/npm/bin"
# Noticed to update NPM using `npm i -g npm` that my path picks up `/usr/local/bin/npm` first
# So instead I'm moving that to the start of my path
export PATH="/usr/local/share/npm/bin:$PATH"

# misc alias
alias s='open -a "Sublime Text 2"'
alias hd="cd ~"
alias change_hosts="sudo nano /etc/hosts"
alias drive="cd ~/Google\ Drive"
alias sites="cd ~/Google\ Drive/Sites"
alias ws="cd ~/Workspace"
alias onesport="cd ~/Workspace/onesport"
alias live="cd ~/Workspace/liveexperience"
alias zsh="atom ~/Google\ Drive/System\ Configuration"
alias willy="ssh root@37.139.31.162"

# Sandbox alias
alias su='VBoxManage startvm "BBC Sandbox" --type headless'
alias ss='ssh root@192.168.192.10'
alias sh='VBoxManage controlvm "BBC Sandbox" poweroff'

# Vagrant alias
alias vs="vagrant suspend"
alias vu="vagrant up"
alias vd="vagrant destroy"
alias vr="vagrant box remove responsive virtualbox"
alias vst="vagrant status"

# git alias
alias gs='git status'
alias gc='git commit'
alias gd='git diff'
alias ga='git add'

# Proxy stuff
export NETWORK_LOCATION="$(/usr/sbin/scselect 2>&1 | egrep '^ \* ' | sed 's:.*(\(.*\)):\1:')"

if [ $NETWORK_LOCATION = 'BBC On Network' ]; then
    export http_proxy='http://www-cache.reith.bbc.co.uk:80'
    export https_proxy='http://www-cache.reith.bbc.co.uk:80'
    export ftp_proxy='ftp-gw.reith.bbc.co.uk:21'
    export socks_proxy='socks-gw.reith.bbc.co.uk:1085'

    export HTTP_PROXY='http://www-cache.reith.bbc.co.uk:80'
    export HTTPS_PROXY='http://www-cache.reith.bbc.co.uk:80'
    export FTP_PROXY='ftp-gw.reith.bbc.co.uk:21'
    export SOCKS_PROXY='socks-gw.reith.bbc.co.uk:1085'

    git config --global http.proxy $http_proxy
else
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset socks_proxy

    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset SOCKS_PROXY

    git config --global --unset http.proxy
fi;

# Color grep results
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Color on ls - there might a nicer way to achieve this
if ls --color -d . > /dev/null 2>&1; then
    alias ls='ls --color=auto'
    export LS_COLORS="di=34:ln=36:so=35;40:pi=1;35;40:ex=33:bd=32;40:cd=33;40:su=31:sg=1;31:tw=1;35:ow=35:or=31;40:"
elif ls -G -d . > /dev/null 2>&1; then
    alias ls='ls -G'
    export CLICOLOR=1
    export LSCOLORS=exgxfaFadxcadabxBxFxfx
fi

# Create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}

# get gzipped size
function gz() {
    echo "orig size    (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}

# Auto completion
autoload -U compinit
compinit -C

# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Convert movie file to animated gif
gif-ify() {
    if [[ -n "$1" && -n "$2" ]]; then
        ffmpeg -i $1 -pix_fmt rgb24 temp.gif
        convert -layers Optimize temp.gif $2
        rm temp.gif
    else
        echo "proper usage: gif-ify <input_movie.mov> <output_file.gif>. You DO need to include extensions."
    fi
}

function restart_finder() {
    killall Finder
}

function show_hidden_files() {
    defaults write com.apple.finder AppleShowAllFiles TRUE
    restart_finder
}

function hide_hidden_files() {
    defaults write com.apple.finder AppleShowAllFiles FALSE
    restart_finder
}

set completion-ignore-case on

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# source $ZSH/oh-my-zsh.sh
source "$syncfolder/dot/prompt.zsh"
