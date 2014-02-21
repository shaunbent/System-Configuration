# System Configuration 

I’ve been using multiple machines to develop on for a number of years and now that I’ve started using the CLI more frequently thanks to [@mintuz](https://github.com/mintuz) and [@iceicetimmy](https://github.com/iceicetimmy) I need a way of keeping my development environments consistent across machines.

The repo contains my personal system configuration. I personally have these files stored on my Google Drive with Symlinks to link everything together.

## Ruby Config

Ruby can be a massive knob to setup but these few commands ease the pain a little.

Running the following command in your terminal will stop Gem install from downloading the documentation. This should massively shave down the install time as we don't want that crap.

`echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc`

## Terminal Theme

I like to use the [Solarized[(http://ethanschoonover.com/solarized) theme for my Terminal with [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html) as my font of choice at 15pt.

**Credits:** my basic configuration is based on the setups of [Mark McDonnell](https://github.com/Integralist/Fresh-Install) and [Andrew Burgess](https://github.com/andrew8088/dotfiles)
