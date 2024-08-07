# Support Table

| Language       | LSP                             | Formatter                       | Diagnostic                      | Debugger          | Test    |
| -------------- | ------------------------------- | ------------------------------- | ------------------------------- | ----------------- | ------- |
| Bash           | bashls                          | shfmt                           | zsh                             | /                 | /       |
| C              | clangd                          | clang_format                    | cppcheck                        | gdb               | /       |
| Cpp            | clangd                          | clang_format                    | cppcheck                        | gdb               | **WIP** |
| Docker         | dockerls                        | dockerls                        | hadolint                        | /                 | /       |
| Docker Compose | docker-compose-language-service | docker-compose-language-service | docker-compose-language-service | /                 | /       |
| Golang         | gopls                           | gofumpt, goimports, golines     | golangci_lint                   | delve             | go      |
| Java           | jdtls                           | jdtls                           | checkstyle                      | vscode-java-debug | **WIP** |
| Javascript     | typescript-tools                | prettier                        | eslint                          | /                 | /       |
| Kotlin         | kotlin-language-server          | klint                           | ktlint                          | **WIP**           | **WIP** |
| Lua            | lua-ls                          | stylelua                        | selene                          | /                 | /       |
| Nix            | nil-ls                          | alejandra, nixfmt, nixpkgs_fmt  | statix                          | /                 | /       |
| Python         | pyright, ruff                   | black                           | pylint                          | debugpy           | **WIP** |
| Rust           | rust-analyzer                   | rust-analyzer                   | rust-analyzer                   | lldb              | **WIP** |
| Scala          | metals                          | scalafmt                        | metals                          | **WIP**           | **WIP** |
| Typescript     | typescript-tools                | prettier                        | eslint                          | /                 | /       |
| Zig            | zls                             | zls                             | zls                             | **WIP**           | **WIP** |
