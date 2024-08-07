# Nevica

Nevica is a text editor based on [Nixvim](https://github.com/nix-community/nixvim) and inspired by [Neve](https://github.com/redyf/Neve) . The project's goal is to have a complete core for `highlighting`, `LSPs`, `debuggers`, `formatters`, `diagnostics`, and `tests`. The support for any programming language can be added simply with a file (languages.nix).

| Nevica Java LSP                                                                                                       | Nevica Python CMP                                                                                                       |
| --------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| ![nevica lsps](https://raw.githubusercontent.com/matteocavestri/images/main/screenshots/nevica-lsp-java.png?raw=true) | ![nevica cmps](https://raw.githubusercontent.com/matteocavestri/images/main/screenshots/nevica-cmp-python.png?raw=true) |

| Nevica C Debugger                                                                                                         | Nevica Go Test                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| ![nevica debuggers](https://raw.githubusercontent.com/matteocavestri/images/main/screenshots/nevica-debug-c.png?raw=true) | ![nevica tests](https://raw.githubusercontent.com/matteocavestri/images/main/screenshots/nevica-test-go.png?raw=true) |

The different flavours of nevica are:

- `nevica-full` --> IDE with support for all languages
- `nevica-cc` --> IDE for C/C++
- `nevica-go` --> IDE for Go
- `nevica-rust` --> IDE for Rust
- `nevica-jvm` --> IDE for Java, Scala, Kotlin
- `nevica-python` --> IDE for Python

## How to Use

You can run the packages with the command

```bash
nix run github:matteocavestri/nevica#flavour-name
# e.g. nix run github:matteocavestri/nevica#nevica-go
```

You can run a devShell with experimental flake support

```bash
nix develop --extra-experimental-features 'nix-command flakes' github:matteocavestri/nevica#flavour-name
# e.g. nix develop --extra-experimental-features 'nix-command flakes' github:matteocavestri/nevica#nevica-go
```

You can update your installation with

```bash
nix flake update --extra-experimental-features 'nix-command flakes' --flake github:matteocavestri/nevica
```

## Supported Languages

| Language       | LSP   | Formatter | Diagnostic | Debugger | Test |
| -------------- | ----- | --------- | ---------- | -------- | ---- |
| Bash           | ✅    | ✅        | ✅         | ❌       | ❌   |
| C              | ✅    | ✅        | ✅         | ✅       | 🔜   |
| Cpp            | ✅    | ✅        | ✅         | ✅       | 🔜   |
| Docker         | ✅    | ✅        | ✅         | ❌       | ❌   |
| Docker Compose | ✅    | ✅        | ✅         | ❌       | ❌   |
| Golang         | ✅    | ✅ x3     | ✅         | ✅       | ✅   |
| Java           | ✅    | ✅        | ✅         | ✅       | ⏰   |
| Javascript     | ✅    | ✅        | ✅         | ❌       | ❌   |
| Kotlin         | ✅    | ✅        | ✅         | ⏰       | ⏰   |
| Lua            | ✅    | ✅        | ✅         | ❌       | ❌   |
| Nix            | ✅    | ✅ x3     | ✅         | ❌       | ❌   |
| Python         | ✅ x2 | ✅        | ✅         | ✅       | ⏰   |
| Rust           | ✅    | ✅        | ✅         | ✅       | ⏰   |
| Scala          | ✅    | ✅        | ✅         | ⏰       | ⏰   |
| Typescript     | ✅    | ✅        | ✅         | ❌       | ❌   |
| Zig            | ✅    | ✅        | ✅         | 🔜       | 🔜   |

## Supported Frameworks

| Framework | LSP | Formatter | Diagnostic | Test |
| --------- | --- | --------- | ---------- | ---- |
| Vite      | ❌  | ⏰        | ❌         | ⏰   |
| Svelte    | ✅  | ⏰        | ❌         | ❌   |

Legend:

- ✅ --> Full support
- ❌ --> Not implemented / not needed
- ⏰ --> Work in progress
- 🔜 --> Future implementation

If you want to see the details about LSP, debugger, etc., go to [Support Table](https://github.com/matteocavestri/nevica/blob/main/docs/support-table.md)

## Known Issues

- Long startup time due to Neorg.
  - Solution: lazyload Neorg.
