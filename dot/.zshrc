# Import ZSH
export ZSH=$HOME/.oh-my-zsh

# Set theme
ZSH_THEME="cobalt2"

# Environment Variables
export GITHUB_USER='shaunbent'

# Sync location
syncfolder="$HOME/Google Drive/System Configuration" # sourcing a file breaks with backslashes
syncfolderalias="$HOME/Google\ Drive/System\ Configuration" # aliasing needs backslashes as it's an actual command
workspace="$HOME/Workspace"

# Export the path so it can be used elsewhere (such as in our .vimrc file)
export SYNCFOLDER=$syncfolder
export SYNCFOLDERALIAS=$syncfolderalias
export WORKSPACE=$workspace

# Vagrant fixes issue with Chef not completing
if `tty -s`; then
   mesg n
fi

# reorder PATH so local bin is first
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.composer/vendor/bin

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
alias ws="cd ~/Dev/"
alias zsh="code ~/Google\ Drive/System\ Configuration"
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias vtop="vtop --theme wizard"
alias get-some='yarn && yarn start'

# git alias
alias grt="remove_git_tag"

# spotify
alias spm='npm --registry https://artifactory.spotify.net/artifactory/api/npm/virtual-npm --userconfig ~/.spmrc --always-auth=true'
alias spotifier="/Applications/Spotify.app/Contents/MacOS/Spotify --app-directory=/Users/shaunbent/Dev/desktop/client-desktop/ui/apps -mu=development --ignore-certificate-errors --enable-developer-mode=true --app-icon-overlay=#ad2f94^👨‍🎤^#f9e445"

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

# NVM stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Auto completion
autoload -U compinit
compinit -C

# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

plugins=(git wd zsh-completions zsh-autosuggestions)

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shaunbent/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shaunbent/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shaunbent/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shaunbent/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
