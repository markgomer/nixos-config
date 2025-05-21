{ pkgs, ... }:

{
  imports = [
    ./DE/xfce-home.nix
  ];

  home = {
    username = "majunior";
    homeDirectory = "/home/majunior";
    stateVersion = "24.11";

    packages = with pkgs; [
      bat
      cmake
      lunarvim
      lazygit
      distrobox
      podman
      python3
      asdf-vm
      ripgrep
      fastfetch
      lutris
      heroic
      xwayland
      kdePackages.xwaylandvideobridge
    ];

    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
      EDITOR = "lvim";
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      nrs = "sudo nixos-rebuild switch --flake $HOME/.config/nixos-config#avell-nixos";
      nlg = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      ngc = "nix-collect-garbage";
      nso = "nix-store --optmise";
      ecf = "lvim $HOME/.config/nixos-config";
    };
    initExtra = ''
      export PS1='\[\e[38;5;39m\]\u\[\e[0m\]@\[\e[38;5;198m\]\h\[\e[0m\] in \[\e[38;5;44;1m\]\w\[\e[0m\] \n\[\e[38;5;28m\]\$\[\e[0m\] '
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font.normal = {
        family = "Hasklug Nerd Font Propo";
        style = "Regular";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "markgomer";
    userEmail = "aureliojuniorcmrj@hotmail.com";
  };

  # let home manager install and manage itself
  programs.home-manager.enable = true;
}
