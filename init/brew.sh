#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install git
brew install git-recent

brew install htop
brew install wget
brew install pv
brew install tree
brew install mysql
brew install redis
brew install ack
brew install autojump
brew install watch
brew install gettext

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# JDK --> sdkman
#brew install maven
#brew install gradle
#brew install thrift
#brew install protobuf
#brew install liquibase
#brew install grails --> sdkman

# Audiophile
brew install sox --with-flac

# Nerdy 
# Advent calendar http://www.qemu-advent-calendar.org/
#brew install qemu
