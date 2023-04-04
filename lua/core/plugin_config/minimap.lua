local MiniMap = require('mini.map')

local config = {
  integrations = {
    MiniMap.gen_integration.builtin_search(),
    MiniMap.gen_integration.diagnostic(),
    MiniMap.gen_integration.gitsigns(),
  }
}

MiniMap.setup(config)
