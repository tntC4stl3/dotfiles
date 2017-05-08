#!/bin/zsh

# First, make sure all the softwares have been installed
#   * zsh
#   * tmux
#   * vim
#   * git


HOME=${HOME}
PWD=`pwd`
OH_MY_ZSH=${HOME}"/.on-my-zsh"
VUNDLE=${HOME}"/.vim/bundle/Vundle.vim"


# Pre check
check_software_exist(){
    softwares=("zsh" "tmux" "vim" "git")
    for sw in "${softwares[@]}"
    do
        type ${sw} > /dev/null 2>&1 ||
            { echo >&2 "ERROR: **${sw}** is not installed!"; exit 1; }
    done
}

create_symlinks(){
    dotfiles=(".zshrc" ".tmux.conf" ".vimrc" ".gitconfig")
    for dotfile in "${dotfiles[@]}"
    do
        ln -sf ${PWD}/${dotfile} ${HOME}/${dotfile}
        echo "Create symlink ${HOME}/${dotfile}"
    done
}

install_oh_my_zsh(){
    if [ -d "${OH_MY_ZSH}" ]; then
        cd "${OH_MY_ZSH}"
        echo "Change directory to `pwd`"
        echo "${OH_MY_ZSH} exists. Git pull to update..."
        git pull
        cd - > /dev/null 2>&1
        echo "Change directory back to `pwd`"
    else
        echo "${OH_MY_ZSH} not exists. Install..."
        git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
    fi
}

install_vundle(){
    if [ -d "${VUNDLE}" ]; then
        cd "${VUNDLE}"
        echo "Change directory to `pwd`"
        echo "${VUNDLE} exists. Git pull to update..."
        git pull
        cd - > /dev/null 2>&1
        echo "Change directory back to `pwd`"
    else
        echo "${VUNDLE} not exist. Git clone to create one..."
        git clone https://github.com/VundleVim/Vundle.vim.git ${VUNDLE}
        vim +PluginInstall +qall
    fi
}

main(){
    check_software_exist
    install_oh_my_zsh
    create_symlinks
	install_vundle
}

main

echo '[SETUP OK]'
