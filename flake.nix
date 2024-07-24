{
  description = "Nevica configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { nixvim, flake-parts, self, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { pkgs, system, ... }:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
          };
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};

          nixvimModuleDefault = {
            inherit pkgs;
            module = import ./config; # import the module directly
            extraSpecialArgs = { };
          };
          nixvimModuleGo = {
            inherit pkgs;
            module = import ./config/default-go.nix; # import the Go module
            extraSpecialArgs = { };
          };
          nixvimModuleRust = {
            inherit pkgs;
            module = import ./config/default-rust.nix; # import the Rust module
            extraSpecialArgs = { };
          };
          nixvimModuleJava = {
            inherit pkgs;
            module = import ./config/default-java.nix; # import the Java module
            extraSpecialArgs = { };
          };
          nixvimModuleCC = {
            inherit pkgs;
            module = import ./config/default-cc.nix; # import the C/C++ module
            extraSpecialArgs = { };
          };
          nixvimModulePython = {
            inherit pkgs;
            module =
              import ./config/default-python.nix; # import the Python module
            extraSpecialArgs = { };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModuleDefault;
          nvimGo = nixvim'.makeNixvimWithModule nixvimModuleGo;
          nvimRust = nixvim'.makeNixvimWithModule nixvimModuleRust;
          nvimJava = nixvim'.makeNixvimWithModule nixvimModuleJava;
          nvimCC = nixvim'.makeNixvimWithModule nixvimModuleCC;
          nvimPython = nixvim'.makeNixvimWithModule nixvimModulePython;
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule
              nixvimModuleDefault;
          };

          packages = {
            nevica-full = nvim;
            nevica-go = nvimGo;
            nevica-rust = nvimRust;
            nevica-java = nvimJava;
            nevica-cc = nvimCC;
            nevica-python = nvimPython;
          };

          devShells = {
            nevica-full = pkgs.mkShell {
              buildInputs = [
                nvim
                # General
                pkgs.git
                pkgs.curl
                pkgs.wget
                pkgs.zsh
                # Rust
                pkgs.clippy
                pkgs.rustfmt
                pkgs.lldb_18
                pkgs.cargo
                pkgs.rustc
                # C/C++
                pkgs.gdb
                pkgs.gcc
                pkgs.cmake
                pkgs.gnumake
                # Go
                pkgs.go
                # Java
                pkgs.jdk
                pkgs.gradle
                # Javascript/Typescript
                pkgs.nodejs
                pkgs.typescript
                pkgs.nodePackages.npm
                # Lua
                pkgs.lua
                pkgs.luajitPackages.luarocks-nix
                # Python
                pkgs.python3
                pkgs.python3Packages.pip
                pkgs.python3Packages.pytest
                pkgs.pipx
              ];
              shellHook = ''
                echo "Welcome to the Nevica Full devShell"
              '';
            };

            go = pkgs.mkShell {
              buildInputs = [
                nvimGo
                pkgs.git
                pkgs.curl
                pkgs.wget
                pkgs.zsh
                pkgs.go
                # Deps
                pkgs.lua
                pkgs.luajitPackages.luarocks-nix
              ];
              shellHook = ''
                echo "Welcome to the Go development shell"
              '';
            };

            rust = pkgs.mkShell {
              buildInputs = [
                nvimRust
                pkgs.git
                pkgs.curl
                pkgs.wget
                pkgs.zsh
                pkgs.clippy
                pkgs.rustfmt
                pkgs.lldb_18
                pkgs.cargo
                pkgs.rustc
                # Deps
                pkgs.lua
                pkgs.luajitPackages.luarocks-nix
              ];
              shellHook = ''
                echo "Welcome to the Rust development shell"
              '';
            };

            java = pkgs.mkShell {
              buildInputs = [
                nvimJava
                pkgs.git
                pkgs.curl
                pkgs.wget
                pkgs.zsh
                pkgs.jdk
                pkgs.gradle
                # Deps
                pkgs.lua
                pkgs.luajitPackages.luarocks-nix
              ];
              shellHook = ''
                echo "Welcome to the Java development shell"
              '';
            };

            cc = pkgs.mkShell {
              buildInputs = [
                nvimCC
                pkgs.git
                pkgs.curl
                pkgs.wget
                pkgs.zsh
                pkgs.gdb
                pkgs.gcc
                pkgs.cmake
                pkgs.gnumake
                # Deps
                pkgs.lua
                pkgs.luajitPackages.luarocks-nix
              ];
              shellHook = ''
                echo "Welcome to the C/C++ development shell"
              '';
            };

            python = pkgs.mkShell {
              buildInputs = [
                nvimPython
                pkgs.git
                pkgs.curl
                pkgs.wget
                pkgs.zsh
                pkgs.python3
                pkgs.python3Packages.pip
                pkgs.python3Packages.pytest
                pkgs.pipx
                # Deps
                pkgs.lua
                pkgs.luajitPackages.luarocks-nix
              ];
              shellHook = ''
                echo "Welcome to the Python development shell"
              '';
            };
          };
        };
    };
}
