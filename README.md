# Neovim Configuration

This is my custom Neovim configuration, designed to improve productivity and provide a smooth development experience. It utilizes to manage configurations, key mappings, and plugins, ensuring a clean and efficient setup.

Starup time: **~100ms**

## Get the latest version of Neovim
```sh
cd /tmp # Go to your /tmp directory
wget https://github.com/neovim/neovim/release/latest/download/nvim-linux64.tar.gz # Grab the latest version (linux64)
tar xvf nvim-linux64.tar.gz # untar the downloaded file
cd nvim-linux64 # change directory into the unpacked directory
cp -r ./* $HOME/.local/ # Copy the unpacked content to your `~/.local` directory (bin/, lib/ and share/)
cd & rm -rf /tmp/neovim # Clean up
```
**If you can't invoke `nvim` after this process, make sure your `~/.local/bin` is in yout `$PATH`**
```sh
echo $PATH # Checks your path
export "$PATH"="$PATH:/home/$USER/.local/bin" # Add the ~/.local/bin dir to $PATH if it didn't show in the last command
```
(`printenv` to list all your environment variables or see ['PATH environment variable'](https://www.ibm.com/docs/ro/aix/7.1?topic=accounts-path-environment-variable) for more.)

## Features

```key
# list keymappings
<space>km
```

- **Modular Configuration**: The configuration is broken down into separate files for ease of management. Each file handles specific aspects of Neovim's functionality:
  - `init`: Main configuration entry point.
  - `keymaps`: Documented xustom key mappings for enhanced navigation and functionality - see all with `<space>km`
  - `sane`: General sane defaults and options to improve the usability of Neovim.
  - `highlightonyank`: Custom highlight on yank feature.
  - `undercurl`: Custom undercurl styling for a unique visual touch.

- **Plugin Management with `lazy.nvim`**: The configuration uses `lazy.nvim` for managing plugins, ensuring a fast and efficient way to keep plugins updated and installed:
  - `auto-pairs`: Automatic pair management for parentheses, brackets, quotes, etc.
  - `cmp`: Configurations for `cmp` (completion plugin) with support for LSP and snippets.
  - `copilot-cmp` and `copilot`: Integrations for `copilot.vim`, enhancing coding with AI-assisted suggestions.
  - `fidget`: Statusline spinner for LSP to indicate completion and status of language servers.
  - `nvim-tree`: Setup for file explorer `nvim-tree`.
  - `oil`: File explorer designed to be less intrusive than `nvim-tree`.
  - `rooter`: Project root finder for quick navigation across different projects.
  - `snacks`: Various utility functions for everyday editing tasks.
  - `snippets`: Includes a collection of useful snippets for various programming languages.
  - `telescope`: Setup for `telescope.nvim`, a powerful fuzzy finder for files, buffers, and more.
  - `todo-comments`: Highlight and manage TODO comments within your code.
  - `treesitter`: Treesitter configurations for syntax highlighting, folding, and incremental selection.
  - `undotree`: Undo history viewer that allows easy visualization and restoration of changes.
  - `vim-tmux-navigator`: Seamlessly navigate between Neovim and Tmux panes.
  - `which-key`: displaying possible mappings for a keypress in a popup.

- **Coding Enhancements**:
  - LSP support for multiple languages and linters.
  - Auto-completion with `cmp` and `copilot` for efficient coding.
  - Fuzzy finding with `telescope.nvim` for quick file and buffer access.
  - Undo history visualization with `undotree.nvim`.

- **Customization**:
  - `highlightonyank`: Custom highlight on yank feature to improve visual feedback.
  - `undercurl`: Customize undercurl styling for a distinct look.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
   ```

2. Open Nvim and install packages with Lazy
Lazy should open by itself after pulling the repo, but if 
    ```sh
    nvim +Lazy install
    ```

## Directory Structure
- `lua/config/`: Contains the main configuration and settings.
- `lua/custom/`: Custom configurations that are not part of default settings.
- `lua/plugins/`: Specific setups for each plugin.
- `lua/vimisms/`: Custom Vim templates and utilities.

### Examples
**Skeleton Files:**
- `skeletons/blog-post.md`: Template for markdown files created in my local blog directory
- `skeletons/html.html`: Boilerplate HTML5 for when creating files ending with .htm and .html
- `skeletons/platformio.ini`: Boilerplate template for PIO projects
- `skeletons/python.py`: Python file boilerplate template.
- `skeletons/react.tsx`: React file boilerplate template.
- `skeletons/script.sh`: Shell script boilerplate template.
- `skeletons/shell.nix`: Shell.nix file boilerplate template.

This configuration is optimized for a productive coding experience and is easily extendable with new plugins and features.
