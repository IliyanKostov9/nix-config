# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      # (modulesPath + "/installer/scan/not-detected.nix")
      ./boot.nix
      ./bluetooth.nix
      ./filesystem.nix
      ./networking.nix
      ./nvidia.nix
      ./opengl.nix
      ./systemd.nix
    ];
  swapDevices =
    [{ device = "/dev/disk/by-uuid/85b811ca-f0aa-452e-a679-549dcf80e1ba"; }];

  services.blueman.enable = true;
  hardware.enableAllFirmware = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
