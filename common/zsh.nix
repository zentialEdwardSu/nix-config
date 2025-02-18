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
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        } # Installations with additional options. For the list of options, please refer to Zplug README.
      ];
    };
    initExtra = ''
      if [[ -f ~/.p10k.zsh ]]; then
          source ~/.p10k.zsh
      fi
    '';
  };
}