define VIMRC
" Include user's local vim config
if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
elseif filereadable(expand('~/vimfiles/vimrc'))
  source ~/vimfiles/vimrc
endif
endef

define GVIMRC
" Include user's local vim config
if filereadable(expand('~/.vim/gvimrc'))
  source ~/.vim/gvimrc
elseif filereadable(expand('~/vimfiles/gvimrc'))
  source ~/vimfiles/gvimrc
endif
endef

export VIMRC
export GVIMRC

BUNDLES = $(shell ls bundle)

all: clean install

bundle:
	sh bundle.sh

$(HOME)/.vimrc:
	echo "$$VIMRC" >> $@

$(HOME)/.gvimrc:
	echo "$$GVIMRC" >> $@

install: bundle vimrc gvimrc
	@echo "Installed and configured vimfiles, have fun."

clean:
	rm -rf bundle

update:
	for file in $(BUNDLES); do echo "--- $$file ---" && cd bundle/$$file && git pull && echo "" && cd ../.. ; done;

vimrc: $(HOME)/.vimrc
gvimrc: $(HOME)/.gvimrc

.PHONY: install vimrc gvimrc clean
