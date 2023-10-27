{
  description = "printer go bzzz bzzzzzz pzzz";

  inputs = {
    svelte-env.url = "github:GetPsyched/nix-starter-flakes?dir=svelte";
    svelte-env.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, svelte-env, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
          "corefonts"
        ];
      };
      svelte-env-pkgs = svelte-env.outputs.packages.${system};

      princexml = pkgs.callPackage ./princexml.nix { };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          svelte-env-pkgs.default
          svelte-env-pkgs.vscode

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
