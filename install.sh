function install_xcode() {
    xcode-select --install
}

function install_homebrew() {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"§
}

function install_brews() {
    brew tap caskroom/homebrew-cask

    brews=( git node chruby ruby-install phantomjs wget \
            cmake brew-cask )

    for item in "${brews[@]}"
        do
            brew install $item
    done
}

function install_node_packages() {
    npm install -g bower grunt-cli jshint pure-prompt
}

function install_software() {
    casks=( atom box-sync vlc google-chrome firefox evernote filezilla google-drive \
          imageoptim opera remote-desktop-connection sequel-pro skype sourcetree \
          vagrant virtualbox slack iterm2 handbrake )

    for item in "${casks[@]}"
        do
            brew cask install $item
    done
}

function install_oh_my_zsh() {
    wget --no-check-certificate http://install.ohmyz.sh -O - | sh
}

function misc_osx_stuff() {
    # Show status bar in Finder by default
    defaults write com.apple.finder ShowStatusBar -bool true

    # Use column view in all Finder windows by default
    defaults write com.apple.finder FXPreferredViewStyle Clmv

    # Avoid creation of .DS_Store files on network volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    # Allow text selection in Preview/Quick Look
    defaults write com.apple.finder QLEnableTextSelection -bool true

    # Enable AirDrop over Ethernet and on unsupported Macs running Lion
    defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

    # Expand the following File Info panes:
    # “General”, “Open with”, and “Sharing & Permissions”
    defaults write com.apple.finder FXInfoPanesExpanded -dict \
    	General -bool true \
    	OpenWith -bool true \
    	Privileges -bool true

    # Show icons for hard drives, servers, and removable media on the desktop
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

    # Use the system native print preview dialog in Chrome
    defaults write com.google.Chrome DisablePrintPreview -bool true
    defaults write com.google.Chrome.canary DisablePrintPreview -bool true

    # Expand save panel by default
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

    # Expand print panel by default
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

    # Save to disk (not to iCloud) by default
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

    # Automatically quit printer app once the print jobs complete
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

    # Setup the bottom left hotcorner to sleep the display
    defaults write com.apple.dock wvous-bl-corner -int 10
    defaults write com.apple.dock wvous-bl-modifier -int 0
}

install_xcode && \
install_homebrew && \
install_brews && \
install_node_packages && \
install_software && \
install_oh_my_zsh && \
misc_osx_stuff && \

echo "Bitch, I've installed all the software we can.
Check the README to see if there is anything else.
Don't forget to start Google Drive and login so it starts sync'ing files.
Then execute install-complete.sh after Google Drive has finished sync'ing (see README for instructions)"
