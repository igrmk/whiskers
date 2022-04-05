NAME = whiskers
SIZE_LIST = 32 64 128 256 512 1024
BASE_SIZES = $(join $(SIZE_LIST),$(addprefix x,$(SIZE_LIST)))
BOOKENDS = $(firstword $(SIZE_LIST)) $(lastword $(SIZE_LIST))
X2_SIZE_LIST = $(filter-out $(BOOKENDS),$(SIZE_LIST))
X2_SIZES = $(addsuffix @2x,$(join $(X2_SIZE_LIST),$(addprefix x,$(X2_SIZE_LIST))))
SIZES = $(BASE_SIZES) $(X2_SIZES)

# A folder-based format
ICONSET = $(NAME).iconset
# A file-based format that macOS prefers
ICNS = $(NAME).icns

BASE_FILES = $(addsuffix .png,$(addprefix $(NAME)_,$(SIZES)))
BASE_ICONSET_FILES = $(addsuffix .png,$(addprefix $(ICONSET)/icon_,$(SIZES)))

##@ Utility

.PHONY: help
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: clean
clean: ## Clean up build artifacts
	rm -rf $(ICNS) $(ICONSET)

##@ Build & Install

all: $(BASE_FILES) $(ICNS) ## Make all outputs

png: $(BASE_FILES) ## Make only base PNG files

icns: $(ICNS) ## Make only macOS .icns file

.PHONY: install-osx
install-osx: $(ICNS) ## Install icon to /Applications/kitty.app
	install -b $(ICNS) /Applications/kitty.app/Contents/Resources/kitty.icns
	rm /var/folders/*/*/*/com.apple.dock.iconcache
	killall Dock
	@echo "Installed $(ICNS) and backed up the old one. You may need to restart."

## Working tasks

# This uses the shell to do some math, ymmv on shells other than bash?
%.png: $(NAME).svg
	inkscape -h $$(($(shell basename -s .png $@ | cut -d '_' -f 2 | cut -d x -f 2 | tr '@' '*'))) $< --export-filename $@
	test -n "$(command -v pngcrush)" && pngcrush -ow $@ || true

$(ICONSET):
	mkdir -p $@

$(ICNS): $(ICONSET) $(BASE_ICONSET_FILES)
	iconutil -c icns $<

