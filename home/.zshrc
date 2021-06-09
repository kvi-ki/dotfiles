source ~/.zsh/prompt.zsh
source ~/.zsh/antigen.zsh
source ~/.zsh/rbenv.zsh
#source ~/.zsh/nvm.zsh

#[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

#eksctl completion
fpath=($fpath ~/.zsh/completion)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
