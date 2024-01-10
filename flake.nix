{
  inputs = {
    flakey-devShells.url = "https://flakehub.com/f/GetPsyched/not-so-flakey-devshells/0.x.x.tar.gz";
    flakey-devShells.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, flakey-devShells, ... }:
    let
      systems = [ "i686-linux" "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      perSystem = function: nixpkgs.lib.genAttrs systems (system:
        function (
          nixpkgs.legacyPackages.${system}
          // { flakey-devShell-pkgs = flakey-devShells.outputs.packages.${system}; }
        )
      );
    in
    {
      devShells = perSystem (pkgs: {
        default = with pkgs; mkShell {
          buildInputs = [
            (flakey-devShell-pkgs.default.override { environments = [ "nix" "htmx" ]; })
            (flakey-devShell-pkgs.vscodium.override { environments = [ "nix" "htmx" ]; })
          ];
        };
      });
    };
}
