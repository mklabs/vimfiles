install:
	mkdir -p ~/.config/nvim/site/pack
	test -e ~/.config/nvim/site/pack/vim-dispatch || git clone git://github.com/tpope/vim-dispatch.git ~/.config/nvim/site/pack/vim-dispatch


all: install

