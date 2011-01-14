install: install-vim install-bash install-virtualenvwrapper \
         install-terminal-settings install-tmux install-git

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-bash:
	rm -f ~/.bashrc ~/.bashrc.d
	ln -sn `pwd`/bash/bashrc ~/.bashrc
	ln -sn `pwd`/bash ~/.bashrc.d
	
install-virtualenvwrapper:
	mkdir -p ~/.virtualenvs
	ln -sf `pwd`/virtualenvwrapper/* ~/.virtualenvs

dump-terminal-settings:
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal
	plutil -convert xml1 terminal/com.apple.Terminal.plist

install-terminal-settings:
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal/old-settings.bak
	cp terminal/com.apple.Terminal.plist ~/Library/Preferences
	@echo "Old terminal settings were saved in terminal folder"

install-git:
	rm -f ~/.gitconfig ~/.gitignore
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	ls -s `pwd`/git/gitignore ~/.gitignore

install-tmux:
	rm -f ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf
