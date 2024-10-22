{
  description = "Nevica editor";

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
      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        pkgs = import inputs.nixpkgs {
          inherit system;
          # config = {allowUnfree = true;};
        };
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};

        nixvimModuleDefault = {
          inherit pkgs;
          module = import ./profiles/nevica.nix; # import nevica default profile
          extraSpecialArgs = {};
        };
        nixvimModuleFull = {
          inherit pkgs;
          module = import ./profiles/nevica-full.nix; # import nevica full profile
          extraSpecialArgs = {};
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModuleDefault;
        nvimFull = nixvim'.makeNixvimWithModule nixvimModuleFull;
      in {
        checks = {
          default =
            nixvimLib.check.mkTestDerivationFromNixvimModule
            nixvimModuleFull;
        };

        packages = {
          nevica = nvim;
          nevica-full = nvimFull;
        };
      };
    };
}
