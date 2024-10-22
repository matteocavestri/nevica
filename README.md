# ❄️ Nevica: Your Ultimate Vim-based IDE

**Nevica** is a Nixvim-based distribution designed to provide a complete IDE experience directly in Vim. 🌟 Whether you’re coding in languages like C, Python, Golang, or Nix, **Nevica** equips you with all the essential tools you need for maximum productivity! 🚀

Configured to offer support for each programming language, **Nevica** allows you to quickly enable features for specific languages through its **flavours** menu (available in `./profiles`) or configure utilities in the `./modules/languages` directory.

## 🚀 **How to Install**

All you need is **Nix** (available on any OS). To get started, just run:

```bash
nix run github:matteocavestri/nevica#nevica
# or for a specific flavour
nix run github:matteocavestri/nevica#flavour-name
```

## 🔧 **Key Features**

Nevica provides everything you need to work seamlessly, including:

- 🎨 **Syntax Highlighting**: Beautiful code coloring with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- 🧠 **Language Server Protocol (LSP)**: Full LSP support for a smooth coding experience.
- 🔍 **File Finder**: Quickly find files and symbols with [Telescope](https://github.com/nvim-telescope/telescope.nvim).
- 🐛 **Debugging**: Integrated debugging with [nvim-dap](https://github.com/mfussenegger/nvim-dap) and [dap-ui](https://github.com/rcarriga/nvim-dap-ui).
- ⚙️ **Completion**: Smart code completion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- 📝 **Formatter**: Automatic code formatting with `lsp_format` and [none_ls](https://github.com/nvimtools/none-ls.nvim).
- 🚨 **Diagnostics & Code Actions**: Linting, diagnostics, and contextual actions with [none_ls](https://github.com/nvimtools/none-ls.nvim).
- 🗂️ **File Tree**: Easily navigate your files with [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim).
- 🎹 **Keymap Guide**: Can’t remember the keybindings? No worries, [WhichKey](https://github.com/folke/which-key.nvim) has you covered!
- 🧪 **Testing Framework**: Run your tests effortlessly with [Neotest](https://github.com/nvim-neotest/neotest).
- 🔍 **Git Integration**: Optimized Git management with [LazyGit](https://github.com/jesseduffield/lazygit).
- 🔧 **And much more...**: Explore the countless features and customizations that Nevica offers.

## ✨ **Easy Customization**

**Nevica** is highly customizable! You can enable or disable features in the `./custom` module, and even override default options using `lib.mkForce`.

Example:

```nix
nevica.languages.nix.enable = lib.mkForce false;
```

You can also add your own Nixvim configurations to create your ideal development environment.

## 💡 **Contribute to Nevica**

Love Vim and want to help? 🎉 Contributions are more than welcome! Check out the language support table below, and if something is missing or incomplete, feel free to contribute and improve **Nevica**.

## 🛠️ **Supported Languages**

| 🌐 Language | LSP     | Formatter | Diagnostic | Debugger | Test |
| ----------- | ------- | --------- | ---------- | -------- | ---- |
| **C**       | ✅      | ✅        | ✅         | ✅       | 🔜   |
| **C++**     | ✅      | ✅        | ✅         | ✅       | 🔜   |
| **Go**      | ✅      | ✅ (x3)   | ✅         | ✅       | ✅   |
| **Java**    | ✅      | ✅        | ✅         | ✅       | ⏰   |
| **Nix**     | ✅      | ✅ (x3)   | ✅         | ❌       | ❌   |
| **Python**  | ✅ (x2) | ✅        | ✅         | ✅       | ⏰   |
| **Rust**    | ✅      | ⏰        | ✅         | ✅       | ❌   |
| **Scala**   | ✅      | ✅        | ✅         | ⏰       | ⏰   |

**Legend**:

- ✅ Full support
- ❌ Not implemented / Not needed
- ⏰ Work in progress
- 🔜 Coming soon

## 📝 **Notes**

In the `./oldConfig` directory, you can find the previous Nevica configuration. This version is temporarily kept during the migration phase as some things may still be useful. However, do not rely on this version as it is **deprecated** and will no longer be updated.
