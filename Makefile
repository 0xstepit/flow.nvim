fmt:
	@echo "Formatting codebase ..."
	@stylua lua/ --config-path=.stylua.toml

all: fmt
