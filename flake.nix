{
  description = "printer go bzzz bzzzzzz pzzz";

  inputs = {
    flakey-devShells.url = "https://flakehub.com/f/GetPsyched/not-so-flakey-devshells/0.x.x.tar.gz";
    flakey-devShells.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, flakey-devShells, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
          "corefonts"
        ];
      };
      flakey-devShell-pkgs = flakey-devShells.outputs.packages.${system};

      princexml = pkgs.callPackage ./princexml.nix { };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          (flakey-devShell-pkgs.default.override { environments = [ "nix" "svelte" ]; })
          (flakey-devShell-pkgs.vscodium.override { environments = [ "nix" "svelte" ]; })

          corefonts
          just
          nodejs
          princexml
          watchexec
        ];
        shellHook = ''
          export PATH="$PWD/node_modules/.bin:$PATH";
        '';
      };
    };
}
