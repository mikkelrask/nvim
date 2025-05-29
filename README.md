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
--- Startup times for process: Primary (or UI client) ---

times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.003  000.003: --- NVIM STARTING ---
000.187  000.184: event init
000.334  000.147: early init
000.403  000.069: locale set
000.467  000.064: init first window
000.965  000.498: inits 1
000.980  000.015: window checked
000.983  000.003: parsing arguments
001.696  000.057  000.057: require('vim.shared')
001.822  000.052  000.052: require('vim.inspect')
001.888  000.054  000.054: require('vim._options')
001.893  000.192  000.087: require('vim._editor')
001.894  000.290  000.041: require('vim._init_packages')
001.897  000.623: init lua interpreter
006.019  004.123: nvim_ui_attach
006.686  000.667: nvim_set_client_info
006.691  000.004: --- NVIM STARTED ---

--- Startup times for process: Embedded ---

times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.004  000.004: --- NVIM STARTING ---
000.197  000.193: event init
000.331  000.134: early init
000.425  000.094: locale set
000.520  000.095: init first window
001.394  000.874: inits 1
001.434  000.040: window checked
001.440  000.007: parsing arguments
002.330  000.075  000.075: require('vim.shared')
002.496  000.069  000.069: require('vim.inspect')
002.582  000.070  000.070: require('vim._options')
002.588  000.253  000.114: require('vim._editor')
002.591  000.369  000.041: require('vim._init_packages')
002.595  000.785: init lua interpreter
002.708  000.113: expanding arguments
002.749  000.041: inits 2
003.160  000.411: init highlight
003.164  000.004: waiting for UI
003.362  000.198: done waiting for UI
003.368  000.006: clear screen
003.643  000.061  000.061: require('vim.keymap')
005.306  000.239  000.239: sourcing nvim_exec2()
005.481  002.106  001.806: require('vim._defaults')
005.484  000.010: init default mappings & autocommands
010.083  000.060  000.060: sourcing /home/mr/.local/share/nvim/runtime/ftplugin.vim
010.155  000.026  000.026: sourcing /home/mr/.local/share/nvim/runtime/indent.vim
012.168  000.863  000.863: require('config.keymaps')
012.520  000.347  000.347: require('config.sane')
017.411  004.733  004.733: require('lazy')
017.497  000.024  000.024: require('ffi')
017.578  000.037  000.037: require('vim.fs')
017.740  000.156  000.156: require('vim.uri')
017.764  000.261  000.068: require('vim.loader')
017.967  000.179  000.179: require('lazy.stats')
018.145  000.153  000.153: require('lazy.core.util')
018.302  000.153  000.153: require('lazy.core.config')
018.570  000.134  000.134: require('lazy.core.handler')
019.032  000.183  000.183: require('lazy.pkg')
019.038  000.330  000.147: require('lazy.core.meta')
019.053  000.479  000.149: require('lazy.core.plugin')
019.061  000.756  000.142: require('lazy.core.loader')
019.407  000.146  000.146: require('lazy.core.fragments')
024.247  000.173  000.173: require('lazy.core.handler.event')
024.259  000.349  000.176: require('lazy.core.handler.ft')
024.391  000.119  000.119: require('lazy.core.handler.cmd')
024.547  000.117  000.117: require('lazy.core.handler.keys')
026.301  000.141  000.141: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/runtime/filetype.lua:0
026.306  000.238  000.096: sourcing /home/mr/.local/share/nvim/runtime/filetype.lua
026.310  000.283  000.046: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
026.363  000.005  000.005: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
027.189  000.493  000.493: require('snacks')
027.194  000.549  000.056: sourcing /home/mr/.local/share/nvim/lazy/snacks.nvim/plugin/snacks.lua
027.199  000.584  000.035: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
027.219  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
027.234  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
027.421  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
027.432  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
028.610  000.538  000.538: require('vim.lsp.log')
029.132  000.511  000.511: require('vim.lsp.protocol')
029.382  000.245  000.245: require('vim.lsp.util')
029.553  000.046  000.046: require('vim.lsp.sync')
029.559  000.173  000.127: require('vim.lsp._changetracking')
029.673  000.051  000.051: require('vim.lsp._transport')
029.689  000.127  000.076: require('vim.lsp.rpc')
029.754  002.035  000.441: require('vim.lsp')
030.145  000.388  000.388: require('lspconfig.util')
030.243  000.088  000.088: require('vim.version')
032.372  004.757  002.246: sourcing /home/mr/.local/share/nvim/lazy/nvim-lspconfig/plugin/lspconfig.lua
032.383  004.797  000.040: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
032.398  000.006  000.006: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
032.413  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
032.669  000.051  000.051: require('lspconfig.async')
032.672  000.157  000.107: require('lspconfig.configs')
032.681  000.262  000.105: require('lspconfig')
032.809  000.078  000.078: require('vim.iter')
032.821  000.138  000.060: require('lspconfig.configs.lua_ls')
033.057  000.066  000.066: require('lspconfig.manager')
033.123  000.062  000.062: require('lspconfig.configs.ts_ls')
033.315  000.091  000.091: require('lspconfig.configs.pyright')
034.081  000.011  000.011: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
034.104  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
035.110  000.121  000.121: require('fidget.spinner.patterns')
035.116  000.238  000.116: require('fidget.spinner')
035.180  000.059  000.059: require('fidget.options')
035.226  000.505  000.208: require('fidget.progress.display')
035.408  000.099  000.099: require('fidget.logger')
035.817  000.200  000.200: require('vim.lsp.completion')
035.898  000.486  000.286: require('vim.lsp.handlers')
035.914  000.685  000.100: require('fidget.progress.lsp')
036.380  000.178  000.178: require('fidget.poll')
036.394  000.309  000.131: require('fidget.notification.model')
037.062  000.665  000.665: require('fidget.notification.window')
037.666  000.593  000.593: require('fidget.notification.view')
037.759  001.762  000.195: require('fidget.notification')
037.782  001.865  000.103: require('fidget.progress.handle')
037.951  003.340  000.285: require('fidget.progress')
038.478  000.522  000.522: require('fidget.commands')
038.650  000.050  000.050: require('fidget.integration.nvim-tree')
038.736  000.083  000.083: require('fidget.integration.xcodebuild-nvim')
038.742  000.258  000.124: require('fidget.integration')
038.776  004.483  000.362: require('fidget')
039.529  000.046  000.046: sourcing /home/mr/.local/share/nvim/lazy/nvim-web-devicons/plugin/nvim-web-devicons.vim
039.536  000.097  000.051: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
039.547  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
039.577  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
039.591  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
039.604  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
040.110  000.061  000.061: require('nvim-tree.log')
040.322  000.046  000.046: require('nvim-tree.notify')
040.329  000.119  000.073: require('nvim-tree.events')
040.465  000.049  000.049: require('nvim-tree.iterators.node-iterator')
040.500  000.170  000.120: require('nvim-tree.utils')
040.514  000.399  000.111: require('nvim-tree.view')
040.708  000.036  000.036: require('nvim-tree.core')
040.793  000.040  000.040: require('nvim-tree.git.utils')
040.829  000.034  000.034: require('nvim-tree.renderer.components.devicons')
040.900  000.030  000.030: require('nvim-tree.classic')
040.906  000.074  000.044: require('nvim-tree.node')
040.911  000.200  000.052: require('nvim-tree.node.directory')
040.913  000.302  000.066: require('nvim-tree.actions.finders.find-file')
040.973  000.059  000.059: require('nvim-tree.actions.finders.search-node')
040.976  000.410  000.049: require('nvim-tree.actions.finders')
041.190  000.082  000.082: require('nvim-tree.node.file')
041.194  000.144  000.061: require('nvim-tree.actions.fs.create-file')
041.274  000.037  000.037: require('nvim-tree.lib')
041.403  000.093  000.093: require('nvim-tree.node.link')
041.441  000.165  000.072: require('nvim-tree.node.directory-link')
041.445  000.250  000.048: require('nvim-tree.actions.fs.remove-file')
041.525  000.078  000.078: require('nvim-tree.actions.fs.rename-file')
041.590  000.062  000.062: require('nvim-tree.actions.fs.trash')
041.592  000.614  000.081: require('nvim-tree.actions.fs')
041.705  000.039  000.039: require('nvim-tree.diagnostics')
041.709  000.077  000.038: require('nvim-tree.actions.moves.item')
041.770  000.035  000.035: require('nvim-tree.actions.moves.parent')
041.804  000.031  000.031: require('nvim-tree.actions.moves.sibling')
041.806  000.212  000.068: require('nvim-tree.actions.moves')
041.935  000.044  000.044: require('nvim-tree.actions.node.file-popup')
041.993  000.055  000.055: require('nvim-tree.actions.node.open-file')
042.028  000.033  000.033: require('nvim-tree.actions.node.run-command')
042.065  000.036  000.036: require('nvim-tree.actions.node.system-open')
042.100  000.032  000.032: require('nvim-tree.actions.node.buffer')
042.102  000.295  000.095: require('nvim-tree.actions.node')
042.204  000.037  000.037: require('nvim-tree.actions.root.change-dir')
042.237  000.031  000.031: require('nvim-tree.actions.root.dir-up')
042.240  000.136  000.068: require('nvim-tree.actions.root')
042.308  000.032  000.032: require('nvim-tree.actions.tree.find-file')
042.377  000.034  000.034: require('nvim-tree.actions.tree.modifiers.collapse-all')
042.438  000.059  000.059: require('nvim-tree.actions.tree.modifiers.expand-all')
042.441  000.131  000.038: require('nvim-tree.actions.tree.modifiers')
042.489  000.047  000.047: require('nvim-tree.actions.tree.open')
042.531  000.039  000.039: require('nvim-tree.actions.tree.toggle')
042.570  000.038  000.038: require('nvim-tree.actions.tree.resize')
042.573  000.332  000.044: require('nvim-tree.actions.tree')
042.574  002.058  000.060: require('nvim-tree.actions')
042.793  000.007  000.007: require('vim.F')
042.900  000.315  000.308: require('vim.diagnostic')
043.226  003.598  000.764: require('nvim-tree')
043.325  000.083  000.083: require('nvim-tree.legacy')
043.444  000.069  000.069: require('vim.health')
043.447  000.115  000.047: require('vim.deprecated.health')
045.904  000.817  000.817: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
045.946  000.030  000.030: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
046.115  000.134  000.134: require('nvim-tree.keymap')
046.305  000.186  000.186: require('nvim-tree.appearance')
046.940  000.102  000.102: require('nvim-tree.buffers')
047.152  000.115  000.115: require('nvim-tree.git.runner')
047.256  000.101  000.101: require('nvim-tree.watcher')
047.267  000.323  000.107: require('nvim-tree.git')
047.418  000.093  000.093: require('nvim-tree.node.file-link')
047.421  000.152  000.059: require('nvim-tree.node.factory')
047.519  000.096  000.096: require('nvim-tree.node.root')
047.656  000.060  000.060: require('nvim-tree.enum')
047.664  000.142  000.082: require('nvim-tree.explorer.filters')
047.787  000.122  000.122: require('nvim-tree.marks')
047.895  000.106  000.106: require('nvim-tree.explorer.live-filter')
048.067  000.169  000.169: require('nvim-tree.explorer.sorter')
048.422  000.352  000.352: require('nvim-tree.actions.fs.clipboard')
049.161  000.046  000.046: require('nvim-tree.renderer.decorator')
049.207  000.297  000.252: require('nvim-tree.renderer.decorator.bookmarks')
049.258  000.049  000.049: require('nvim-tree.renderer.decorator.copied')
049.298  000.038  000.038: require('nvim-tree.renderer.decorator.cut')
049.344  000.044  000.044: require('nvim-tree.renderer.decorator.diagnostics')
049.401  000.055  000.055: require('nvim-tree.renderer.decorator.git')
049.442  000.038  000.038: require('nvim-tree.renderer.decorator.hidden')
049.495  000.051  000.051: require('nvim-tree.renderer.decorator.modified')
049.547  000.050  000.050: require('nvim-tree.renderer.decorator.opened')
049.615  000.065  000.065: require('nvim-tree.renderer.decorator.user')
049.667  000.050  000.050: require('nvim-tree.renderer.components.padding')
049.676  001.050  000.312: require('nvim-tree.renderer.builder')
049.683  001.259  000.209: require('nvim-tree.renderer')
049.702  003.010  000.187: require('nvim-tree.explorer')
049.752  000.048  000.048: require('nvim-tree.explorer.watch')
049.846  000.047  000.047: require('nvim-tree.renderer.components.full-name')
049.851  000.090  000.043: require('nvim-tree.renderer.components')
050.152  000.143  000.143: require('nvim-web-devicons.filetypes')
050.486  000.190  000.190: require('nvim-web-devicons.default.icons_by_filename')
051.151  000.660  000.660: require('nvim-web-devicons.default.icons_by_file_extension')
051.241  000.087  000.087: require('nvim-web-devicons.default.icons_by_operating_system')
051.286  000.042  000.042: require('nvim-web-devicons.default.icons_by_desktop_environment')
051.331  000.042  000.042: require('nvim-web-devicons.default.icons_by_window_manager')
051.333  001.102  000.080: require('nvim-web-devicons.icons-default')
051.612  001.756  000.512: require('nvim-web-devicons')
054.728  000.119  000.119: require('nvim-tree.help')
054.883  000.072  000.072: require('nvim-tree.appearance.hi-test')
054.924  000.189  000.118: require('nvim-tree.api')
055.091  000.087  000.087: require('nvim-tree.commands')
055.241  016.462  006.094: require('nvim-tree.api')
057.192  000.008  000.008: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
057.206  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
057.399  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
057.409  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
057.716  000.048  000.048: require('mcphub.utils.errors')
057.764  000.045  000.045: require('mcphub.utils.image_cache')
058.098  000.035  000.035: sourcing /home/mr/.local/share/nvim/lazy/plenary.nvim/plugin/plenary.vim
058.103  000.073  000.039: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
058.119  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
058.131  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
058.493  000.264  000.264: require('plenary.compat')
058.545  000.049  000.049: require('plenary.functional')
058.552  000.786  000.396: require('plenary.job')
058.839  000.043  000.043: require('mcphub.utils.constants')
058.893  000.051  000.051: require('mcphub.utils.log')
058.901  000.171  000.076: require('mcphub.state')
059.255  000.143  000.143: require('plenary.bit')
059.315  000.324  000.181: require('plenary.path')
059.326  000.424  000.099: require('plenary.curl')
059.457  000.130  000.130: require('mcphub.utils.handlers')
059.733  000.075  000.075: require('mcphub.native.utils.request')
059.831  000.095  000.095: require('mcphub.native.utils.response')
059.899  000.065  000.065: require('mcphub.native.neovim.utils.buffer')
059.908  000.371  000.136: require('mcphub.native.utils.server')
060.205  000.127  000.127: require('mcphub.utils.version')
060.210  000.300  000.173: require('mcphub.utils.validation')
060.215  000.755  000.084: require('mcphub.native')
060.402  000.186  000.186: require('mcphub.utils.prompt')
060.828  000.068  000.068: require('mcphub.utils.nuitext')
060.833  000.158  000.090: require('mcphub.utils.nuiline')
061.043  000.100  000.100: require('mcphub.utils.highlights')
061.063  000.228  000.127: require('mcphub.utils.text')
061.343  000.060  000.060: require('plenary.tbl')
061.348  000.116  000.057: require('plenary.vararg.rotate')
061.350  000.169  000.053: require('plenary.vararg')
061.404  000.052  000.052: require('plenary.errors')
061.409  000.284  000.062: require('plenary.async.async')
061.646  000.061  000.061: require('plenary.async.structs')
061.656  000.141  000.080: require('plenary.async.control')
061.662  000.204  000.063: require('plenary.async.util')
061.665  000.254  000.050: require('plenary.async.tests')
061.667  000.602  000.065: require('plenary.async')
061.672  001.131  000.143: require('mcphub.utils.ui')
061.678  001.274  000.142: require('mcphub.utils')
061.701  003.147  000.209: require('mcphub.hub')
061.706  004.282  000.257: require('mcphub')
061.788  000.077  000.077: require('mcphub.config')
061.957  000.146  000.146: require('mcphub.ui')
062.503  000.112  000.112: require('mcphub.ui.capabilities')
062.947  000.346  000.346: require('mcphub.utils.renderer')
063.106  000.599  000.253: require('mcphub.ui.views.base')
063.143  000.930  000.220: require('mcphub.ui.views.main')
063.333  000.177  000.177: require('mcphub.ui.views.logs')
063.573  000.211  000.211: require('mcphub.ui.views.help')
063.795  000.192  000.192: require('mcphub.ui.views.config')
064.639  000.408  000.408: require('mcphub.utils.installers')
064.648  000.846  000.439: require('mcphub.ui.views.marketplace')
064.848  000.058  000.058: require('mcphub.native.neovim.terminal')
064.942  000.050  000.050: require('mcphub.native.neovim.files.buffer')
065.029  000.036  000.036: require('mcphub.native.neovim.utils.os')
065.032  000.087  000.051: require('mcphub.native.neovim.files.environment')
065.079  000.046  000.046: require('mcphub.native.neovim.files.operations')
065.135  000.053  000.053: require('mcphub.native.neovim.files.replace')
069.435  004.256  004.256: require('plenary.scandir')
069.446  004.310  000.054: require('mcphub.native.neovim.files.search')
069.561  000.111  000.111: require('mcphub.native.neovim.files.write')
069.612  004.761  000.104: require('mcphub.native.neovim.files')
069.734  000.052  000.052: require('mcphub.native.neovim.utils.lsp')
069.743  000.128  000.076: require('mcphub.native.neovim.lsp')
069.800  000.054  000.054: require('mcphub.native.neovim.prompts')
069.804  005.087  000.085: require('mcphub.native.neovim')
070.017  000.120  000.120: require('mcphub.native.mcphub.guide')
070.031  000.225  000.105: require('mcphub.native.mcphub')
072.195  000.517  000.517: require('img-clip.debug')
072.543  000.338  000.338: require('img-clip.config')
072.733  000.184  000.184: require('img-clip.util')
073.101  000.099  000.099: require('img-clip.clipboard')
073.292  000.104  000.104: require('img-clip.fs')
073.302  000.198  000.094: require('img-clip.markup')
073.313  000.479  000.182: require('img-clip.paste')
073.318  000.579  000.101: require('img-clip')
073.344  001.792  000.174: sourcing /home/mr/.local/share/nvim/lazy/img-clip.nvim/plugin/img-clip.lua
073.358  001.889  000.097: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
073.384  000.009  000.009: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
073.407  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
073.922  000.095  000.095: sourcing /home/mr/.local/share/nvim/lazy/fzf-lua/plugin/fzf-lua.lua
073.940  000.159  000.064: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
073.956  000.005  000.005: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
073.970  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
075.017  000.307  000.307: require('fzf-lua.utils')
075.320  000.171  000.171: require('fzf-lua.lib.base64')
075.558  000.234  000.234: require('fzf-lua.lib.serpent')
075.564  000.541  000.136: require('fzf-lua.libuv')
075.577  001.031  000.183: require('fzf-lua.path')
075.915  000.171  000.171: require('fzf-lua.actions')
076.109  000.061  000.061: require('fzf-lua.class')
076.238  000.321  000.260: require('fzf-lua.devicons')
076.672  000.074  000.074: require('fzf-lua.previewer')
077.262  001.014  000.940: require('fzf-lua.defaults')
077.277  001.698  000.192: require('fzf-lua.config')
077.419  000.028  000.028: sourcing /home/mr/.local/share/nvim/lazy/fzf-lua/autoload/fzf_lua.vim
077.424  000.071  000.043: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
078.109  000.310  000.310: require('fzf-lua.win')
078.359  000.061  000.061: require('fzf-lua.fzf')
078.431  000.069  000.069: require('fzf-lua.shell')
078.527  000.093  000.093: require('fzf-lua.make_entry')
078.543  000.428  000.205: require('fzf-lua.core')
078.597  004.611  001.073: require('fzf-lua')
079.999  000.007  000.007: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
080.012  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
080.236  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
080.249  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
080.591  000.275  000.275: sourcing /home/mr/.local/share/nvim/lazy/telescope.nvim/plugin/telescope.lua
080.598  000.314  000.039: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
080.606  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
080.621  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
080.980  000.354  000.354: require('telescope.builtin')
081.190  000.066  000.066: require('telescope._extensions')
081.196  001.694  000.943: require('telescope')
081.393  000.005  000.005: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
081.427  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
081.893  000.461  000.461: require('mini.statusline')
082.416  000.518  000.518: require('mini.map')
082.571  000.150  000.150: require('mini.sessions')
084.493  003.294  002.158: require('mini.diff')
084.545  005.108  000.120: require('codecompanion.providers')
085.116  005.897  000.788: require('codecompanion.config')
086.072  000.374  000.374: require('cmp.utils.api')
086.221  000.069  000.069: require('cmp.types.cmp')
086.435  000.119  000.119: require('cmp.utils.misc')
086.457  000.233  000.114: require('cmp.types.lsp')
086.514  000.054  000.054: require('cmp.types.vim')
086.517  000.439  000.084: require('cmp.types')
087.289  000.771  000.771: require('cmp.utils.highlight')
087.571  000.085  000.085: require('cmp.utils.debug')
087.583  000.289  000.204: require('cmp.utils.autocmd')
087.954  000.031  000.031: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/nvim-cmp/plugin/cmp.lua:0
087.959  002.351  000.448: sourcing /home/mr/.local/share/nvim/lazy/nvim-cmp/plugin/cmp.lua
087.964  002.395  000.044: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
087.973  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
087.991  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua:0
088.498  000.114  000.114: require('cmp.utils.char')
088.507  000.224  000.110: require('cmp.utils.str')
088.741  000.071  000.071: require('cmp.utils.buffer')
088.759  000.183  000.112: require('cmp.utils.keymap')
088.762  000.253  000.070: require('cmp.utils.feedkeys')
089.199  000.142  000.142: require('cmp.config.mapping')
089.291  000.063  000.063: require('cmp.utils.cache')
089.478  000.105  000.105: require('cmp.config.compare')
089.481  000.186  000.082: require('cmp.config.default')
089.510  000.670  000.279: require('cmp.config')
089.531  000.768  000.098: require('cmp.utils.async')
089.663  000.054  000.054: require('cmp.utils.pattern')
089.669  000.136  000.082: require('cmp.context')
090.135  000.236  000.236: require('cmp.utils.snippet')
090.208  000.069  000.069: require('cmp.matcher')
090.225  000.459  000.154: require('cmp.entry')
090.235  000.564  000.105: require('cmp.source')
090.399  000.072  000.072: require('cmp.utils.event')
090.624  000.064  000.064: require('cmp.utils.options')
090.630  000.160  000.096: require('cmp.utils.window')
090.633  000.231  000.071: require('cmp.view.docs_view')
090.787  000.153  000.153: require('cmp.view.custom_entries_view')
090.934  000.144  000.144: require('cmp.view.wildmenu_entries_view')
091.020  000.084  000.084: require('cmp.view.native_entries_view')
091.113  000.090  000.090: require('cmp.view.ghost_text_view')
091.128  000.890  000.117: require('cmp.view')
091.970  003.851  001.015: require('cmp.core')
092.174  000.075  000.075: require('cmp.config.sources')
092.234  000.056  000.056: require('cmp.config.window')
092.492  007.244  000.863: require('cmp')
092.986  000.182  000.182: require('codecompanion.providers.completion.cmp.models')
094.381  000.951  000.951: require('codecompanion.utils.log')
094.395  001.152  000.201: require('codecompanion.strategies.chat.slash_commands')
095.476  000.571  000.571: require('codecompanion.adapters')
095.499  000.901  000.329: require('codecompanion.strategies')
095.503  001.106  000.205: require('codecompanion.providers.completion')
095.516  002.423  000.165: require('codecompanion.providers.completion.cmp.slash_commands')
095.825  000.183  000.183: require('codecompanion.providers.completion.cmp.tools')
096.116  000.224  000.224: require('codecompanion.providers.completion.cmp.variables')
096.769  000.060  000.060: require('vim.treesitter.language')
096.822  000.047  000.047: require('vim.func')
096.882  000.054  000.054: require('vim.func._memoize')
096.991  000.380  000.219: require('vim.treesitter.query')
097.066  000.069  000.069: require('vim.treesitter._range')
097.095  000.607  000.158: require('vim.treesitter.languagetree')
097.105  000.847  000.240: require('vim.treesitter')
097.113  017.976  000.977: sourcing /home/mr/.local/share/nvim/lazy/codecompanion.nvim/plugin/codecompanion.lua
097.122  018.023  000.047: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
097.140  000.007  000.007: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
097.157  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
097.391  000.066  000.066: require('codecompanion._extensions')
097.465  000.069  000.069: require('codecompanion.utils.context')
097.480  000.245  000.110: require('codecompanion')
097.925  000.080  000.080: require('codecompanion.utils.adapters')
098.154  000.205  000.205: require('codecompanion.commands')
099.102  000.067  000.067: require('mcphub.extensions.shared')
099.109  000.163  000.097: require('mcphub.extensions.codecompanion.utils')
099.113  000.282  000.119: require('mcphub.extensions.codecompanion')
099.251  000.039  000.039: require('codecompanion._extensions.history.log')
099.298  000.045  000.045: require('codecompanion._extensions.history.pickers')
099.309  000.170  000.086: require('codecompanion._extensions.history')
099.429  000.044  000.044: require('codecompanion._extensions.history.utils')
099.435  000.117  000.074: require('codecompanion._extensions.history.storage')
099.655  000.056  000.056: require('codecompanion.utils')
099.660  000.118  000.062: require('codecompanion.http')
099.707  000.045  000.045: require('codecompanion.schema')
099.710  000.214  000.051: require('codecompanion._extensions.history.title_generator')
099.780  000.068  000.068: require('codecompanion._extensions.history.ui')
100.052  000.011  000.011: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
100.068  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
100.997  000.509  000.509: sourcing /home/mr/.local/share/nvim/lazy/vim-sleuth/plugin/sleuth.vim
101.012  000.559  000.050: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
101.034  000.004  000.004: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
101.064  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
101.696  000.010  000.010: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
101.715  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
102.492  000.050  000.050: require('nvim-autopairs._log')
102.556  000.058  000.058: require('nvim-autopairs.utils')
102.719  000.064  000.064: require('nvim-autopairs.conds')
102.727  000.120  000.055: require('nvim-autopairs.rule')
102.731  000.172  000.053: require('nvim-autopairs.rules.basic')
102.744  001.021  000.741: require('nvim-autopairs')
104.700  000.584  000.584: sourcing /home/mr/.local/share/nvim/lazy/undotree/plugin/undotree.vim
104.740  000.704  000.120: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
104.803  000.013  000.013: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
104.883  000.007  000.007: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
106.077  000.030  000.030: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
106.172  000.006  000.006: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
106.888  000.008  000.008: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
106.919  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
108.301  001.281  001.281: require('overseer')
110.500  000.009  000.009: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
110.550  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
110.858  000.004  000.004: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
110.869  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
111.169  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
111.179  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
111.488  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
111.498  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
111.767  000.159  000.159: sourcing /home/mr/.local/share/nvim/lazy/nvim-dap/plugin/dap.lua
111.774  000.201  000.042: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
111.796  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
111.808  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
112.403  000.066  000.066: require('dap.utils')
112.562  000.748  000.682: require('dap')
112.633  000.068  000.068: require('dap-ruby')
112.786  000.084  000.084: require('dap-python')
112.863  000.051  000.051: require('dap.log')
113.030  000.116  000.116: require('nvim-dap-virtual-text')
113.071  000.022  000.022: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
113.109  000.032  000.032: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
113.452  000.006  000.006: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
113.465  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
113.986  000.428  000.428: require('nio.tasks')
114.042  000.049  000.049: require('nio.control')
114.240  000.195  000.195: require('nio.uv')
114.315  000.072  000.072: require('nio.tests')
114.401  000.045  000.045: require('vim.ui')
114.407  000.089  000.045: require('nio.ui')
114.480  000.038  000.038: require('nio.streams')
114.483  000.074  000.036: require('nio.file')
114.597  000.034  000.034: require('nio.util')
114.643  000.121  000.087: require('nio.logger')
114.649  000.165  000.044: require('nio.lsp')
114.691  000.040  000.040: require('nio.process')
114.699  001.466  000.345: require('nio')
115.016  000.025  000.025: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
115.021  000.097  000.072: require('dapui.config.highlights')
115.075  000.049  000.049: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
115.131  000.315  000.169: require('dapui.config')
115.139  000.379  000.064: require('dapui.util')
115.199  000.058  000.058: require('dapui.windows.layout')
115.204  000.502  000.065: require('dapui.windows')
115.254  000.048  000.048: require('dapui.controls')
115.261  002.122  000.106: require('dapui')
115.347  000.038  000.038: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
115.506  000.057  000.057: require('dapui.client.types')
115.510  000.121  000.065: require('dapui.client')
115.561  000.049  000.049: require('dap.breakpoints')
115.612  000.041  000.041: require('dapui.client.lib')
115.705  000.049  000.049: require('dapui.render.canvas')
115.707  000.086  000.037: require('dapui.elements.breakpoints')
115.767  000.043  000.043: require('dapui.components.breakpoints')
115.817  000.033  000.033: require('dapui.elements.repl')
115.852  000.032  000.032: require('dapui.elements.scopes')
115.900  000.037  000.037: require('dapui.components.scopes')
115.983  000.057  000.057: require('dapui.components.variables')
116.028  000.032  000.032: require('dapui.elements.stacks')
116.109  000.033  000.033: require('dapui.components.frames')
116.111  000.071  000.037: require('dapui.components.threads')
116.162  000.036  000.036: require('dapui.elements.watches')
116.235  000.063  000.063: require('dapui.components.watches')
116.294  000.044  000.044: require('dapui.elements.hover')
116.355  000.048  000.048: require('dapui.components.hover')
116.408  000.046  000.046: require('dapui.elements.console')
116.481  008.020  003.673: require('dap')
116.689  000.068  000.068: require('overseer.enum')
116.702  000.136  000.068: require('overseer.constants')
116.950  000.134  000.134: require('overseer.files')
117.177  000.472  000.337: require('overseer.log')
117.659  000.078  000.078: require('overseer.parser.lib')
117.761  000.096  000.096: require('overseer.template.vscode.variables')
117.782  000.389  000.215: require('overseer.template.vscode.problem_matcher')
117.843  000.059  000.059: require('overseer.template.vscode.vs_util')
117.850  000.668  000.220: require('overseer.template.vscode')
117.855  001.371  000.095: require('overseer.dap')
118.001  000.143  000.143: require('dap.ext.vscode')
118.076  000.071  000.071: require('overseer.json')
118.271  000.021  000.021: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
118.298  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
118.800  000.475  000.475: require('nvim-surround')
118.988  000.184  000.184: require('nvim-surround.config')
119.036  000.044  000.044: require('nvim-surround.input')
119.478  000.093  000.093: require('nvim-surround.buffer')
119.550  000.006  000.006: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
119.561  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
119.862  000.296  000.296: require('mini.test')
120.879  000.476  000.476: sourcing /home/mr/.local/share/nvim/lazy/vim-surround/plugin/surround.vim
120.890  000.525  000.049: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
120.905  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
120.941  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
121.553  000.015  000.015: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
121.576  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
122.734  000.005  000.005: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
122.748  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
123.789  000.993  000.993: require('mini.icons')
123.888  000.006  000.006: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
123.903  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
124.530  000.587  000.587: require('oil')
124.585  000.051  000.051: require('oil.ringbuf')
124.677  000.088  000.088: require('oil.config')
126.749  001.860  001.860: require('vim.filetype')
127.585  000.118  000.118: require('oil.log')
127.605  000.278  000.161: require('oil.fs')
127.891  000.107  000.107: require('oil.constants')
127.926  000.318  000.211: require('oil.util')
128.198  000.106  000.106: sourcing /home/mr/.local/share/nvim/lazy/vim-tmux-navigator/plugin/tmux_navigator.vim
128.204  000.152  000.045: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
128.213  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
128.232  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
128.708  000.004  000.004: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
128.722  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
129.125  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
129.147  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
130.841  000.065  000.065: require('luasnip.util.types')
130.851  000.158  000.093: require('luasnip.util.ext_opts')
131.156  000.091  000.091: require('luasnip.util.lazy_table')
131.225  000.065  000.065: require('luasnip.extras.filetype_functions')
131.255  000.298  000.142: require('luasnip.default_config')
131.257  000.405  000.107: require('luasnip.session')
131.262  001.026  000.463: require('luasnip.config')
131.683  000.080  000.080: require('luasnip.util.vimversion')
131.693  000.248  000.168: require('luasnip.util.util')
131.873  000.073  000.073: require('luasnip.nodes.key_indexer')
131.949  000.073  000.073: require('luasnip.util.feedkeys')
131.961  000.266  000.120: require('luasnip.nodes.util')
132.119  000.072  000.072: require('luasnip.session.snippet_collection.source')
132.180  000.058  000.058: require('luasnip.util.table')
132.239  000.057  000.057: require('luasnip.util.auto_table')
132.251  000.288  000.101: require('luasnip.session.snippet_collection')
132.494  000.089  000.089: require('luasnip.util.select')
132.548  000.052  000.052: require('luasnip.util.time')
133.029  000.712  000.572: require('luasnip.util._builtin_vars')
133.381  001.129  000.416: require('luasnip.util.environ')
133.506  000.118  000.118: require('luasnip.util.extend_decorator')
133.744  000.140  000.140: require('luasnip.util.path')
133.998  000.167  000.167: require('luasnip.util.log')
134.010  000.264  000.097: require('luasnip.loaders.util')
134.078  000.065  000.065: require('luasnip.loaders.data')
134.281  000.200  000.200: require('luasnip.loaders.fs_watchers')
134.291  000.779  000.109: require('luasnip.loaders')
134.322  003.051  000.223: require('luasnip')
134.413  004.503  000.426: sourcing /home/mr/.local/share/nvim/lazy/LuaSnip/plugin/luasnip.lua
134.422  004.544  000.041: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
134.501  000.028  000.028: sourcing /home/mr/.local/share/nvim/lazy/LuaSnip/plugin/luasnip.vim
134.505  000.070  000.042: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
134.513  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
134.528  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
135.508  000.144  000.144: require('nvim-treesitter.utils')
137.407  001.895  001.895: require('nvim-treesitter.parsers')
137.904  000.088  000.088: require('nvim-treesitter.compat')
138.163  000.136  000.136: require('nvim-treesitter.ts_utils')
138.173  000.265  000.129: require('nvim-treesitter.tsrange')
138.238  000.063  000.063: require('nvim-treesitter.caching')
138.255  000.563  000.146: require('nvim-treesitter.query')
138.277  000.741  000.178: require('nvim-treesitter.configs')
138.283  000.869  000.129: require('nvim-treesitter.info')
138.401  000.116  000.116: require('nvim-treesitter.shell_command_selectors')
138.453  003.247  000.224: require('nvim-treesitter.install')
138.517  000.061  000.061: require('nvim-treesitter.statusline')
138.607  000.088  000.088: require('nvim-treesitter.query_predicates')
138.610  003.883  000.486: require('nvim-treesitter')
139.554  004.889  001.006: sourcing /home/mr/.local/share/nvim/lazy/nvim-treesitter/plugin/nvim-treesitter.lua
139.564  004.928  000.039: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
139.578  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
139.596  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
139.916  000.029  000.029: sourcing /home/mr/.local/share/nvim/lazy/todo-comments.nvim/plugin/todo.vim
139.922  000.069  000.040: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
139.941  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
139.955  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
140.636  000.096  000.096: require('todo-comments.util')
141.007  000.578  000.481: require('todo-comments.config')
141.591  000.430  000.430: require('todo-comments.highlight')
141.618  000.608  000.177: require('todo-comments.jump')
141.644  001.684  000.498: require('todo-comments')
142.078  000.193  000.193: sourcing /home/mr/.local/share/nvim/lazy/nvim-rooter.lua/plugin/nvim-rooter.lua
142.086  000.241  000.048: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
142.097  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
142.120  000.001  000.001: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
142.838  000.704  000.704: require('nvim-rooter')
143.037  000.005  000.005: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
143.067  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
143.220  000.058  000.058: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
144.020  000.201  000.201: require('tokyonight.config')
144.034  000.809  000.608: require('tokyonight')
144.376  000.146  000.146: sourcing /home/mr/.local/share/nvim/runtime/plugin/editorconfig.lua
144.382  000.186  000.040: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
144.626  000.198  000.198: sourcing /home/mr/.local/share/nvim/runtime/plugin/gzip.vim
144.631  000.232  000.033: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
144.861  000.197  000.197: sourcing /home/mr/.local/share/nvim/runtime/plugin/man.lua
144.867  000.229  000.032: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
145.975  000.221  000.221: sourcing /home/mr/.local/share/nvim/runtime/pack/dist/opt/matchit/plugin/matchit.vim
146.004  001.092  000.871: sourcing /home/mr/.local/share/nvim/runtime/plugin/matchit.vim
146.008  001.124  000.032: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
146.191  000.124  000.124: sourcing /home/mr/.local/share/nvim/runtime/plugin/matchparen.vim
146.196  000.158  000.034: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
146.247  000.011  000.011: sourcing /home/mr/.local/share/nvim/runtime/plugin/netrwPlugin.vim
146.251  000.047  000.036: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
146.423  000.136  000.136: sourcing /home/mr/.local/share/nvim/runtime/plugin/osc52.lua
146.429  000.169  000.033: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
146.611  000.144  000.144: sourcing /home/mr/.local/share/nvim/runtime/plugin/rplugin.vim
146.615  000.180  000.036: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
146.728  000.057  000.057: sourcing /home/mr/.local/share/nvim/runtime/plugin/shada.vim
146.732  000.093  000.036: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
146.802  000.019  000.019: sourcing /home/mr/.local/share/nvim/runtime/plugin/spellfile.vim
146.806  000.060  000.042: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
146.964  000.110  000.110: sourcing /home/mr/.local/share/nvim/runtime/plugin/tarPlugin.vim
146.969  000.148  000.037: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
147.224  000.158  000.158: sourcing /home/mr/.local/share/nvim/runtime/plugin/tohtml.lua
147.230  000.221  000.063: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
147.319  000.025  000.025: sourcing /home/mr/.local/share/nvim/runtime/plugin/tutor.vim
147.323  000.065  000.040: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
147.503  000.136  000.136: sourcing /home/mr/.local/share/nvim/runtime/plugin/zipPlugin.vim
147.508  000.171  000.035: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
148.408  000.380  000.380: require('cmp_path')
148.542  000.628  000.249: sourcing /home/mr/.local/share/nvim/lazy/cmp-path/after/plugin/cmp_path.lua
148.551  000.687  000.058: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
149.806  000.264  000.264: require('cmp_buffer.timer')
149.844  000.657  000.393: require('cmp_buffer.buffer')
149.867  000.920  000.263: require('cmp_buffer.source')
149.872  001.063  000.142: require('cmp_buffer')
150.005  001.319  000.257: sourcing /home/mr/.local/share/nvim/lazy/cmp-buffer/after/plugin/cmp_buffer.lua
150.018  001.372  000.053: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
150.584  000.285  000.285: require('cmp_luasnip')
150.694  000.514  000.229: sourcing /home/mr/.local/share/nvim/lazy/cmp_luasnip/after/plugin/cmp_luasnip.lua
150.701  000.567  000.053: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
151.396  000.396  000.396: require('cmp_cmdline')
151.487  000.617  000.221: sourcing /home/mr/.local/share/nvim/lazy/cmp-cmdline/after/plugin/cmp_cmdline.lua
151.495  000.665  000.049: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
153.187  000.070  000.070: require('tokyonight.util')
153.193  000.145  000.074: require('tokyonight.theme')
153.273  000.061  000.061: require('tokyonight.colors')
153.366  000.045  000.045: require('tokyonight.colors.storm')
153.500  000.066  000.066: require('tokyonight.hsluv')
153.917  000.094  000.094: require('tokyonight.groups')
155.806  002.886  002.474: sourcing /home/mr/.local/share/nvim/lazy/tokyonight.nvim/colors/tokyonight-night.lua
158.809  000.034  000.034: sourcing nvim_exec2() called at ColorScheme Autocommands for "*":0
158.921  007.373  004.453: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
158.925  146.401  027.694: require('config')
159.159  000.010  000.010: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.165  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.168  000.140  000.128: require('custom.undercurl')
159.242  000.072  000.072: require('custom.hightlightonyank')
159.244  000.297  000.085: require('custom')
159.294  000.008  000.008: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.302  000.005  000.005: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.308  000.004  000.004: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.312  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.316  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.320  000.002  000.002: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.326  000.004  000.004: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.331  000.003  000.003: sourcing nvim_exec2() called at /home/mr/.config/nvim/init.lua:0
159.333  000.087  000.057: require('vimisms.templates')
159.335  148.063  000.067: sourcing /home/mr/.config/nvim/init.lua
159.344  005.710: sourcing vimrc file(s)
159.761  000.053  000.053: sourcing /home/mr/.local/share/nvim/runtime/filetype.lua
160.207  000.080  000.080: sourcing /home/mr/.local/share/nvim/runtime/syntax/synload.vim
160.298  000.438  000.357: sourcing /home/mr/.local/share/nvim/runtime/syntax/syntax.vim
160.319  000.484: inits 3
162.093  001.774: reading ShaDa
166.283  000.066  000.066: require('luasnip.util.directed_graph')
166.331  000.041  000.041: require('luasnip.session.enqueueable_operations')
166.338  000.418  000.311: require('luasnip.loaders.from_lua')
166.758  000.049  000.049: require('luasnip.util.events')
166.776  000.149  000.099: require('luasnip.nodes.node')
166.888  000.109  000.109: require('luasnip.nodes.insertNode')
166.968  000.077  000.077: require('luasnip.nodes.textNode')
167.021  000.050  000.050: require('luasnip.util.mark')
167.067  000.043  000.043: require('luasnip.util.pattern_tokenizer')
167.103  000.034  000.034: require('luasnip.util.dict')
167.734  000.556  000.556: require('luasnip.util.jsregexp')
167.741  000.635  000.078: require('luasnip.nodes.util.trig_engines')
167.776  001.291  000.194: require('luasnip.nodes.snippet')
167.780  001.339  000.049: require('luasnip.nodes.duplicate')
167.783  001.379  000.039: require('luasnip.loaders.snippet_cache')
167.793  001.451  000.072: require('luasnip.loaders.from_snipmate')
168.105  000.044  000.044: require('luasnip.util.parser.neovim_ast')
168.151  000.043  000.043: require('luasnip.util.str')
168.392  000.237  000.237: require('luasnip.util.jsregexp')
168.399  000.385  000.061: require('luasnip.util.parser.ast_utils')
168.531  000.106  000.106: require('luasnip.nodes.functionNode')
168.611  000.078  000.078: require('luasnip.nodes.choiceNode')
168.676  000.063  000.063: require('luasnip.nodes.dynamicNode')
168.717  000.039  000.039: require('luasnip.util.functions')
168.723  000.771  000.100: require('luasnip.util.parser.ast_parser')
168.809  000.084  000.084: require('luasnip.util.parser.neovim_parser')
168.815  000.930  000.074: require('luasnip.util.parser')
168.860  000.043  000.043: require('luasnip.nodes.snippetProxy')
169.013  000.149  000.149: require('luasnip.util.jsonc')
169.023  001.227  000.106: require('luasnip.loaders.from_vscode')
169.063  003.874: opening buffers
169.283  000.220: BufEnter autocommands
169.286  000.004: editing files in windows
169.317  000.030: VimEnter autocommands
169.730  000.121  000.121: require('snacks.util')
169.820  000.468  000.347: require('snacks.dashboard')
172.259  000.170  000.170: require('snacks.input')
172.658  000.066  000.066: require('vim.termcap')
172.743  000.068  000.068: require('vim.text')
172.778  002.688: UIEnter autocommands
173.672  000.557  000.557: sourcing /home/mr/.local/share/nvim/runtime/autoload/provider/clipboard.vim
173.686  000.351: before starting main loop
174.700  001.014: first screen update
174.705  000.006: --- NVIM STARTED ---

