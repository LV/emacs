SHELL=/bin/bash

CURRENT_DIR := $(CURDIR)

CLEAN_ITEMS = $(shell find $(CURRENT_DIR) -mindepth 1 ! -path '$(CURRENT_DIR)/.git*' ! -path '$(CURRENT_DIR)/src*' ! -path '$(CURRENT_DIR)/snippets*' ! -name '.gitignore' ! -name 'early-init.el' ! -name 'init.el' ! -name 'preload.el' ! -name 'README.org' ! -name 'Makefile' ! -name 'LICENSE' ! -name  '.')

.PHONY: clean
clean:
	rm -rf $(CLEAN_ITEMS)
