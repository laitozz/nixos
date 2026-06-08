{
  sw.searxng.nixos = { pkgs, config, lib, ... }: {
    services.searx = {
      enable = true;
			# Searx configuration
      settings = {

        # Instance settings
        general = {
          debug = false;
          instance_name = "SearXNG Instance";
          # donation_url = false;
          # contact_url = false;
          # privacypolicy_url = false;
          enable_metrics = false;
        };

        # User interface
        ui = {
          static_use_hash = true;
          default_locale = "en";
          query_in_title = true;
          infinite_scroll = true;
          center_alignment = true;
          default_theme = "simple";
          theme_args.simple_style = "dark";
          search_on_category_select = false;
          hotkeys = "vim";
        };

        # Search engine settings
        search = {
          safe_search = 0;
          # autocomplete_min = 2;
          autocomplete = "google";
          # ban_time_on_fail = 5;
          # max_ban_time_on_fail = 120;
        };

        # Server configuration
        server = {
          base_url = "https://search.example.com";
          port = 8888;
          bind_address = "127.0.0.1";
          secret_key = config.sops.secrets.searx.path;
          limiter = false;
          public_instance = false;
          image_proxy = false;
          method = "GET";
        };

        # Search engines
        engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
          # Web
          "bing".disabled                = true;
          "brave".disabled               = true;
          "duckduckgo".disabled          = true;
          "google".disabled              = false;
          "mojeek".disabled              = true;
          "presearch".disabled           = true;
          "mwmbl".disabled               = false;
          "mwmbl".weight                 = 0.4;
          "qwant".disabled               = true;
          "startpage".disabled           = true;
          # General
          "crowdview".disabled           = true;
          "crowdview".weight             = 0.5;
          "curlie".disabled              = true;
          "ddg definitions".disabled     = false;
          "ddg definitions".weight       = 2;
          "wikibooks".disabled           = false;
          "wikidata".disabled            = false;
          "wikiquote".disabled           = true;
          "wikisource".disabled          = true;
          "wikispecies".disabled         = false;
          "wikispecies".weight           = 0.5;
          "wikiversity".disabled         = false;
          "wikiversity".weight           = 0.5;
          "wikivoyage".disabled          = false;
          "wikivoyage".weight            = 0.5;
          "currency".disabled            = true;
          "dictzone".disabled            = true;
          "lingva".disabled              = true;
          # Images
          "bing images".disabled         = false;
          "brave.images".disabled        = true;
          "duckduckgo images".disabled   = true;
          "google images".disabled       = false;
          "qwant images".disabled        = true;
          "1x".disabled                  = true;
          "artic".disabled               = false;
          "deviantart".disabled          = false;
          "flickr".disabled              = true;
          "imgur".disabled               = false;
          "library of congress".disabled = false;
          "material icons".disabled      = true;
          "material icons".weight        = 0.2;
          "openverse".disabled           = false;
          "pinterest".disabled           = true;
          "svgrepo".disabled             = false;
          "unsplash".disabled            = false;
          "wallhaven".disabled           = false;
          "wikicommons.images".disabled  = false;
          "yacy images".disabled         = true;
          # Videos
          "bing videos".disabled         = false;
          "brave.videos".disabled        = true;
          "duckduckgo videos".disabled   = true;
          "google videos".disabled       = false;
          "qwant videos".disabled        = false;
          "dailymotion".disabled         = true;
          "google play movies".disabled  = true;
          "invidious".disabled           = true;
          "odysee".disabled              = true;
          "peertube".disabled            = false;
          "piped".disabled               = true;
          "rumble".disabled              = false;
          "sepiasearch".disabled         = false;
          "vimeo".disabled               = true;
          "youtube".disabled             = false;
          "brave.news".disabled          = true;
          "google news".disabled         = true;
          # IT
          "nixos wiki".disabled          = false;
          "arch linux wiki".disabled     = false;
          "arch linux wiki".shortcut     = "aw";
          "hackenews".disabled           = false;

          # Files
          "1337x".disabled               = false;
          "pirate bay".disabled          = false;
          "apk mirror".disabled          = false;
          "fdroid".disabled              = false;
        };

			# Outgoing requests
      # outgoing = {
      #   request_timeout = 5.0;
      #   max_request_timeout = 15.0;
      #   pool_connections = 100;
      #   pool_maxsize = 15;
      #   enable_http2 = true;
      # };

        # Enabled plugins
        enabled_plugins = [
          "Basic Calculator"
          "Hash plugin"
          "Tor check"
          "Open Access DOI rewrite"
          "Hostnames"
          "Unit converter plugin"
          "Tracker URL remover"
        ];
      };
    };
  };
}
