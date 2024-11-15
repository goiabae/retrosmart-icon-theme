{
  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.retrosmart-icon-theme =
      with nixpkgs.legacyPackages.x86_64-linux; pkgs.stdenv.mkDerivation {
        pname = "retrosmart-icon-theme";
        version = "0.3";
        src = ./.;
      };
  };
}
