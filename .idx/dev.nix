# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    # pkgs.go
    # pkgs.python311
    # pkgs.python311Packages.pip
    # pkgs.nodejs_20
    # pkgs.nodePackages.nodemon
    pkgs.bun
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "vscodevim.vim"
      "esbenp.prettier-vscode"
      "dbaeumer.vscode-eslint"
      "charliermarsh.ruff"
      "steoates.autoimport"
      "formulahendry.auto-close-tag"
      "emmanuelbeziat.vscode-great-icons"
      "tomi.xasnippets"
      "bradlc.vscode-tailwindcss"
    ];
    
    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["bun" "run" "dev"];
          manager = "web";
          cwd = "/home/user/z-lab/front-end";
          env = { PORT = "$PORT"; };
        };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
      };
    };
  };
}
