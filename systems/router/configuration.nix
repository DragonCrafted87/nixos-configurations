{ config, lib, pkgs, modulesPath, ... }:

{
    imports =
    [
      ./hardware-configuration.nix
      ./common.nix
      ./ssh-user-keys.nix
    ];

  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
  };

  networking = {
    hostName = "router";
    domain = "stealthdragonland.net";
    interfaces.enp2s0.ipv4.addresses = [
      {
        address = "192.168.0.155";
        prefixLength = 20;
      }
    ];
    defaultGateway = "192.168.0.1";
    nameservers = [ "192.168.0.1" ];
    firewall = {
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
  };

}
