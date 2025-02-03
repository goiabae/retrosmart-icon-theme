{
  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.retrosmart-icon-theme =
      let pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs; in
      pkgs.stdenv.mkDerivation {
        pname = "retrosmart-icon-theme";
        version = "0.3";
        src = ./.;

        nativeBuildInputs = [ pkgs.gtk3 ];

        propagatedBuildInputs = with pkgs; [
          gnome-icon-theme hicolor-icon-theme
        ];

        installPhase = ''
          runHook preInstall
          make install
          gtk-update-icon-cache $out/share/icons/retrosmart-icon-theme
          runHook postInstall
        '';

        dontDropIconThemeCache = true;
      };

    overlays.default = final: prev: {
      inherit (self.packages.x86_64-linux) retrosmart-icon-theme;
    };
  };
}
