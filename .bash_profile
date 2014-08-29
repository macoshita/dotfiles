export PS1="\u \w\$ "

export GOPATH=$HOME/.go

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOPATH/bin

alias rm="rmtrash"
alias rmdir="rmdirtrash"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
