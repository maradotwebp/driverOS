{ pkgs, lib, fetchFromGitHub, rustPlatform, ... }:
rustPlatform.buildRustPackage rec {
  pname = "swww";
  version = "0.7.2";

  src = fetchFromGitHub {
    owner = "Horus645";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-1SmCeIlcjOX3yCvpfqQ82uq4h2xlGhX9OCwKb6jGK78=";
  };

  strictDeps = true;
  nativeBuildInputs = with pkgs; [ libxkbcommon pkg-config ];
  buildInputs = with pkgs; [ libxkbcommon ];

  cargoHash = "sha256-08YM9yTCRJPHdOc1+7F3guYiP3y1WSi3/hzlDRVpitc=";

  meta = with lib; {
    description = "A Solution to your Wayland Wallpaper Woes ";
    homepage = "https://github.com/Horus645/swww";
  };
}