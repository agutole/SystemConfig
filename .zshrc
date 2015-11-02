export TERM="xterm-256color"
POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
POWERLINE_RIGHT_B="none"
POWERLINE_NO_BLANK_LINE="true"
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerline"
plugins=(git zsh-syntax-highlighting autojump)

source ~/.oh-my-zsh/custom/plugins/k/k.sh
source $ZSH/oh-my-zsh.sh

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/media/Archivos/Development
source /usr/local/bin/virtualenvwrapper.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH
case $- in *i*)
    [ -z "$TMUX" ] && exec tmux
esac

alias facu="cd /media/Archivos/Facultad/"
alias ars="cd /media/Archivos/"
alias dev="cd /media/Archivos/Development/"
alias cfg="cd /media/Archivos/Config"
alias py="ipython"
alias v="vim"
alias musica="ncmpcpp"

yt-add()
{
    mpc add $(youtube-dl --prefer-insecure -g -f140 $1)
}
yt-mp3()
{
    youtube-dl -x --audio-format mp3 $1
}


add_pack() 
{
    echo "	$1\\" >> $cfg_dir"pack_installs"
    echo "Package: '$1' saved"
}
add_pip()
{
    echo "	$1\\" >> $cfg_dir"pip_installs"
    echo "PIP Package: '$1' saved"
}
gn_update()
{
    echo -n -e "#!/bin/bash\n\ngsettings set org.gnome.shell enabled-extensions \"" > $cfg_dir"gnome_ext_installs"
    gsettings get org.gnome.shell enabled-extensions >> $cfg_dir"gnome_ext_installs"
    echo -n "\"" >> $cfg_dir"gnome_ext_installs"
    echo "Gnome-shell -> Extensions saved"
}
cp_cfg_files()
{
    cp -u ~/.vimrc $cfg_dir"cfg_files/_.vimrc"
    cp -u ~/.zshrc $cfg_dir"cfg_files/_.zshrc"
    cp -u -R ~/.oh-my-zsh $cfg_dir"cfg_files/_.oh-my-zsh"
    cp -u -R ~/powerline-shell $cfg_dir"cfg_files/_powerline-shell"
    cp -u ~/powerline.zsh-theme $cfg_dir"cfg_files/_powerline.zsh-theme"
    echo "CFG Files saved"
}
cfg-update()
{
	gn_update
	cp_cfg_files
}
