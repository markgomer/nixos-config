{ pkgs, ... }:

{
  imports = [
    ./xfce-home.nix
    # ./hyprland-home.nix
    ./themes.nix
  ];

  home = {
    username = "majunior";
    homeDirectory = "/home/majunior";
    stateVersion = "25.11";

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
      stow
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
      sv = "$HOME/.local/scripts/powersave.sh";
      eq = "$HOME/.local/scripts/equilibrado.sh";
      pw = "$HOME/.local/scripts/performance.sh";
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
      window = {
        opacity = 0.9;
        dimensions = {
          lines = 25;
          columns = 86;
        };
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
