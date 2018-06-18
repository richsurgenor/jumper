# System init by Rich

vimpath=`which vim`
if [ ! -v $vimpath ]; then # If actually has Vim..
    if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    else
        echo "Skipping Vundle..."
    fi

    vim -S .install_vundle
fi

tmuxpath=`which tmux`
if [ ! -v $tmuxpath ]; then #If actually have Tmux..
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

mv ~/.vimrc ~/.vimrc.old
mv ~/.tmux.conf ~/.tmux.conf.old
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf
