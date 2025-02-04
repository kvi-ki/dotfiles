#!/bin/sh
IFS='
'

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers

formulae="
slack
iterm2
appcleaner
google-chrome
docker
slack
the-unarchiver
visual-studio-code
vlc
zoom
miro
spotify
notion
rectangle
"

for f in $formulae; do
  brew install --cask $f
done
