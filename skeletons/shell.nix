{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "PROJECT-js"; # Rename for each project
  
  buildInputs = [
    pkgs.bun # Add more / others
  ];

  shellHook = ''
    # Shell commands to execute when entering shell
    export PROJECT="$(basename $PWD)"
    export PATH="$PATH:$PWD/node_modules/.bin"
    export NPM_PACKAGES="$PWD/node_modules"
    export BROWSER="brave --enable-features=TouchpadOverscrollHistoryNavigation"
    tmux new-session -d -s "$PROJECT"
    tmux split-window -v -t "$PROJECT"
    tmux send-keys -t "$PROJECT":1.2 'git status' Enter
    tmux break-pane -t "$PROJECT":2
    tmux send-keys -t "$PROJECT":1.1 'nvim' Enter
    tmux attach-session -t "$PROJECT"
  '';
}
