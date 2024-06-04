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
	--
}
