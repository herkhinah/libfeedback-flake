{
  description = "Gnome Calls";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: 
    let pkgs = nixpkgs.legacyPackages.x86_64-linux; in {

    packages.x86_64-linux.libfeedback = pkgs.stdenv.mkDerivation rec {
      pname = "libfeedback";
      version = "v0.0.0+git20210426";

      src = fetchGit {
        url = "https://source.puri.sm/Librem5/feedbackd.git";
	rev = "48b4bb97d62fa1917a9e54852f593d3190ef188c";
      };

      nativeBuildInputs = with pkgs; [
        meson
	ninja
	pkg-config

	glib
	dbus
	json-glib
	gtk3
	cmake
	gsound
	libgudev
	gobject-introspection

        vala
	wrapGAppsHook
      ];
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.libfeedback;

  };
}
