local wezterm = require("wezterm")

local M = {}

local workspaces = {
  {
    name = "Cloud-Portal-Web",
    tabs = {
      {
        title = "shell",
        cwd = "/home/pedro/Documents/work/domatica/Cloud-Portal-Web",
      },
      {
        title = "Opencode",
        cwd = "/home/pedro/Documents/work/domatica/Cloud-Portal-Web",
        -- args = { "opencode" },
      },
      {
        title = "tests",
        cwd = "/home/pedro/Documents/work/domatica/Cloud-Portal-Web",
        -- args = { "npm", "run", "test" },
      },
    },
    key = "q",
  },
  {
    name = "Cloud-Services-RestApi",
    tabs = {
      {
        title = "shell",
        cwd = "/home/pedro/Documents/work/domatica/Cloud-Services-RestApi",
      },
      {
        title = "Opencode",
        cwd = "/home/pedro/Documents/work/domatica/Cloud-Services-RestApi",
        -- args = { "opencode" },
      },
      {
        title = "tests",
        cwd = "/home/pedro/Documents/work/domatica/Cloud-Services-RestApi",
        -- args = { "npm", "run", "test:watch" },
      },
    },
    key = "w",
  },
  {
    name = "Cloud-Services-Storage-Database",
    tabs = {
      {
        title = "shell",
        cwd = "/home/pedro/Documents/work/domatica/Cloud-Services-Storage-Database",
      },
      {
        title = "Opencode",
        cwd = "/home/pedro/Documents/work/domatica/Cloud-Services-Storage-Database/scripts",
        -- args = { "opencode" },
      },
      -- {
      --   title = "migrations",
      --   cwd = "/home/pedro/Documents/work/domatica/Cloud-Services-Storage-Database/migrations",
      -- },
    },
    key = "e",
  },
  {
    name = "Dotfiles",
    tabs = {
      {
        title = "shell",
        cwd = "/home/pedro/.dotfiles",
      },
      {
        title = "Opencode",
        cwd = "/home/pedro/.dotfiles",
        -- args = { "opencode" },
      },
    },
    key = "p",
  },
}

local function workspace_exists(name)
  for _, n in ipairs(wezterm.mux.get_workspace_names()) do
    if n == name then
      return true
    end
  end
  return false
end

local function seed_workspace(def)
  -- spawn_window returns tab, pane, window; we need the window object for tab ops
  local _, _, window = wezterm.mux.spawn_window {
    workspace = def.name,
    cwd = def.tabs[1].cwd,
    args = def.tabs[1].args,
  }

  if def.tabs[1].title and window:active_tab() then
    window:active_tab():set_title(def.tabs[1].title)
  end

  for i = 2, #def.tabs do
    local tab = window:spawn_tab {
      cwd = def.tabs[i].cwd,
      args = def.tabs[i].args,
    }

    if def.tabs[i].title then
      tab:set_title(def.tabs[i].title)
    end
  end
end

local function make_workspace_action(def)
  return wezterm.action_callback(function(window, pane)
    if not workspace_exists(def.name) then
      seed_workspace(def)
    end

    window:perform_action(
      wezterm.action.SwitchToWorkspace { name = def.name },
      pane
    )
  end)
end

function M.setup(config)
  config.keys = config.keys or {}

  for _, def in ipairs(workspaces) do
    table.insert(config.keys, {
      key = def.key,
      mods = "CTRL|SHIFT",
      action = make_workspace_action(def),
    })
  end

  table.insert(config.keys, {
    key = "9",
    mods = "ALT",
    action = wezterm.action.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" },
  })
end

return M
