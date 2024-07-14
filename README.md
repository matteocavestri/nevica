# Nevica

Nixvim based text editor inspired by Neve.

## Support

- ✅**Full Support** (aka. LSP, Formatter, Linter, Debugger)
  - `Rust`
  - `Go`
  - `Java`
  - `Python`
  - `C`
  - `Cpp`
- ✅**Full Support Minor**
  - `Lua`
  - `Nix`
  - `Dockerfile`
  - `Bash/Zsh`
  - `Typescript`
  - `Javascript`
- **WIP**
  - `Docker compose`

## Support Status

| Language       | LSP              | Formatter                   | Linter        | Debugger          |
| -------------- | ---------------- | --------------------------- | ------------- | ----------------- |
| C              | clangd           | clang_format                | cppcheck      | gdb               |
| Cpp            | clangd           | clang_format                | cppcheck      | gdb               |
| Rust           | rust-analyzer    | rust-analyzer               | rust-analyzer | lldb              |
| Golang         | gopls            | gofumpt, goimports, golines | golangci_lint | delve             |
| Java           | jdtls            | jdtls                       | checkstyle    | vscode-java-debug |
| python         | pyright, ruff    | black                       | pylint        | debugpy           |
| typescript     | typescript-tools | prettier                    | eslint        | /                 |
| javascript     | typescript-tools | prettier                    | eslint        | /                 |
| lua            | lua-ls           | stylelua                    | selene        | /                 |
| Nix            | nil-ls           | alejandra                   | statix        | /                 |
| Docker         | dockerls         | dockerls                    | hadolint      | /                 |
| Docker Compose | WIP              | WIP                         | WIP           | /                 |
| Bash           | bashls           | shfmt                       | zsh           | /                 |
