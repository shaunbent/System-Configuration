# Import ZSH
export ZSH=$HOME/.oh-my-zsh

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
alias hd="cd ~"
alias change_hosts="sudo nano /etc/hosts"
alias drive="cd ~/Google\ Drive"
alias sites="cd ~/Google\ Drive/Sites"
alias ws="cd ~/Workspace"
alias sandbox="cd ~/Workspace/sport-sandbox/"
alias onesport="cd ~/Workspace/sport-sandbox/projects/onesport"
alias live="cd ~/Workspace/sport-sandbox/projects/liveexperience"
# alias morph="cd ~/Workspace/morph"
alias zsh="atom ~/Google\ Drive/System\ Configuration"
alias willy="ssh root@37.139.31.162"
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias vtop="vtop --theme wizard"

alias npm-morph="npm --registry https://npm.morph.int.tools.bbc.co.uk --cert=\"$(cat /etc/pki/certificate.pem)\" --key=\"$(cat /etc/pki/certificate.pem)\" --cafile=/etc/pki/ca-bundle.crt"

# Vagrant alias
alias vs="vagrant suspend"
alias vu="vagrant up"
alias rvu="rake sandbox:up"
alias vd="vagrant destroy"
alias vrs="restart_sport_sandbox"
alias vst="vagrant status"

# git alias
alias grt="remove_git_tag"

# Proxy stuff
export NETWORK_LOCATION="$(/usr/sbin/scselect 2>&1 | egrep '^ \* ' | sed 's:.*(\(.*\)):\1:')"

if [ $NETWORK_LOCATION = 'On BBC Network' ]; then
    echo '!-- Enabling Reith Proxies --!'

    export http_proxy='http://www-cache.reith.bbc.co.uk:80'
    export https_proxy='http://www-cache.reith.bbc.co.uk:80'
    export ftp_proxy='ftp://ftp-gw.reith.bbc.co.uk:21'
    export socks_proxy='socks-gw.reith.bbc.co.uk:1085'
    export no_proxy='*.bbc.co.uk,localhost,127.0.0.1'

    export HTTP_PROXY='http://www-cache.reith.bbc.co.uk:80'
    export HTTPS_PROXY='http://www-cache.reith.bbc.co.uk:80'
    export FTP_PROXY='ftp://ftp-gw.reith.bbc.co.uk:21'
    export SOCKS_PROXY='socks-gw.reith.bbc.co.uk:1085'
    export NO_PROXY='*.bbc.co.uk,localhost,127.0.0.1'

    git config --global http.proxy $http_proxy

    # If SSH config has been prefixed with an underscore, move it back so it can be used
	if [ -f ~/.ssh/_config ]; then

        mv ~/.ssh/_config ~/.ssh/config

	fi;
else
    echo '!-- Disabling Reith Proxies --!'

    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset socks_proxy

    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset SOCKS_PROXY

    git config --global --unset http.proxy

    if [ -f ~/.ssh/config ]; then

        # prefix config file in SSH (So git/mercural are not going through reith)
    	mv ~/.ssh/config ~/.ssh/_config

    fi;
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
     CLICOLOR=1
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

# copy me ssh key
function copy-ssh-key() {
    cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"
}

# reset the sport sandbox
function restart_sport_sandbox {
    CURRENT_PATH=$(pwd)
    cd ~/Workspace/sport-sandbox;rake sandbox:rs;cd $CURRENT_PATH
}

# remove git tag
function remove_git_tag() {
    git tag -d "$1"
    git push origin :refs/tags/"$1"
}

# Generate release notes by diffing the commits between two tags
function git-release-notes() {
    git log $1...$2 --oneline | sed -e 's/^/\* /' | tail -n +2 | pbcopy;
}

# Give finder a bit of kick
function restart_finder() {
    killall Finder
}

# Lets see them hidden files
function show_hidden_files() {
    defaults write com.apple.finder AppleShowAllFiles TRUE
    restart_finder
}

# I dont want to see them hidden files
function hide_hidden_files() {
    defaults write com.apple.finder AppleShowAllFiles FALSE
    restart_finder
}

# Auto completion
autoload -U compinit
compinit -C

# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

plugins=(git wd)

source $ZSH/oh-my-zsh.sh

set completion-ignore-case on

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

fpath+=("/usr/local/share/zsh/site-functions")

autoload -U promptinit && promptinit

PURE_PROMPT_SYMBOL="$"

prompt pure
