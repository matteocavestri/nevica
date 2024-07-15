# Nevica

Nixvim based text editor inspired by Neve.

## How to Use

You can try Nevica using nix.
There are different versions of Nevica:

**Nevica Full**

```bash
nix run github:matteocavestri/nevica#nevica-full
```

**Nevica Go**

```bash
nix run github:matteocavestri/nevica#nevica-go
```

**Nevica Rust**

```bash
nix run github:matteocavestri/nevica#nevica-rust
```

**Nevica Java**

```bash
nix run github:matteocavestri/nevica#nevica-java
```

**Nevica C/C++**

```bash
nix run github:matteocavestri/nevica#nevica-cc
```

**Nevica Python**

```bash
nix run github:matteocavestri/nevica#nevica-python
```

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

| Language       | LSP              | Formatter                   | Linter        | Debugger          | Test    |
| -------------- | ---------------- | --------------------------- | ------------- | ----------------- | ------- |
| C              | clangd           | clang_format                | cppcheck      | gdb               | /       |
| Cpp            | clangd           | clang_format                | cppcheck      | gdb ?             | **WIP** |
| Rust           | rust-analyzer    | rust-analyzer               | rust-analyzer | lldb              | **WIP** |
| Golang         | gopls            | gofumpt, goimports, golines | golangci_lint | delve             | go      |
| Java           | jdtls            | jdtls                       | checkstyle    | vscode-java-debug | maven   |
| python         | pyright, ruff    | black                       | pylint        | debugpy           | **WIP** |
| typescript     | typescript-tools | prettier                    | eslint        | /                 | /       |
| javascript     | typescript-tools | prettier                    | eslint        | /                 | /       |
| lua            | lua-ls           | stylelua                    | selene        | /                 | /       |
| Nix            | nil-ls           | alejandra                   | statix        | /                 | /       |
| Docker         | dockerls         | dockerls                    | hadolint      | /                 | /       |
| Bash           | bashls           | shfmt                       | zsh           | /                 | /       |
| Docker Compose | **WIP**          | **WIP**                     | **WIP**       | /                 | /       |

## Todo

- more testing and fixing on gdb (cpp)
- neotest integration for cpp, rust, golang, python --> OK
- write documentation
- make devShells
- integrate executables (e.g. lldb)
- Move Test config under languages
- Add neorg / neovim org mode
