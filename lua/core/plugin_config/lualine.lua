require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
  },
  sections = {
    lualine_a = {
       {
         'filename',
         path = 1,
       }
     }
   }
 }
 
require('core.plugin_config.lualine_evil_lualine')
