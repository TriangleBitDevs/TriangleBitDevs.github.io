{
  description = "trianglebitdevs.org";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      apps.${system}.preview = {
        type = "app";
        program = toString (
          pkgs.writeShellScript "preview" ''
            exec ${pkgs.zola}/bin/zola serve \
              --interface "$ALLOD_PREVIEW_INTERFACE" --port "$ALLOD_PREVIEW_PORT" --drafts
          ''
        );
      };
    };
}
