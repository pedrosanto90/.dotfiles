return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  opts = {
    connections = {
      ssh_configs = {
        vim.fn.expand "$HOME" .. "/.ssh/config",
        "/etc/ssh/ssh_config",
      },
      ssh_known_hosts = vim.fn.expand "$HOME" .. "/.ssh/known_hosts",
      sshfs_args = { "-o reconnect", "-o ConnectTimeout=5" },
    },
    mounts = {
      base_dir = vim.fn.expand "$HOME" .. "/.sshfs/",
      unmount_on_exit = true,
    },
    handlers = {
      on_connect = { change_dir = true },
      on_disconnect = { clean_mount_folders = false },
      on_edit = {},
    },
    ui = {
      picker = "fzf-lua",
      confirm = { connect = true, change_dir = false },
    },
    log = { enabled = false },
  },
  config = function(_, opts)
    require('remote-sshfs').setup(opts)
    local api = require('remote-sshfs.api')
    vim.keymap.set('n', '<leader>rc', api.connect, {})
    vim.keymap.set('n', '<leader>rd', api.disconnect, {})
    vim.keymap.set('n', '<leader>re', api.edit, {})
  end,
}
