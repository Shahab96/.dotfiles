{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      source <(nh completions --shell zsh)
      eval "$(zoxide init zsh)"
    '';

    shellAliases = {
      ".." = "cd ..";
      ls = "exa";
      vim = "nvim";
      grep = "rg";
      du = "dust";
      rm = "rip";
      cp = "xcp";
      uo = "nh os switch ~/.dotfiles";
      uh = "nh home switch ~/.dotfiles";
      k = "kubectl";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
