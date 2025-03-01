SHELL=/bin/bash

.PHONY: clean_els
clean_els:
	find src/ -type f -name "*.el" -delete
	rm -f custom.el

.PHONY: clean_dbs
clean_dbs:
	rm -f forge-database.sqlite org-roam.db

.PHONY: clean_dirs
clean_dirs:
	rm -rf auto-save-list/ eln-cache/ elpa/ elpaca/ eshell/ transient/

.PHONY: clean
clean: clean_dbs clean_dirs clean_els
