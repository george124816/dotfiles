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
set colorcolumn=100,120
set signcolumn=yes

let g:blamer_enabled = 0
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' 😡 '

let g:airline_powerline_fonts = 1
" let g:airline_theme='sol'


" MarkdownPreview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

call plug#begin('~/.vim/plugged')

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
    \ Plug 'p00f/nvim-ts-rainbow'
  Plug 'neovim/nvim-lspconfig'

  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/cmp-nvim-lsp' |
      \ Plug 'hrsh7th/cmp-buffer' |
      \ Plug 'hrsh7th/nvim-cmp' |
      \ Plug 'saadparwaiz1/cmp_luasnip' |
      \ Plug 'L3MON4D3/LuaSnip'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  Plug 'ray-x/lsp_signature.nvim'
  Plug 'nanotee/sqls.nvim'

  Plug 'preservim/nerdtree'

  Plug 'folke/which-key.nvim'

  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'APZelos/blamer.nvim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'vim-scripts/trivial256'
  Plug 'chriskempson/base16-vim'
  Plug 'vim-scripts/summerfruit256.vim'
  Plug 'vim-scripts/pyte'
  Plug 'vim-scripts/oceanlight'
  Plug 'vim-scripts/eclipse.vim'
  Plug 'vim-scripts/autumnleaf'
  Plug 'vim-scripts/nuvola.vim'

  Plug 'elixir-editors/vim-elixir'
  Plug 'vim-test/vim-test'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-commentary'

  Plug 'mfussenegger/nvim-dap'

  " Plug 'diepm/vim-rest-console'

  Plug 'c-brenn/fuzzy-projectionist.vim'
  Plug 'andyl/vim-projectionist-elixir'


  Plug 'wakatime/vim-wakatime'

  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-colorscheme-switcher'

call plug#end()



"Light
" colorscheme morning
" colorscheme delek
" colorscheme base16-harmonic-light
" colorscheme peachpuff
" colorscheme trivial256
" colorscheme nuvola
" colorscheme autumnleaf
" colorscheme pyte

"Dark
" colorscheme elflord
" colorscheme base16-materia
" colorscheme base16-irblack 
" colorscheme base16-flat 
colorscheme base16-seti
" colorscheme base16-brewer

hi VertSplit ctermbg=NONE guibg=NONE
" hi Normal ctermbg=NONE guibg=NONE
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
nnoremap <leader>wr :resize 

nnoremap <leader><Tab> :e #<CR>

nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wd :q <CR>

"ColorScheme
nnoremap <F7> :PrevColorScheme<CR>
nnoremap <F8> :NextColorScheme<CR>

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

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>rf :TREPLSendFile<CR>

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
    ensure_installed = {"elixir", "typescript", "python"},
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
  cmd = {"/home/user/go/bin/sqls", "-config", "/home/user/.config/sqls/config.yml"},
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
  cmd = { "/home/user/.elixir-ls/language_server.sh" };
  on_attach = on_attach,
}

require'lspconfig'.pylsp.setup{
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


