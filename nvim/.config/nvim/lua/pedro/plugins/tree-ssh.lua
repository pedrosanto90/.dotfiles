return {
  "pedrosanto90/neo-tree-ssh.nvim",
  dependencies = {
    "nvim-neo-tree/neo-tree.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    log_level = "info",
    cache_ttl = 3600,
    hosts = {
      docker = {
        host = "home-server",
        remote_root = "/home/pedro/docker",
        exclude = {
          ".git", "node_modules", ".venv", "__pycache__", "target",
          ".cache", ".local", ".npm", ".cargo", ".rustup",
          ".vscode-server", "snap",
        },
      },
    },
  },
}
