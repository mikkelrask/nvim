return {
  'ahmedkhalf/project.nvim',
  config = function()
    local uv = vim.loop
    local dotfiles_path = vim.fn.expand("~/dotfiles")
    local handle = uv.fs_scandir(dotfiles_path)

    local folders = {}
    if handle then
      while true do
        local name, type = uv.fs_scandir_next(handle)
        if not name then break end
        if type == 'directory' then
          table.insert(folders, name)
        end
      end
    end

    local function is_dotfiles_link(filepath)
      local resolved = vim.fn.resolve(filepath)
      if resolved ~= filepath then
        for _, folder in ipairs(folders) do
          if resolved:find(dotfiles_path .. '/' .. folder, 1, true) == 1 then
            return true, resolved
          end
        end
      end
      return false, nil
    end

    local function get_project_root(filepath)
      local resolved = vim.fn.resolve(filepath)
      local home = vim.fn.expand('~')

      for _, folder in ipairs(folders) do
        local dotfiles_target = dotfiles_path .. '/' .. folder
        local config_link = home .. '/.config/' .. folder
        local config_resolved = vim.fn.resolve(config_link)

        if resolved:find(config_resolved, 1, true) == 1 then
          return config_resolved
        end
        if resolved:find(dotfiles_target, 1, true) == 1 then
          return dotfiles_target
        end
      end
      return nil
    end

    require('project_nvim').setup({
      detection_methods = {}, -- disable project detection, use custom logic
      silent_chdir = true,
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local filepath = vim.fn.expand('%:p')
        if filepath == '' then return end

        local project_root = get_project_root(filepath)
        if project_root then
          vim.cmd('silent! cd ' .. vim.fn.fnameescape(project_root))
        end
      end,
    })
  end,
}
