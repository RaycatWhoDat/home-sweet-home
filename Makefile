.PHONY: windows linux-ubuntu linux-other macos tangle nvm

EMACS = emacs
ESSENTIALS = coreutils moreutils git zsh python3 luajit luarocks
PHASE_1 = lua5.3 vim jq miller curl entr gcc ispell
PHASE_2 = gnutls ncurses ripgrep gpatch

all: tangle

windows:
	@echo "No suitable build process."

linux-ubuntu:
	@echo "Building up an Ubuntu foundation..."

	-@sudo snap install emacs

	@echo "Installing essentials..."
	-@sudo apt install $(ESSENTIALS)

	@echo "Installing Phase 1..."
	-@sudo apt install $(PHASE_1)

	@echo "Installing Phase 2..."
	-@sudo apt install $(PHASE_2)

	@echo "Done installing packages."

linux-other:
	@echo "No suitable build process."

macos:
	@echo "Building up a MacOS foundation..."

	@echo "Installing essentials..."
	-@brew install $(ESSENTIALS)
	-@brew install $(EMACS)

	@echo "Installing Phase 1..."
	-@brew install $(PHASE_1)

	@echo "Installing Phase 2..."
	-@brew install $(PHASE_2)

	@echo "Done installing packages."

tangle:
	@echo "Rolling out the red carpet..."
	@emacs -Q --batch --eval '(require (quote org))' --eval '(org-babel-tangle-file "home-sweet-home.org")'
	@clear
	@echo "Welcome home."

nvm:
	@echo "Installing nvm..."
	@curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
