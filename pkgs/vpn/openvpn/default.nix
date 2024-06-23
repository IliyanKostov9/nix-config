{ pkgs
, config
, ...
}:
{
  home.packages = with pkgs; [ openvpn3 ];
  services = {
    openssh.enable = true;
    libinput.enable = true;
    openvpn.servers = {
      personalVPN = {
        config = "config /home/ikostov2/.config/openvpn/personalVPN.ovpn";
        updateResolvConf = true;
        autoStart = true;
      };
    };
  };
}
