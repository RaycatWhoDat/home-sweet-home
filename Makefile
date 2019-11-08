.PHONY: windows macos linux tangle

ESSENTIALS = coreutils moreutils git zsh screen byobu nvm python3 luajit luarocks emacs
PHASE_1 = lua fasd vim jq miller curl entr gcc gnutls gource ispell ncurses ripgrep sbcl gpatch opam
PHASE_2 = comby

all: tangle

windows:
	@echo "No suitable build process."

linux:
	@echo "No suitable build process."

macos:
	@echo "Building up a MacOS foundation..."

	@/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	@echo "Installing essentials..."
	-@brew install $(ESSENTIALS)

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
