{
  description = "printer go bzzz bzzzzzz pzzz";

  inputs = {
    svelte-env.url = "https://flakehub.com/f/GetPsyched/svelte-env/0.x.x.tar.gz";
    svelte-env.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, svelte-env, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      svelte-env-pkgs = svelte-env.outputs.packages.${system};

      princexml = pkgs.callPackage ./princexml.nix { };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          svelte-env-pkgs.default
          svelte-env-pkgs.vscode

          busybox
          just
          princexml
          watchexec
        ];
      };
    };
}
