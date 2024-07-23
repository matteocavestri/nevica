# Nevica

Nevica is a text editor based on [Nixvim](https://github.com/nix-community/nixvim) and inspired by [Neve](https://github.com/redyf/Neve) . The project's goal is to have a complete core for `highlighting`, `LSPs`, `debuggers`, `formatters`, `diagnostics`, and `tests`. The support for any programming language can be added simply with a file (languages.nix).

The different flavours of nevica are:

- `nevica-full` --> IDE with support for all languages
- `nevica-cc` --> IDE for C/C++
- `nevica-go` --> IDE for Go
- `nevica-rust` --> IDE for Rust
- `nevica-java` --> IDE for Java
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

## Support

| Language       | LSP   | Formatter | Diagnostic | Debugger | Test |
| -------------- | ----- | --------- | ---------- | -------- | ---- |
| C              | ✅    | ✅        | ✅         | ✅       | ⏰   |
| Cpp            | ✅    | ✅        | ✅         | ✅       | ⏰   |
| Rust           | ✅    | ✅        | ✅         | ✅       | ⏰   |
| Golang         | ✅    | ✅ x3     | ✅         | ✅       | ✅   |
| Java           | ✅    | ✅        | ✅         | ✅       | ⏰   |
| Python         | ✅ x2 | ✅        | ✅         | ✅       | ⏰   |
| Typescript     | ✅    | ✅        | ✅         | ❌       | ❌   |
| Javascript     | ✅    | ✅        | ✅         | ❌       | ❌   |
| Lua            | ✅    | ✅        | ✅         | ❌       | ❌   |
| Nix            | ✅    | ✅        | ✅         | ❌       | ❌   |
| Docker         | ✅    | ✅        | ✅         | ❌       | ❌   |
| Bash           | ✅    | ✅        | ✅         | ❌       | ❌   |
| Docker Compose | ✅    | ✅        | ✅         | ❌       | ❌   |

Legend:

- ✅ --> Full support
- ❌ --> Not implemented / not needed
- ⏰ --> Work in progress

If you want to see the details about LSP, debugger, etc., go to [Support Table](https://github.com/matteocavestri/nevica/blob/main/docs/support-table.md)
