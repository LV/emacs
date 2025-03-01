SHELL=/bin/bash

.PHONY: clean
clean:
	rm -rf auto-save-list/ custom.el eln-cache/ elpa/ elpaca/ eshell/ forge-database.sqlite org-roam.db transient/
