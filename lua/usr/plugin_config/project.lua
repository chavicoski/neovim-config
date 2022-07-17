-- Protected call to generate prettier errors
local project_nvim_status_ok, project_nvim = pcall(require, "project_nvim")
if not project_nvim_status_ok then
  vim.notify("[Error]: project_nvim not found! (in project.lua)")
  return
end

project_nvim.setup {}

vim.g.update_cwd = 1
