ifneq (,$(wildcard ./.env))
    include .env
    export
endif

.PHONY: stow clean
stow: git/.gitconfig
	stow --verbose --target ~ --restow */
clean:
	stow --verbose --target ~ --delete */
git/.gitconfig:
	sed -e "s/EMAIL/$(EMAIL)/g" -e "s/NAME/$(NAME)/g" ./git/.gitconfig.template > ./git/.gitconfig