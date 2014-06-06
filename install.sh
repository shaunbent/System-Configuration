function install_xcode() {
    xcode-select --install
}

function install_homebrew() {
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
}

function install_brews() {
    brew tap caskroom/homebrew-cask

    brews=( git node chruby ruby-install phantomjs wget \
            cmake terminal-notifier brew-cask siege )

    for item in "${brews[@]}"
        do
            brew install $item
    done
}

function install_software() {
    casks=( atom adobe-creative-cloud box-sync alfred appcleaner rightzoom cloudapp vlc \
          xscope cleanmymac google-chrome firefox qlstephen qlmarkdown quicklook-json \
          quicklook-csv betterzipql suspicious-package evernote filezilla google-drive \
          imageoptim opera paparazzi remote-desktop-connection sequel-pro skype sourcetree \
          vagrant virtualbox )

    for item in "${casks[@]}"
        do
            brew cask install $item
    done
}

function install_oh_my_zsh() {
    wget --no-check-certificate http://install.ohmyz.sh -O - | sh
}

install_xcode && \
install_homebrew && \
install_brews && \
install_software && \
install_oh_my_zsh && \

echo "Bitch, I've installed all the software we can.
Check the README to see if there is anything else.
Don't forget to start Google Drive and login so it starts sync'ing files.
Then execute install-complete.sh after Dropbox has finished sync'ing (see README for instructions)"
