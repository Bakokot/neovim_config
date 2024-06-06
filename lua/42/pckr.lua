local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
	-- Treesitter : parser
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	-- Theme
	"rebelot/kanagawa.nvim";
	-- Telescope : fuzzy file finder
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	};
	-- Neo-Tree : File and directory Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = { {"nvim-lua/plenary.nvim"}, {"nvim-tree/nvim-web-devicons"}, {"MunifTanjim/nui.nvim"} }	
	};
	-- Autosave
	{
		"Pocco81/auto-save.nvim",
		config = function()
		require("auto-save").setup 
		{
			enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
			execution_message = 
			{
				message = function() -- message to print on save
					return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
				end,
				dim = 0.18, -- dim the color of `message`
				cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
			},
			trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
			-- function that determines whether to save the current buffer or not
			-- return true: if buffer is ok to be saved
			-- return false: if it's not ok to be saved
			condition = function(buf)
				local fn = vim.fn
				local utils = require("auto-save.utils.data")

				if
					fn.getbufvar(buf, "&modifiable") == 1 and
					utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
					return true -- met condition(s), can save
				end
				return false -- can't save
			end,
			write_all_buffers = false, -- write all buffers when the current one meets `condition`
			debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
			callbacks = 
			{ -- functions to be executed at different intervals
				enabling = nil, -- ran when enabling auto-save
				disabling = nil, -- ran when disabling auto-save
				before_asserting_save = nil, -- ran before checking `condition`
				before_saving = nil, -- ran before doing the actual save
				after_saving = nil -- ran after doing the actual save
			}
		}
	end,
	};
	-- LSP setup
	{
		"williamboman/mason.nvim",
	};
	{
		"williamboman/mason-lspconfig.nvim",
	};
	{
    		"neovim/nvim-lspconfig",
	};
	-- Autocompletion and snippets
	{
		-- Snippet tool
		"L3MON4D3/LuaSnip",
	};
	{
		-- Snippet tool
		"saadparwaiz1/cmp_luasnip"
	};
	{
		-- VS Code snippets ised by Luasnip
		"rafamadriz/friendly-snippets"
	};
	{
		-- Snippets from LSP
		"hrsh7th/cmp-nvim-lsp",
	};
	{
		-- Completion Module
		"hrsh7th/nvim-cmp"
	};
}
