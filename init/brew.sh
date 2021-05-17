#!/bin/sh
IFS='
'
# Make sure we’re using the latest Homebrew
brew update

brew tap heroku/brew
brew tap snyk/tap
brew tap weaveworks/tap

formulae="
autojump
git
grep
heroku
htop
rbenv
ruby-build
tree
vim
wget
jq
gh
"

for f in $formulae; do
  echo ">> $f"
  brew install $f
done

# Audiophile
#brew install sox --with-flac

