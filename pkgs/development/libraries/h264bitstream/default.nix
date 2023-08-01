{ stdenv, fetchgit, ffmpeg, autoreconfHook, lib, pkg-config}:

stdenv.mkDerivation rec {
    name = "h264bitstream";

    src = fetchgit {
        url = "https://github.com/aizvorski/h264bitstream.git";
        rev = "34f3c58afa3c47b6cf0a49308a68cbf89c5e0bff";
        sha256 = "sha256-BWHUY1Ajt8soQJJh1oBKO/qEHqFuCQ4ZwAkp8Sf7MGc=";
    };

    buildInputs = [
        autoreconfHook pkg-config
        ffmpeg
    ];
}