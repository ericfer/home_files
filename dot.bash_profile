##########################
# SOURCES
##########################
source ~/webco/dot.webcorc
source ~/personal/dot.personalrc


##########################
# CONTANTS
##########################
# Initial Path
PATH=$HOME:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
# MYSQL
PATH=$PATH:/Applications/MAMP/Library/bin
# MacPorts
PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Personal
PATH=$PATH:~/bin:~/webco


##########################
# EXPORT
##########################
export HISTCONTROL=erasedups
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"


##########################
# ALIAS
##########################

## TOOLS
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias gvim="mvim"
alias rmate="_rmate"
alias tm="rmate"

## PATHS
alias sites="cd ~/Sites/"
alias home="cd ~/"
alias rubydir="cd /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8"
alias gemdir="cd /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/user-gems/1.8/gems/"
alias hometmdir="cd ~/Library/Application\ Support/TextMate/Bundles/"
alias tmdir="cd /Applications/TextMate.app/Contents/SharedSupport/Bundles/"

## GIT
alias gco="git checkout"
alias gci="git commit -m"
alias ga="git add"
alias gst="git status"
alias gdiffg="git diff $1 $2 | mate"
alias gba="git branch -a"
alias gh="git push; git status"
alias gl="git pull; git status"
alias glog="git log"
alias glogo="git log --pretty=oneline"
alias glogg="git log --graph"
alias gpp="git pull; git push; git status"
alias gsu="git submodule update; git status"
alias gitclean='git remote prune origin && git remote update; git status'
alias gitk='gitk --all &'

## FILES
alias bp="mate ~/.bash_profile"

## OS
alias ls='ls -Gp'
alias ll='ls -Gpl'
alias la='ls -Gpla'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# dir/files
alias ..="\cd .. ; ls"
alias cd..="\cd .. ; ls"


## RAILS                 
alias c="script/console"
alias s="script/server"


##########################
# FUNCTIONS
##########################
_rmate() {
  mate $(ls -1 | egrep -v "(log|git|public_stub|tmp|doc)" | egrep -v .DS_Store)
}


##########################
# GIT
##########################
source ~/.git-completion.sh
PS1='\n[\u] \[\033[1;33m\]\w\a\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")\n\$ '


##########################
# RAKE COMPLETION
##########################
complete -C ~/bin/rake_completion -o default rake

