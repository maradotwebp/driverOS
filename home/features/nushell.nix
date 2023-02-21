{ pkgs, osConfig, ... }:
{
  imports = [
    ../../modules/home/events.nix
  ];

  # Launch Nushell when a shell is requested
  scripts."default-shell" = "${pkgs.nushell}/bin/nu";

  # Config
  programs.nushell.enable = true;

  programs.nushell.configFile.text = with osConfig.theme.colors; ''
    let dark_theme = {
      separator: white
      leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
      header: white
      empty: white
      bool: light_blue
      int: blue
      filesize: purple
      duration: purple
      date: light_blue
      range: green
      float: blue
      string: light_red
      nothing: white
      binary: white
      cellpath: white
      row_index: white_italic
      record: green
      list: green
      block: yellow
      hints: "${zinc."500".hex}"
      shape_and: white
      shape_binary: white
      shape_block: yellow
      shape_bool: light_blue
      shape_custom: white
      shape_datetime: light_blue
      shape_directory: white
      shape_external: white
      shape_externalarg: white
      shape_filepath: white
      shape_flag: white_italic
      shape_float: blue
      shape_garbage: red_reverse
      shape_globpattern: red
      shape_int: blue
      shape_internalcall: white
      shape_list: green
      shape_literal: blue
      shape_matching_brackets: white
      shape_nothing: white
      shape_operator: white
      shape_or: white
      shape_pipe: white
      shape_range: green
      shape_record: green
      shape_redirection: white
      shape_signature: white
      shape_string: white
      shape_string_interpolation: yellow
      shape_table: green
      shape_variable: green
    }

    let carapace_completer = {|spans|
      ${pkgs.carapace}/bin/carapace $spans.0 nushell $spans | from json
    }

    # The default config record. This is where much of your global configuration is setup.
    let-env config = {
      ls: {
        use_ls_colors: false # use the LS_COLORS environment variable to colorize output
        clickable_links: true # enable or disable clickable links. Your terminal has to support links.
      }
      rm: {
        always_trash: false # always act as if -t was given. Can be overridden with -p
      }
      cd: {
        abbreviations: false # allows `cd s/o/f` to expand to `cd some/other/folder`
      }
      table: {
        mode: light # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
        index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
        trim: {
          methodology: wrapping # wrapping or truncating
          wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
          truncating_suffix: "..." # A suffix used by the 'truncating' methodology
        }
      }

      history: {
        max_size: 10000 # Session has to be reloaded for this to take effect
        sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
        file_format: "plaintext" # "sqlite" or "plaintext"
      }
      completions: {
        case_sensitive: false # set to true to enable case-sensitive completions
        quick: true  # set this to false to prevent auto-selecting completions when only one remains
        partial: true  # set this to false to prevent partial filling of the prompt
        algorithm: "prefix"  # prefix or fuzzy
        external: {
          enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up my be very slow
          max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
          completer: $carapace_completer # check 'carapace_completer' above as an example
        }
      }
      filesize: {
        metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
        format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
      }
      cursor_shape: {
        emacs: line # block, underscore, line (line is the default)
        vi_insert: block # block, underscore, line (block is the default)
        vi_normal: underscore # block, underscore, line  (underscore is the default)
      }
      color_config: $dark_theme   # if you want a light theme, replace `$dark_theme` to `$light_theme`
      use_grid_icons: true
      footer_mode: "25" # always, never, number_of_rows, auto
      float_precision: 2
      # buffer_editor: "emacs" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
      use_ansi_coloring: true
      edit_mode: emacs # emacs, vi
      shell_integration: true # enables terminal markers and a workaround to arrow keys stop working issue
      show_banner: false # true or false to enable or disable the banner
      render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.

      hooks: {
        pre_prompt: [{
          null  # replace with source code to run before the prompt is shown
        }]
        pre_execution: [{
          null  # replace with source code to run before the repl input is run
        }]
        env_change: {
          PWD: [{|before, after|
            null  # replace with source code to run if the PWD environment is different since the last repl input
          }]
        }
        display_output: {
          if (term size).columns >= 100 { table -e } else { table }
        }
      }
      menus: [
        {
          name: completion_menu
          only_buffer_difference: false
          marker: "| "
          type: {
              layout: columnar
              columns: 4
              col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
              col_padding: 2
          }
          style: {
              text: light_red
              selected_text: light_red_reverse
              description_text: white_italic
          }
        }
        {
          name: history_menu
          only_buffer_difference: true
          marker: "? "
          type: {
              layout: list
              page_size: 10
          }
          style: {
              text: light_red
              selected_text: light_red_reverse
              description_text: white_italic
          }
        }
      ]
      keybindings: [
        {
          name: completion_menu
          modifier: none
          keycode: tab
          mode: [emacs vi_normal vi_insert]
          event: {
            until: [
              { send: menu name: completion_menu }
              { send: menunext }
            ]
          }
        }
        {
          name: history_menu
          modifier: control
          keycode: char_r
          mode: emacs
          event: { send: menu name: history_menu }
        }
      ]
    }
  '';

  programs.nushell.envFile.text = ''
    # Nushell Environment Config File

    let-env ENV_CONVERSIONS = {
      "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand -n }
        to_string: { |v| $v | path expand -n | str join (char esep) }
      }
      "Path": {
        from_string: { |s| $s | split row (char esep) | path expand -n }
        to_string: { |v| $v | path expand -n | str join (char esep) }
      }
    }

    let-env NU_LIB_DIRS = [
        ($nu.config-path | path dirname | path join 'scripts')
    ]

    let-env NU_PLUGIN_DIRS = [
        ($nu.config-path | path dirname | path join 'plugins')
    ]

    # To add entries to PATH (on Windows you might use Path), you can use the following pattern:
    # let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
  '';
}