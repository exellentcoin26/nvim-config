-- table of options for vim
-- use ':help options' to get a list and info about them
local options = {
	number = true, -- show line numbers
	relativenumber = false, -- show relative linenumbers
	wrap = false, -- disable line wrap
	showcmd = true, -- show the incomplete command at the bottom of the screen
	showmode = false, -- show the current mode you are working in
	showmatch = true, -- when searching, highlight the word to jump to in a different color
	hlsearch = true, -- clear the highlights when done searching
	wildmenu = true, -- show an autocomletion menu when pressing 'tab'
	wildmode = "full", -- when multiple options for autocompletion show a list of options
	errorbells = false, -- disable sound for input errors
	incsearch = true, -- only highlight the part of the word that is matched
	scrolloff = 8, -- start scrolling the file when 'x' rows away from the edge of the screen
	signcolumn = "yes", -- show an extra column on the left side for error/warning markers
	colorcolumn = "120", -- set a column line on column 120
	termguicolors = true, -- better color schemes (some color schemes are better without it)
	tabstop = 4, -- set tab indent to 'x' virtual spaces
	softtabstop = 4, -- set tab indent to 'x' actual spaces
	shiftwidth = 4, -- set indent width to 'x' spaces
	expandtab = true, -- use spaces instaid of tabs
	ignorecase = true, -- enable case insensitive search
	smartcase = true, -- override 'ignorecase' when typing a capital letter
	mouse = "a", -- enable mouse support for all modes
	hidden = true, -- files do not need to saved to open a different file
	swapfile = false, -- disable creation of swap files
	backup = false, -- disable keeping backup files after writing
	undofile = true, -- use a file to save undo information (useful for plugins)
	clipboard = "unnamedplus", -- use system keyboard instaid of buffer
	cmdheight = 2, -- use 'x' lines as command space at the bottom of the screen
	fileencoding = "utf-8", -- encoding use for text to write to files
	showtabline = 0, -- always show tabline
	smartindent = true, -- enable smart indenting in files for e.g. newlines
	splitbelow = true, -- force all horizontal splits below the current window
	splitright = true, -- force all vertical splits to the right of the current window
	updatetime = 300, -- faster update of e.g. autocompletion
	writebackup = true, -- write a backup of the file until the file is successfully written
	cursorline = false, -- highlight the line the cursor is on
	numberwidth = 4, -- use a minimum of x spaces for the number line
	sidescrolloff = 8, -- start scrolling when the cursor is eight spaces from the side
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
