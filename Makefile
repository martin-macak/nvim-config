install:
	@pip install -U pynvim
	@pip install 'python-lsp-server[all]' pylsp-mypy pyls-isort
	@npm install -g vim-language-server
	@pip install jedi jedi-language-server
	@gem install solargraph


.PHONY: install
