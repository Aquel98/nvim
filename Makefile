INSTALL_DIR := $(HOME)/.local/bin
LSP_DATA_DIR := $(HOME)/.local/share/nvim-lsp
FORMATTER_DATA_DIR := $(HOME)/.local/share/nvim-formatter
PROGRAM_DATA_DIR := $(HOME)/.local/share/nvim-program

help:
	@echo "Available targets:"
	@echo "  make check     - Check if package managers are installed"
	@echo "  make install   - Install all LSPs and other programs"
	@echo ""
	@echo "LSPs:"
	@echo "  - lua-ls"
	@echo "  - clangd"
	@echo "  - ruff"
	@echo "  - basedpyright"
	@echo "  - typos-lsp"

check:
	@echo "Checking package managers..."
	@command -v pipx >/dev/null 2>&1 || (echo "❌ pipx not found" && exit 1)
# @command -v npm >/dev/null 2>&1 || (echo "❌ npm not found" && exit 1)
	@command -v cargo >/dev/null 2>&1 || (echo "❌ cargo not found" && exit 1)
	@command -v wget >/dev/null 2>&1 || (echo "❌ wget not found" && exit 1)
	@command -v unzip >/dev/null 2>&1 || (echo "❌ unzip not found" && exit 1)
	@echo "✓ All package managers found"

install: check install-lua-ls install-clangd install-ruff install-basedpyright install-typos-lsp install-ast-grep install-fzf install-rg
	@echo "✓ All LSPs installed."

install-lua-ls: 
	@echo "Installing lua-language-server..."
	@mkdir -p $(LSP_DATA_DIR)/lua-ls
	@cd $(LSP_DATA_DIR)/lua-ls && \
		wget -q --show-progress https://github.com/LuaLS/lua-language-server/releases/download/3.19.1/lua-language-server-3.19.1-linux-x64.tar.gz -O lua-ls.tar.gz && \
		tar -xzf lua-ls.tar.gz && \
		rm lua-ls.tar.gz
	@mkdir -p $(INSTALL_DIR)
	@ln -sf $(LSP_DATA_DIR)/lua-ls/bin/lua-language-server $(INSTALL_DIR)/lua-language-server
	@chmod +x $(INSTALL_DIR)/lua-language-server
	@echo "✓ lua-language-server installed."

install-clangd:
	@echo "Installing clangd..."
	@mkdir -p $(LSP_DATA_DIR)/clangd
	@cd $(LSP_DATA_DIR)/clangd && \
		wget -q --show-progress https://github.com/clangd/clangd/releases/download/23.1.0/clangd-linux-23.1.0.zip -O clangd.zip && \
		unzip clangd.zip && \
		rm clangd.zip
	@mkdir -p $(INSTALL_DIR)
	@ln -sf $(LSP_DATA_DIR)/clangd/clangd_*/bin/clangd $(INSTALL_DIR)/clangd
	@echo "✓ clangd installed."


install-ruff:
	@echo "Installing ruff..."
	@mkdir -p $(FORMATTER_DATA_DIR)/ruff
	@cd $(FORMATTER_DATA_DIR)/ruff && \
		wget -q --show-progress https://releases.astral.sh/github/ruff/releases/download/0.16.10/ruff-x86_64-unknown-linux-gnu.tar.gz -O ruff.tar.gz && \
		tar -xzf ruff.tar.gz && \
		rm ruff.tar.gz
	@mkdir -p $(INSTALL_DIR)
	@ln -sf $(FORMATTER_DATA_DIR)/ruff/ruff-x86_64-unknown-linux-gnu/ruff $(INSTALL_DIR)/ruff
	@echo "✓ ruff installed."

install-basedpyright:
	@echo "Installing basedpyright..."
	@uv tool install basedpyright
	@echo "✓ basedpyright installed."


install-typos-lsp:
	@echo "Installing typos-lsp..."
	@mkdir -p $(LSP_DATA_DIR)/typos-lsp
	@cd $(LSP_DATA_DIR)/typos-lsp && \
		wget -q --show-progress https://github.com/tekumara/typos-lsp/releases/download/v0.1.56/typos-lsp-v0.1.56-x86_64-unknown-linux-gnu.tar.gz -O typos-lsp.tar.gz && \
		tar -xzf typos-lsp.tar.gz && \
		rm typos-lsp.tar.gz
	@mkdir -p $(INSTALL_DIR)
	@ln -sf $(LSP_DATA_DIR)/typos-lsp/typos-lsp $(INSTALL_DIR)/typos-lsp
	@echo "✓ typos-lsp installed."

install-fzf:
	@echo "Installing fzf..."
	@mkdir -p $(PROGRAM_DATA_DIR)/fzf
	@cd $(PROGRAM_DATA_DIR)/fzf && \
		wget -q --show-progress https://github.com/junegunn/fzf/releases/download/v0.74.4/fzf-0.74.4-linux_amd64.tar.gz -O fzf.tar.gz && \
		tar -xzf fzf.tar.gz && \
		rm fzf.tar.gz
	@mkdir -p $(INSTALL_DIR)
	@ln -sf $(PROGRAM_DATA_DIR)/fzf/fzf $(INSTALL_DIR)/fzf
	@echo "✓ fzf installed."

install-rg:
	@echo "Installing rg..."
	@cargo install ripgrep
	@echo "✓ rg installed."

install-ast-grep:
	@echo "Installing ast-grep"
	@npm install -g @ast-grep/cli
	@echo "✓ ast-grep installed."



