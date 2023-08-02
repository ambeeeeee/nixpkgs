{ stdenv, fetchgit, protobuf, protobufc, libusb, boost, lib, openssl, cmake, qt5, pulseaudio, rtaudio, aasdk, wrapQtAppsHook, h264bitstream, gst_all_1, pkgconfig}:

stdenv.mkDerivation rec {
    name = "openauto";

    src = fetchgit {
        url = "https://github.com/OpenDsh/openauto";
        rev = "6496f8e360b54e2c22c55edcb0757f46865294dd";
        sha256 = "sha256-kEqKJMWC5tI2WC45CF1fGJbr15PjGQlVKgp2YXzyRb4=";
    };

    buildInputs = [
        pkgconfig
        wrapQtAppsHook
        protobuf
        h264bitstream
        protobufc
        libusb
        boost
        pulseaudio
        rtaudio
        openssl
        cmake
        qt5.qtbase
        qt5.qtmultimedia
        qt5.qtconnectivity
        qt5.qttools
        aasdk
    ] ++ (with gst_all_1; [
    gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav gst-vaapi
  ]);


    postInstall = ''
      qtWrapperArgs+=(
        --prefix GST_PLUGIN_SYSTEM_PATH_1_0 : "$GST_PLUGIN_SYSTEM_PATH_1_0"
      )
    '';

    nativeBuildInputs = [ cmake ];

    cmakeFlags = [
        "-DCMAKE_BUILD_TYPE=Release"
        "-DRPI3_BUILD=FALSE"
        "-DCMAKE_SKIP_BUILD_RPATH=ON"
        ];
}
