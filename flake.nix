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
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with svelte-env-pkgs; [ default vscode ];
      };
    };
}
