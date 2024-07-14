{
  description = "Nevica configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    nixvim,
    flake-parts,
    self,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        pkgs = import inputs.nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};

        nixvimModuleDefault = {
          inherit pkgs;
          module = import ./config; # import the module directly
          extraSpecialArgs = {};
        };
        nixvimModuleGo = {
          inherit pkgs;
          module = import ./config/default-go.nix; # import the Go module
          extraSpecialArgs = {};
        };
        nixvimModuleRust = {
          inherit pkgs;
          module = import ./config/default-rust.nix; # import the Rust module
          extraSpecialArgs = {};
        };
        nixvimModuleJava = {
          inherit pkgs;
          module = import ./config/default-java.nix; # import the Java module
          extraSpecialArgs = {};
        };
        nixvimModuleCC = {
          inherit pkgs;
          module = import ./config/default-cc.nix; # import the C/C++ module
          extraSpecialArgs = {};
        };
        nixvimModulePython = {
          inherit pkgs;
          module = import ./config/default-python.nix; # import the Python module
          extraSpecialArgs = {};
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModuleDefault;
        nvimGo = nixvim'.makeNixvimWithModule nixvimModuleGo;
        nvimRust = nixvim'.makeNixvimWithModule nixvimModuleRust;
        nvimJava = nixvim'.makeNixvimWithModule nixvimModuleJava;
        nvimCC = nixvim'.makeNixvimWithModule nixvimModuleCC;
        nvimPython = nixvim'.makeNixvimWithModule nixvimModulePython;
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModuleDefault;
        };

        packages = {
          nevica-full = nvim;
          nevica-go = nvimGo;
          nevica-rust = nvimRust;
          nevica-java = nvimJava;
          nevica-cc = nvimCC;
          nevica-python = nvimPython;
        };
        apps = {
          nevica-full = {
            type = "app";
            program = "${self.packages.${system}.nevica-full}/bin/nvim";
          };
          nevica-go = {
            type = "app";
            program = "${self.packages.${system}.nevica-go}/bin/nvim";
          };
          nevica-rust = {
            type = "app";
            program = "${self.packages.${system}.nevica-rust}/bin/nvim";
          };
          nevica-java = {
            type = "app";
            program = "${self.packages.${system}.nevica-java}/bin/nvim";
          };
          nevica-cc = {
            type = "app";
            program = "${self.packages.${system}.nevica-cc}/bin/nvim";
          };
          nevica-python = {
            type = "app";
            program = "${self.packages.${system}.nevica-python}/bin/nvim";
          };
        };
      };
    };
}
