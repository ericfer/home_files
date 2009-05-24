#!/bin/bash 
 
#
# git clone git://github.com/ericfer/home_files.git ~/Sites/my/home_files
#

### FUNCTIONS #####################
lnfile() {
    [ -f $2 ] && /bin/rm $2
    ln -s $1 $2
}
 
lndir() {
    [ -e $2 ] && /bin/rm -r $2
    ln -s $1 $2
}
 

### CONSTANTS #####################
DIR=~/Sites/my/home_files
 

### PROCESS #####################
echo "Linking home files..."
lnfile ${DIR}/dot.bash_profile ~/.bash_profile
lnfile ${DIR}/dot.autotest ~/.autotest
lnfile ${DIR}/dot.gemrc ~/.gemrc
lnfile ${DIR}/dot.git-completion.sh ~/.git-completion.sh
lnfile ${DIR}/dot.gitconfig ~/.gitconfig
lnfile ${DIR}/dot.gitignore ~/.gitignore
lnfile ${DIR}/dot.gitk ~/.gitk
lnfile ${DIR}/dot.irbrc ~/.irbrc

echo "Linking home dirs..."
lndir ${DIR}/webco ~/webco
lndir ${DIR}/personal ~/personal
lndir ${DIR}/bin ~/bin

echo "All done!"