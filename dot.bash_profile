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
# Git
PATH=/usr/local/Cellar/git/1.7.3.1/bin:$PATH
# MySQL
PATH=/usr/local/mysql/bin:$PATH
# Rhodes
PATH=$PATH:/usr/local/android-sdk-mac_86/platform-tools:/usr/local/android-sdk-mac_86/tools

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
alias mysqlstop="launchctl unload -w ~/Library/LaunchAgents/com.mysql.mysqld.plist"
alias mysqlstart="launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist" # same as: $ mysqld_safe
alias mysqldaemon="/usr/local/Cellar/mysql/5.1.47/share/mysql/mysql.server" # ex: $ mysqldaemon start/stop
alias apache="sudo apachectl" # ex: $ apache start/stop

## PATHS
alias sites="cd ~/Sites/"
alias home="cd ~/"
alias tmdir="cd /Applications/TextMate.app/Contents/SharedSupport/Bundles/"
alias tmhomedir="cd ~/Library/Application\ Support/TextMate/Bundles/"
alias startupdir="cd /Library/StartupItems/"

## GIT
alias gco="git checkout"
alias gci="git commit -m"
alias gst="git status"
alias gdiffg="git diff $1 $2 | mate"
alias gba="git branch -a"
alias gbag="git branch -a | grep"
alias gh="git push; git status"
alias gl="git pull; git status"
alias glog="git log"
alias glogo="git log --pretty=oneline"
alias glogg="git log --graph"
alias gitclean='git remote prune origin && git remote update; git status'
alias gitk='gitk --all &'

## FILES
alias bp="mate ~/.bash_profile"
alias rbp="source ~/.bash_profile"
alias sshconf="cat ~/.ssh/config"

## OS
alias ls='ls -Gph'
alias ll='ls -Gplh'
alias la='ls -Gplah'
alias df='df -h'
alias du='du -h'
alias ag='alias | grep' 
alias cat='cat -n'
alias psg='ps -ef | grep'
alias hosts='cat /etc/hosts'
alias ..="\cd .. ; ls"
alias cd..="\cd .. ; ls"
alias treesize="sudo du -sm * | sort -rn"

## RUBYGEMS
alias glg="gem list | grep"  

## RAILS                 
alias c="script/console --debugger"
alias s="script/server --debugger"


##########################
# FUNCTIONS
##########################
_rmate() {
  mate $(ls -1 | egrep -v "(log|git|public_stub|tmp|doc/|coverage)" | egrep -v .DS_Store)
}

# create_branch <new_branch_name> <origin_to_new_branch>
function create_branch() { 
    [ -z "$1" ] && return
    [ -z "$2" ] && return # melhorar isso. Importante checar se tem o $2, pq se nao, isso se torna um 'delete branch'
    git push origin $2:refs/heads/$1
    git checkout --track -b $1 origin/$1 # chamar o checkout
}

# destroy_branch <branch_name_to_delete>
function destroy_branch() {
    [ -z "$1" ] && return
    git checkout release_01
    git branch -d $1
    git push origin :refs/heads/$1
}

# checkout_branch <branch_name>
function checkout_remote_branch() {
  [ -z "$1" ] && return
  git checkout --track -b $1 origin/$1
}


##########################
# LOADING SCRIPTS
##########################

# GIT COMPLETION
if [ -f ~/.git-completion.sh ]; then
  source ~/.git-completion.sh
fi

# RAKE COMPLETION
if [ -f ~/bin/rake_completion ]; then
  complete -C ~/bin/rake_completion -o default rake
fi

# BASH COMPLETION
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# RVM
if [ -s ~/.rvm/scripts/rvm ]; then 
  source ~/.rvm/scripts/rvm 
fi

# SPECIALIZED  PROFILE
if [ -f ~/.privaterc ]; then
  source ~/.privaterc
fi


##########################
# PROMPT
##########################
# Colors
# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37
PS1='\n[\u] ' # current user
PS1=$PS1'\[\033[1;33m\]\w\a\[\033[0m\]' # current path
PS1=$PS1'$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]") ' # git current branch
PS1=$PS1'\[\033[1;30m\][$(~/.rvm/bin/rvm-prompt v)$(rvm_gemset)]\033[0m\]' # rvm
PS1=$PS1'\n\$ ' # linebreak