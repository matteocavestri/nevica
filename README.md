# Nevica

## Status

| Language       | LSP              | Formatter                   | Linter        | Debugger          | Support                      |
| -------------- | ---------------- | --------------------------- | ------------- | ----------------- | ---------------------------- |
| C              | clangd           | clang_format                | cppcheck      | WIP               | No Debug                     |
| Cpp            | clangd           | clang_format                | cppcheck      | WIP               | No Debug                     |
| Rust           | rust-analyzer    | rust-analyzer               | WIP           | WIP               | No Debug, lint, deps problem |
| Golang         | gopls            | gofumpt, goimports, golines | golangci_lint | delve             | Complete                     |
| Java           | jdtls            | jdtls                       | checkstyle    | vscode-java-debug | Complete                     |
| typescript     | typescript-tools | prettier                    | eslint        | WIP               | No Debug                     |
| javascript     | typescript-tools | prettier                    | eslint        | WIP               | No Debug                     |
| python         | pyright, ruff    | black                       | pylint        | dap-python        | Complete                     |
| lua            | lua-ls           | stylelua                    | selene        | WIP               | No Debug                     |
| Nix            | nil-ls           | alejandra                   | statix        | WIP               | No Debug                     |
| Docker         | dockerls         | dockerls                    | hadolint      | /                 | Complete                     |
| Docker Compose | WIP              |                             | /             | /                 | WIP                          |
| Bash           | bashls           | shfmt                       | zsh           | WIP               | No Debug                     |
