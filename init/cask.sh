#!/bin/sh
IFS='
'

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers

formulae="
iterm2
appcleaner
docker
slack
the-unarchiver
visual-studio-code
vlc
zoom
miro
spotify
notion
rescuetime
rectangle
"

for f in $formulae; do
  brew cask install $f
done
