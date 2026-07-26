.PHONY: help check
help:
	@printf '%s\n' 'make check  Validate context/front door, shell syntax, and patch hygiene'
check:
	python3 scripts/check_context.py
	bash -n scripts/build-index.sh
	git diff --check
