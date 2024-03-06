# ======== Variables ==========
VERSIONS_GO := 1.21.8
VERSIONS_PYTHON := 3
VERSIONS_DOTNET := 8.0

PATHS_GO = $$HOME/.local
PATHS_GOHOME = $$HOME/dev/go
PATHS_DOTNET = $$HOME/.local

# ======== Setup ==========

.PHONY: setup/wsl
setup/wsl: mkdirs sshgen/rsa sshgen/ed25519 install/basics install/fish install/docker install/python install/dotnet dotfiles/apply

.PHONY: setup/server
setup/server: mkdirs sshgen/ed25519 install/basics install/fish install/docker install/python dotfiles/apply

.PHONY: setup
setup: mkdirs sshgen/ed25519 install/basics install/fish install/docker install/python install/dotnet install/go install/vscode dotfiles/apply

# ======== Utility ==========

.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: mkdirs
mkdirs: mkdirs/dev

.PHONY: mkdirs/dev
mkdirs/dev:
	mkdir -p $$HOME/dev/proj $$HOME/dev/misc $$HOME/dev/builds $$HOME/dev/envs

# ======== Dotfiles ==========

.PHONY: dotfiles/apply
dotfiles/apply:
	stow -S dotfiles -d ./ -t $$HOME/

# ======== Dev tools ==========

.PHONY: install/basics
install/basics:
	sudo apt install -y make curl stow wget apt-transport-https gpg

.PHONY: install/docker
install/docker:
	sudo apt install -y docker.io docker-compose

.PHONY: install/fish
install/fish:
	sudo add-apt-repository ppa:fish-shell/release-3 -y
	sudo apt update
	sudo apt install -y fish

.PHONY: install/python
install/python:
	sudo apt install -y python${VERSIONS_PYTHON} python3-pip

.PHONY: install/dotnet
install/dotnet:
	curl -L -o /tmp/dotnet-install-make.sh https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh
	chmod u+x /tmp/dotnet-install-make.sh
	/tmp/dotnet-install-make.sh --channel ${VERSIONS_DOTNET} --install-dir ${PATHS_DOTNET}/dotnet --os linux

.PHONY: install/go
install/go:
	curl -L -o /tmp/go-install-make.tar.gz https://go.dev/dl/go${VERSIONS_GO}.linux-amd64.tar.gz
	rm -r ${PATHS_GO}/go ${PATHS_GOHOME}  
	mkdir -p ${PATHS_GO}
	tar -xvzf /tmp/go-install-make.tar.gz -C ${PATHS_GO}
	mkdir -p ${PATHS_GOHOME}/src ${PATHS_GOHOME}/bin

.PHONY: install/vscode
install/vscode:
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
	sudo apt update
	sudo apt install code

# ======== SSH Keygen ==========

.PHONY: sshgen/rsa
sshgen/rsa:
	ssh-keygen -t rsa -C "chris"

.PHONY: sshgen/ed25519
sshgen/ed25519:
	ssh-keygen -t ed25519 -C "chris"

.PHONY: sshgen
sshgen: sshgen/ed25519

