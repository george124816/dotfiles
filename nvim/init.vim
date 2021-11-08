for f in split(glob('~/.config/nvim/config/modules/*.lua'), '\n')
    exe 'source' f
endfor

set tabstop=4 softtabstop=4

set shiftwidth=4
set expandtab
set smartindent

" syntax on
" set foldmethod=syntax
set foldmethod=indent
set nofoldenable

set relativenumber
set nu
set noerrorbells

set nowrap

set incsearch
set scrolloff=8
set colorcolumn=100
set signcolumn=yes

let g:blamer_enabled = 0
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' 😡 '

let g:airline_powerline_fonts = 1

call plug#begin('~/.vim/plugged')

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua' 

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
    \ Plug 'p00f/nvim-ts-rainbow'
  Plug 'neovim/nvim-lspconfig'

  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/cmp-nvim-lsp' |
      \ Plug 'hrsh7th/cmp-buffer' |
      \ Plug 'hrsh7th/nvim-cmp' |
      \ Plug 'saadparwaiz1/cmp_luasnip' |
      \ Plug 'L3MON4D3/LuaSnip'


  Plug 'ray-x/lsp_signature.nvim'
  Plug 'nanotee/sqls.nvim'

  Plug 'folke/which-key.nvim'

  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'APZelos/blamer.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'elixir-editors/vim-elixir'
  Plug 'vim-test/vim-test'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-commentary'

  Plug 'mfussenegger/nvim-dap'

  " Plug 'diepm/vim-rest-console'

  Plug 'c-brenn/fuzzy-projectionist.vim'
  Plug 'andyl/vim-projectionist-elixir'

  Plug 'chriskempson/base16-vim'

  " Plug 'xolox/vim-misc'
  " Plug 'xolox/vim-colorscheme-switcher'

call plug#end()

colorscheme base16-seti
" colorscheme base16-brewer
" colorscheme base16-classic-dark

hi VertSplit ctermbg=NONE guibg=NONE
set termguicolors

vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

let mapleader = " "

" Vim 
nnoremap <leader><leader> :
nnoremap <leader>cf :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>cr :so %<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>Q :q!<CR>

nnoremap <leader>tt :T pwd<CR>
tnoremap <Esc> <C-\><C-n>

" Git
" nnoremap <leader>gs :Neogit kind=split<CR>
" nnoremap <leader>gf :Neogit<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gb :BlamerToggle<CR>

nnoremap <leader>fs :w<CR> 
nnoremap <leader>W :w!<CR> 

" Database
nnoremap <leader>se :SqlsExecuteQuery<CR>
nnoremap <leader>sv :SqlsExecuteQueryVertical<CR>
nnoremap <leader>sd :SqlsSwitchDatabase<CR>
nnoremap <leader>sc :SqlsSwitchConnection<CR>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

nnoremap <leader>bd :bd<cr>
nnoremap <leader>bD :bd!<cr>
nnoremap <leader>bn :enew<CR>

" Windows 
nnoremap <leader>w/ :vsp<CR>
nnoremap <leader>w- :sp<CR>

nnoremap <leader><Tab> :e #<CR>

nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wd :q <CR>

" ColorScheme
" nnoremap <F7> :PrevColorScheme<CR>
" nnoremap <F8> :NextColorScheme<CR>

let test#strategy = "neoterm"
let g:neoterm_default_mod='vert botright'
let g:neoterm_size=''
let g:neoterm_autoscroll = 1
" let test#neovim#term_position = "vert botright"

" Test
nnoremap <leader>ts :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tr :TestLast<CR>
nnoremap <leader>ta :TestSuite<CR>
nnoremap <leader>tp :T mix format && mix credo && mix dialyzer && mix test<CR> 
nnoremap <leader>twf :T find test lib \| entr -cr mix test %<CR>
nnoremap <leader>tws :T find test lib \| entr -cr mix test %:<C-r>=line('.')<CR><CR>
nnoremap gt :A<CR>

" LSPConfig
nnoremap gd <cmd>lua vim.lsp.buf.definition<cr>

let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
" let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


lua <<EOF

local previewers = require('telescope.previewers')
local putils = require('telescope.previewers.utils')
local pfiletype = require('plenary.filetype')

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  if opts.use_ft_detect == nil then
    local ft = pfiletype.detect(filepath)
    opts.use_ft_detect = false
    putils.regex_highlighter(bufnr, ft)
  end
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

local actions = require("telescope.actions")

require('telescope').setup {
--[[  " extensions = {
  "   fzf = {
  "     fuzzy = true,
  "     override_generic_sorter = true,
  "     override_file_sorter = true,
  "     case_mode = "smart_case",
  "   },
  " }, ]]--
  defaults = {
    buffer_previewer_maker = new_maker,
    mappings = {
        i = {
           ["<esc>"] = actions.close,
           },
     },
  },
  color_devicons = true,
  pickers = {
    buffers = {
      show_all_buffers = true,
      previewer = false,
    }
  }
}

-- require('telescope').load_extension('fzf')

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"elixir", "typescript"},
    pickers = {
        previewer = false,
    },
    highlight = {
        enable = true,
        },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}

local nvim_lsp = require('lspconfig')
local cmp = require'cmp'

require'lspconfig'.sqls.setup{
  cmd = {"/home/george/go/bin/sqls", "-config", "/home/george/.config/sqls/config.yml"},
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require'sqls'.setup{
          --  picker = 'telescope',
        }
    end
}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --     -- Mappings.
  local opts = { noremap=true, silent=true }
  --         -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-w>gv', ':vs<cr><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-w>gs', ':sp<cr><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

nvim_lsp.elixirls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = { "/home/george/.elixir-ls/language_server.sh" };
  on_attach = on_attach,
}

 require "lsp_signature".setup({
    bind = true,
    handler_opts = {
      border = "single"
    }
  })

-- local neogit = require('neogit')
-- neogit.setup {}

require("which-key").setup {
  }

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

