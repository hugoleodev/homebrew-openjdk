# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk11" do
  version "11.0.9,1"
  sha256 "5f30507b2fbd7076fd4594025a0421ff210359aa434f62507f982d9eea9d0354"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-11.0.9.1%2B1/OpenJDK11U-jdk_x64_mac_hotspot_11.0.9.1_1.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 11"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK11U-jdk_x64_mac_hotspot_11.0.9.1_1.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.11.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.11.jdk"
end
