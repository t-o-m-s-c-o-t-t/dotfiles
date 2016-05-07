sudo apt-get install \
	terminator \
	vim \
	git \
	curl \
	zsh \
	redshift \
	ranger \
	rxvt-unicode \
	i3-wm \
	i3blocks \
	i3status \
	i3 \
	feh \
	rofi

# FONTS
cd ~/Downloads && \
git clone https://github.com/powerline/fonts.git && \
cd fonts && \
./install.sh

sudo fc-cache -f -v

# VIM THEMES
mkdir -p ~/.vim/colors && \
cd ~/.vim/colors && \
wget https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

# ZSH
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
