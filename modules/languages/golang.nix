# SPDX-License-Identifier: GPL-2.0-or-later
# Nevica Golang setup file
{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.golang.enable = lib.mkEnableOption "Enable golang support";
  };
  config = lib.mkIf config.nevica.languages.golang.enable {
    plugins = {
      # Color Highlighting for go code
      treesitter.settings.ensure_installed = [
        "go"
      ];
      lsp.servers = {
        # Gopls is the official Go language server developed by the Go team
        # https://pkg.go.dev/golang.org/x/tools/gopls#section-readme
        gopls = {
          enable = true;
          package = pkgs.gopls;
          autostart = true;
          filetypes = ["go"];
          goPackage = pkgs.go;
        };
      };
      none-ls.sources = {
        formatting = {
          # Command goimports updates your Go import lines,
          # adding missing ones and removing unreferenced ones.
          # https://pkg.go.dev/golang.org/x/tools/cmd/goimports
          goimports = {
            enable = true;
            package = pkgs.gotools;
          };
          # Golines is a Go code formatter that shortens long lines
          # https://github.com/segmentio/golines
          golines = {
            enable = true;
            package = pkgs.golines;
          };
          # Enforce a stricter format than gofmt, while being backwards compatible.
          # https://github.com/mvdan/gofumpt
          gofumpt = {
            enable = true;
            package = pkgs.gofumpt;
          };
        };
        diagnostics = {
          # golangci-lint is a fast Go linters runner.
          # https://github.com/golangci/golangci-lint
          golangci_lint = {
            enable = true;
            package = pkgs.golangci-lint;
          };
        };
        code_actions = {
          # impl generates method stubs for implementing an interface.
          # https://github.com/josharian/impl
          impl = {
            enable = true;
          };
          # Go tool to modify/update field tags in structs.
          # https://github.com/fatih/gomodifytags
          gomodifytags = {
            enable = true;
          };
          # The Refactoring library based off the Refactoring book by Martin Fowler
          # It works with TypeScript, JavaScript, Lua, C/C++, Golang, Python, Java
          # PHP, Ruby, C#
          # https://github.com/ThePrimeagen/refactoring.nvim
          refactoring = {
            enable = true;
          };
        };
      };
      dap.extensions = {
        dap-go = {
          enable = true;
          package = pkgs.vimPlugins.nvim-dap-go;
          delve.path = "${pkgs.delve}/bin/dlv";
        };
      };
      neotest.adapters = {
        golang = {
          enable = true;
          package = pkgs.vimPlugins.neotest-golang;
        };
      };
    };
  };
}
