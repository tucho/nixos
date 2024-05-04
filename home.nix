{ config, pkgs, ...}:

{
  programs.home-manager.enable = true;
  home = {
    username = "marcel";
    homeDirectory = "/home/marcel";
    packages = with pkgs; [];
    stateVersion = "24.05";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/download";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/pictures";
    videos = "${config.home.homeDirectory}/videos";

    desktop = "${config.home.homeDirectory}/.desktop";
    publicShare = "${config.home.homeDirectory}/.public";
    templates = "${config.home.homeDirectory}/.templates";
  };

  xdg.enable = true;

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
          "^[[A"
          "^P"
        ];
        searchDownKey = [
          "^[[B"
          "^N"
        ];
      };

      shellAliases = {
        diff = "diff --color=always";
        grep = "grep --color=always --line-number";
        ip = "ip --color=always";
        ls = "ls --color=always --classify";
      };

      initExtraBeforeCompInit = ''
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

      initExtra = ''
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
        
        # Configure pinentry to use the correct TTY
        export GPG_TTY="$(tty)"
        gpg-connect-agent updatestartuptty /bye > /dev/null
      '';

      envExtra = ''
        # Emulate OpenSSH agent
        unset SSH_AGENT_PID
        if [ "''${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
           export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
        fi
      '';

      syntaxHighlighting.enable = true;
    };

    git = {
      enable = true;

      userName = "Marcel Campello";
      userEmail = "marcel.campello@prafrentex.com.br";

      aliases = {
        logm = "log --graph --pretty=format:'%C(yellow)%h %C(green)%an %C(cyan)%ci %C(bold yellow)%d %C(reset)%s'";
        logma = "log --graph --pretty=format:'%C(yellow)%h %C(green)%an %C(cyan)%ci %C(bold yellow)%d %C(reset)%s' --all";
      };

      extraConfig = {
        core = {
          whitespace = "warn,tab-in-indent";
          editor = "emacsclient -nw";
        };
        init = {
          defaultBranch = "main";
        };
        status = {
          showUntrackedFiles = "all";
        };
        commit = {
          gpgSign = true;
        };
        pull = {
          ff = "only";
        };
        push = {
          default = "simple";
        };
        merge = {
          conflictStyle = "diff3";
        };
        diff = {
          algorithm = "histogram";
        };
        submodule = {
          recurse = true;
        };
        color = {
          ui = "auto";
        };
        "color \"branch\"" = {
          current = "yellow reverse";
          local = "yellow";
          remote = "green";
        };
        "color \"diff\"" = {
          meta = "yellow bold";
          frag = "magenta bold";
          old = "red bold";
          new = "green bold";
          whitespace = "red reverse";
        };
        "color \"status\"" = {
          added = "yellow";
          changed = "green";
          untracked = "cyan";
        };
      };
    };

    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
      settings = {
        # Get rid of the copyright notice
        no-greeting = true;

        # Disable inclusion of the version string in ASCII armored output
        no-emit-version = true;

        # Disable comment string in clear text signatures and ASCII armored messages
        no-comments = true;

        # Display long key IDs
        keyid-format =  "long";

        # List keys and subkeys along with their fingerprints and keygrips
        with-fingerprint = true;
        with-subkey-fingerprint = true;
        with-keygrip = true;

        # Displays the validity of the keys
        list-options = "show-uid-validity";
        verify-options = "show-uid-validity";
      };
    };
  };
}
