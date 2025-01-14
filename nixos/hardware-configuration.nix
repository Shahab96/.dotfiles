# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/76272a47-955b-4bda-82ec-50418f8210f9";
      fsType = "ext4";
    };

  boot.initrd.luks.devices = {
    "luks-d35c44b6-3e25-4e0a-a439-95a786f17cd8".device = "/dev/disk/by-uuid/d35c44b6-3e25-4e0a-a439-95a786f17cd8";
    "luks-15c96eaf-c225-4a27-873e-94ed67b04037".device = "/dev/disk/by-uuid/15c96eaf-c225-4a27-873e-94ed67b04037";
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4B7B-782A";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/5b377538-3a2e-4ac9-ba53-a63b65b0f48b"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp193s0f3u2.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
