# Exports
#########

# Set desired java version
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Set locale properly
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export KAFKA_HOME=/usr/local/lib/kafka

export PATH=/usr/local/opt/gettext/bin:$PATH:$KAFKA_HOME/bin

# Aliases
#########
alias homecnf="cd ~/.homesick/repos/dotfiles"
alias cnf="vim ~/.homesick/repos/dotfiles/plugins/me/me.plugin.zsh"
alias zcnf="vim ~/.zshrc"
alias acnf="vim ~/.zsh/antigenrc.zsh"
alias reload="source ~/.zshrc"
alias redis-start="cd ~/.redis && redis-server ~/.redis/redis.conf"
alias ge="gradle"
alias fucking="sudo"
alias s="ssh"
alias dc="docker-compose"
alias d="docker"
alias hs="homesick"
alias d-stop-all='docker stop $(docker ps -a -q)'
alias d-kill-all='docker kill $(docker ps -a -q)'

# Git
#####
alias gf="git fetch"
alias gpf="gp --force-with-lease"
alias gpub='gp -u origin `g rev-parse --abbrev-ref HEAD`'

function gl {
  local old_rev="$(git rev-parse HEAD)"
  git pull
  local new_rev="$(git rev-parse HEAD)"
  if [[ -n $old_rev && $old_rev != $new_rev ]]; then
    echo Updated from ${old_rev:0:7} to ${new_rev:0:7}.
    git --no-pager log --oneline --reverse --no-merges --stat '@{1}..'
  fi
}
alias gl=gl

# https://ben.lobaugh.net/blog/201616/cleanup-and-remove-all-merged-local-and-remote-git-branches
alias g-delete-merged-branches="gb --merged | grep -v '\*' | grep -v master | xargs -n 1 git branch -d"


# Mac
#####

# Reload Dock
alias reload-dock="killall Dock"

# Add a spacer to the left side of the Dock (where the applications are)
alias add-dock-spacer="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}' && reload-dock"

# Do not disturb, stop bouncing
alias do-not-disturb="defaults write com.apple.dock no-bouncing -bool TRUE && reload-dock"
alias disturb="defaults write com.apple.dock no-bouncing -bool FALSE && reload-dock"


function cask-install {
  COMMAND=(brew cask install $1)
  if $COMMAND; then
    print $COMMAND >> ~/.homesick/repos/dotfiles/Caskfile
    print "👌 Saved in Caskfile"
  fi
}

# Linux
#######

alias x='xclip -selection clipboard'

# Misc
######

alias copy-mysql-driver="cp ~/.m2/repository/mysql/mysql-connector-java/5.1.26/mysql-connector-java-5.1.26.jar ."
alias xmas='curl climagic.org/txt/jb.txt | while read -r c n l;do printf "\e[1;${c}m%${COLUMNS}s\e[0m\n" " ";play -q -n synth pl $n trim 0 $l;done'

alias fix-htop-permissions="sudo chown root:wheel /usr/local/bin/htop && sudo chmod u+s /usr/local/bin/htop"

# Audophile
###########

function transcode {
  echo 'Transcoding FLAC files to 16-bit'
  mkdir resampled # make a subdirectory to put our files in

  for file in *.flac
    do
      newfile=`echo "$file" | sed "s/ /_/g"`
      mv "$file" "$newfile" # get rid of filename spaces to avoid errors
      sox -S $newfile -b 16 -r 44100 "resampled/$newfile" # resample
      mv "$newfile" "$file" # put stuff back the way we found it
    done
}
