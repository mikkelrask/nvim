return {
  'ahmedkhalf/project.nvim',
  config = function()
    -- Project.nvim setup
    require('project_nvim').setup({
      detection_methods = { 'pattern' },
      patterns = { '.git' },
      silent_chdir = true,
      --scope_chdir = 'local', -- prøv local scope for mindre global cwd-skift
    })

    -- Her henter vi undermapper i ~/dotfiles
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

    -- Autocmd der sikrer cwd sættes til filens mappe
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local filepath = vim.fn.expand('%:p')
        if filepath == '' then return end

        local file_dir = vim.fn.expand('%:p:h')
        local cwd = vim.fn.getcwd()
        local home = vim.fn.expand('~')

        local in_dotfiles = false
        for _, folder in ipairs(folders) do
          local prefix = home .. '/.config/' .. folder .. '/'
          if filepath:sub(1, #prefix) == prefix then
            in_dotfiles = true
            break
          end
        end

        -- Skift cwd hvis filen er i dotfiles config OG cwd er forskellig
        if in_dotfiles and file_dir ~= cwd then
          vim.cmd('silent! cd ' .. vim.fn.fnameescape(file_dir))
          -- vim.notify('Changed cwd to ' .. file_dir .. ' for ' .. filepath) -- evt. debug
        end
      end,
    })
  end,
}
