##########################
# PATH
##########################
# Custom compilations
PATH=/usr/local/bin:/usr/local/sbin:$PATH
# Default path
PATH=$PATH:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin
# MacPorts
PATH=$PATH:/opt/local/bin:/opt/local/sbin
MANPATH=/opt/local/share/man:$MANPATH
# MySQL
PATH=/usr/local/mysql/bin:$PATH
# MYSQL MAMP
# PATH=$PATH:/Applications/MAMP/Library/bin
PATH=$PATH:/usr/local/mongodb/bin


##########################
# ENV SETTINGS
##########################
export HISTCONTROL=erasedups
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
export EDITOR="mate"

##########################
# ALIAS
##########################
## TOOLS
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias gvim="mvim"
alias tm="_rmate"
alias mysqlstart="sudo /usr/local/mysql/bin/mysqld_safe"

## PATHS
alias sites="cd ~/Sites/"
alias home="cd ~/"
alias rubydir="cd /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8"
alias tmdir="cd /Applications/TextMate.app/Contents/SharedSupport/Bundles/"
alias tmhomedir="cd ~/Library/Application\ Support/TextMate/Bundles/"
alias startupdir="cd /Library/StartupItems/"

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
alias gc=gitclean
alias gitk='gitk --all &'

## FILES
alias bp="mate ~/.bash_profile"
alias rbp="source ~/.bash_profile"

## OS
alias ls='ls -Gph'
alias ll='ls -Gplh'
alias la='ls -Gplah'
alias df='df -h'
alias du='du -h'
alias ag='alias | grep' 
alias pg='ps -ef | grep'
alias hosts='cat /etc/hosts'
alias cat='cat -n'

# NAVIGATION
alias ..="\cd .. ; ls"
alias cd..="\cd .. ; ls"

## RUBYGEMS
alias glg="sudo gem list | grep"  

## RAILS                 
alias c="script/console"
alias s="script/server --debugger"


##########################
# FUNCTIONS
##########################
_rmate() {
  mate $(ls -1 | egrep -v "(log|git|public_stub|tmp|doc)" | egrep -v .DS_Store)
}


##########################
# GIT COMPLETION AND PROMPT
##########################
source ~/.git-completion.sh
PS1='\n[\u] \[\033[1;33m\]\w\a\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")\n\$ '


##########################
# RAKE COMPLETION
##########################
complete -C ~/bin/rake_completion -o default rake


##########################
# BASH COMPLETION
##########################
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

##########################
# SPECIALIZED  PROFILES
##########################
source ~/.webcorc
source ~/.abrilrc
source ~/.personalrc


# teste para passenger
APXS2=/Applications/MAMP/Library/bin/apxs