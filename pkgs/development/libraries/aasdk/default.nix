{ stdenv, fetchgit, protobuf, protobufc, libusb, boost, lib, openssl, cmake }:

stdenv.mkDerivation rec {
    name = "aasdk";

    src = fetchgit {
        url = "https://github.com/openDsh/aasdk.git";
        rev = "1bc0fe69d5f5f505c978a0c6e32c860e820fa8f6";
        sha256 = "sha256-Gqd+IHn3G3yU1/SSrp8B+isn1mhsGj2w41oMmSgkpQY=";
    };

    patches = [
        ./openssl_patch.patch
    ];

    buildInputs = [
        protobuf
        protobufc
        libusb
        boost
        openssl
        cmake
    ];

    nativeBuildInputs = [ cmake ];

    cmakeFlags = ["-DCMAKE_BUILD_TYPE=Release"];
}