.PHONY: fmt extras

fmt:
	@echo "----------------------------------------------------------------------------------------"
	@echo "Formatting codebase ...\n"
	@stylua lua/ --config-path=.stylua.toml
	@echo "Code formatted successfully!"

extras:
	@echo "----------------------------------------------------------------------------------------"
	@echo "Generating extra files ...\n"
	@lua scripts/generate-extras.lua all
	@echo "\nExtra files generated successfully!\n"

all: fmt extras
