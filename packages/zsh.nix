{ config, lib, pkgs, ... }:

{
  programs = {
    zsh.enable = true;
  };

  home-manager.users.marcel = {
    programs = {
      zsh = {
        enable = true;
        defaultKeymap = "emacs";

        history = {
          size = 1000;
          save = 1000;
          extended = true;
          ignoreAllDups = true;
          ignoreSpace = true;
        };

        historySubstringSearch = {
          enable = true;
          searchUpKey = [
            "$terminfo[kcuu1]"
            "^P"
          ];
          searchDownKey = [
            "$terminfo[kcud1]"
            "^N"
          ];
        };

        shellAliases = {
          diff = "diff --color=always";
          grep = "grep --color=always --line-number";
          ip = "ip --color=always";
          ls = "ls --color=always --classify";
        };

        initContent = let
          zshConfigBeforeCompInit = lib.mkOrder 550 ''
            zstyle ':completion:*' auto-description 'specify: %d'
            zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
            zstyle ':completion:*' completions 1
            zstyle ':completion:*' expand prefix suffix
            zstyle ':completion:*' file-sort name
            zstyle ':completion:*' format 'Completing %d'
            zstyle ':completion:*' glob 1
            zstyle ':completion:*' group-name '''
            zstyle ':completion:*' ignore-parents parent pwd .. directory
            zstyle ':completion:*' insert-unambiguous true
            zstyle ':completion:*' list-colors '''
            zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
            zstyle ':completion:*' max-errors 3
            zstyle ':completion:*' menu select=1
            zstyle ':completion:*' original true
            zstyle ':completion:*' preserve-prefix '//[^/]##/'
            zstyle ':completion:*' prompt 'errors: %e'
            zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
            zstyle ':completion:*' substitute 1
            zstyle ':completion:*' verbose true
            zstyle ':completion:*' rehash true
          '';

          zshConfig = ''
            # Add $HOME/bin to path
            path+=("''${HOME}/bin")

            # Prompt formatting and coloring
            function prompt_if_triggered {
                # $1: prompt_label
                # $2: prompt_value
                # $3: trigger
                if [[ -n $3 ]]
                then
                    echo "%B%F{blue}[$1: %F{magenta}$2%F{blue}] %f%b"
                fi
            }

            # Git prompt
            GIT_PS1_SHOWDIRTYSTATE=1 # * for unstaged and + for staged changes
            GIT_PS1_SHOWSTASHSTATE=1 # $ if something is stashed
            GIT_PS1_SHOWUNTRACKEDFILES=1 # % if there are untracked files
            GIT_PS1_SHOWUPSTREAM="auto"
            function git_prompt {
                local TRIGGER="$(__git_ps1 '%s')"
                local PROMPT="''${TRIGGER}"
                prompt_if_triggered 'git' "''${PROMPT}" "''${TRIGGER}"
            }
            GIT_PROMPT='$(git_prompt)'

            # Other prompt infos
            DATE_TIME='%B%F{yellow}(%D{%Y-%m-%d %H:%M:%S})%f%b '
            USER_HOST='%B%F{green}%n@%m%f%b '
            CURR_PATH='%B%F{red}[dir.: %~] >%f%b '
            NEWLINE=$'\n'

            # Set prompt
            setopt prompt_subst
            PROMPT="''${DATE_TIME}''${USER_HOST}''${GIT_PROMPT}''${NEWLINE}''${CURR_PATH}"
          '';

        in
          lib.mkMerge [zshConfigBeforeCompInit zshConfig];

        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
      };
    };
  };
}
