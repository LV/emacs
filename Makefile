SHELL=/bin/bash

CURRENT_DIR := $(CURDIR)

CLEAN_ITEMS = $(shell find $(CURRENT_DIR) -mindepth 1 ! -path '$(CURRENT_DIR)/.git*' ! -name '.gitignore' ! -name 'init.el' ! -name 'config.org' ! -name 'README.org' ! -name 'Makefile' ! -name 'LICENSE' ! -name  '.')

.PHONY: clean
clean:
	rm -rf $(CLEAN_ITEMS)
