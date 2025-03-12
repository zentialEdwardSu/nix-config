{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    
    zplug = {
      enable = true;
      plugins = [
        {
          name = "plugins/git";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/thefuck";
          tags = [ "from:oh-my-zsh" ];
        }
        {name = "zsh-users/zsh-completions";}
        {name = "zsh-users/zsh-syntax-highlighting";}
        {name = "zsh-users/zsh-history-substring-search";}
        {name = "zsh-users/zsh-autosuggestions";}
      ];
    };
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}