require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'dockerfile',
    'go',
    'graphql',
    'html',
    'javascript',
    'json',
    'jsonnet',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'proto',
    'ruby',
    'rust',
    'sql',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  endwise = { enable = true },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
        ['aP'] = '@parameter.outer',
        ['iP'] = '@parameter.inner',
      },
    },
  },
})
