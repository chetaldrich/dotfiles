.PHONY: apply diff status edit update

apply:
	chezmoi apply --force

diff:
	chezmoi diff

status:
	chezmoi status

edit:
	chezmoi cd

update:
	chezmoi update
