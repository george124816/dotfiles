set tabstop=4 softtabstop=4

set shiftwidth=4
set expandtab
set smartindent

" syntax on
" set foldmethod=syntax
set foldmethod=indent
set nofoldenable

set noswapfile
set nobackup

set relativenumber
set nu
set noerrorbells

set nowrap

set incsearch
set scrolloff=8
set colorcolumn=120
set signcolumn=yes

let g:blamer_enabled = 0
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' 😡 '

let g:airline_powerline_fonts = 1

let g:codi#width=80
let g:codi#rightalign=1
let g:codi#virtual_text=0 

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

let g:Hexokinase_highlighters = ['backgroundfull']

call plug#begin('~/.vim/plugged')

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'pwntester/octo.nvim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
      \ Plug 'nvim-treesitter/playground', { 'on': 'TSPlaygroundToggle' } |
      \ Plug 'p00f/nvim-ts-rainbow'
  Plug 'neovim/nvim-lspconfig' |
      \ Plug 'williamboman/nvim-lsp-installer'

  Plug 'gbprod/cutlass.nvim'
 
  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/cmp-nvim-lsp' |
      \ Plug 'hrsh7th/cmp-buffer' |
      \ Plug 'hrsh7th/nvim-cmp' |
      \ Plug 'saadparwaiz1/cmp_luasnip' |
      \ Plug 'L3MON4D3/LuaSnip'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  Plug 'ray-x/lsp_signature.nvim'
  Plug 'nanotee/sqls.nvim'

  Plug 'metakirby5/codi.vim'

  Plug 'preservim/nerdtree'

  Plug 'folke/which-key.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'

  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'APZelos/blamer.nvim'

  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  
  Plug 'lifepillar/vim-colortemplate'


  Plug 'dylnmc/synstack.vim'

  Plug 'chriskempson/base16-vim'

  Plug 'elixir-editors/vim-elixir'
  Plug 'vim-test/vim-test'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-commentary'

  Plug 'mfussenegger/nvim-dap'

  " Plug 'diepm/vim-rest-console'

  Plug 'tpope/vim-projectionist'
  Plug 'c-brenn/fuzzy-projectionist.vim'
  Plug 'andyl/vim-projectionist-elixir'

  Plug 'sbdchd/neoformat'

  " Plug 'wakatime/vim-wakatime'
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
colorscheme base16-3024
" colorscheme elflord
" colorscheme base16-materia
" colorscheme base16-irblack 
" colorscheme base16-flat 
" colorscheme base16-seti
" colorscheme base16-brewer
" colorscheme base16-brogrammer
" colorscheme elflord

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
nnoremap <leader>cr :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>Q :q!<CR>

nnoremap <leader>tt :Ttoggle<CR>
tnoremap <Esc> <C-\><C-n>

" Git
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gb :BlamerToggle<CR>
nnoremap <leader>gP :Git push<CR>
nnoremap <leader>gp :Git pull<CR>

" Files
nnoremap <leader>fs :w<CR> 
nnoremap <leader>W :w!<CR> 

" Database
nnoremap <leader>se :SqlsExecuteQuery<CR>
nnoremap <leader>sv :SqlsExecuteQueryVertical<CR>
nnoremap <leader>sd :SqlsSwitchDatabase<CR>
nnoremap <leader>sc :SqlsSwitchConnection<CR>

" Using Lua functions
nnoremap <Leader>ff :lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fg <cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

nnoremap <leader>gco <cmd>lua require('telescope.builtin').git_branches()<cr>

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
nnoremap <leader>te :T mix test --failed<CR>
nnoremap <leader>tp :T mix format && mix credo && mix dialyzer && mix test<CR> 
nnoremap <leader>td :T mix dialyzer<CR>
nnoremap <leader>tm :T MIX_ENV=test mix do ecto.drop, ecto.create, ecto.migrate<CR>
nnoremap <leader>tc :T mix compile --all-warnings --warnings-as-errors<CR>
nnoremap <leader>twf :T find test lib \| entr -cr mix test %<CR>
nnoremap <leader>tws :T find test lib \| entr -cr mix test %:<C-r>=line('.')<CR><CR>
nnoremap <leader>twa :T find test lib \| entr -cr mix test<CR>
nnoremap <leader>twe :T find test lib \| entr -cr mix test --failed<CR>
nnoremap <leader>tq :Tkill<CR>
nnoremap gt :A<CR>

nnoremap <leader>esl :T Logger.configure(level: :emergency)<CR>

nnoremap <leader>lj :%!jq .<CR>

" Docker
nnoremap <leader>dcs :T docker container ls -a<CR>
nnoremap <leader>dcs :T docker compose ls -a<CR>
nnoremap <leader>dcu :T docker compose up -d<CR>
nnoremap <leader>dcd :T docker compose down<CR>

" LSPConfig
nnoremap gd <cmd>lua vim.lsp.buf.definition<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>rf :TREPLSendFile<CR>
nnoremap <leader>rr :TREPLSendLine<CR> 
nnoremap <leader>rv :TREPLSendSelection<CR>

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
     mappings = {
        i = {
          ["<c-e>"] = "delete_buffer",
        },
        n = {
            ["d"] = "delete_buffer",
            ["<c-e>"] = "delete_buffer",
        }
      }
    }
  }
}

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#212121 gui=nocombine]]

require("indent_blankline").setup {
    show_current_context_start = true,
    buftype_exclude = {"terminal"},
    char_highlight_list = { "IndentBlanklineIndent1",},
}


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
  cmd = {"/home/user/go/bin/sqls", "-config", "/home/user/.config/sqls/config.yml"},
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require'sqls'.setup{
          --  picker = 'telescope',
        }
    end
}
require("cutlass").setup({
        cut_key = "m"
    })

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
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/elixir/elixir-ls/language_server.sh" },
  on_attach = on_attach,
}

nvim_lsp.efm.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {"elixir"},
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/efm/efm-langserver" }
})

require "lsp_signature".setup({
    bind = true,
    transparency = 50, -- disabled by default, allow floating win transparent value 1~100
    floating_window = true,
    handler_opts = {
      border = "single"
    }
  })

require("which-key").setup {}

require"octo".setup({
  default_remote = {"upstream", "origin"}; -- order to try remotes
  reaction_viewer_hint_icon = "";         -- marker for user reactions
  user_icon = " ";                        -- user icon
  timeline_marker = "";                   -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = "";            -- Bubble delimiter
  left_bubble_delimiter = "";             -- Bubble delimiter
  github_hostname = "";                    -- GitHub Enterprise host
  snippet_context_lines = 4;               -- number or lines around commented lines
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel
  },
  mappings = {
    issue = {
      close_issue = "<space>ic",           -- close issue
      reopen_issue = "<space>io",          -- reopen issue
      list_issues = "<space>il",           -- list open issues on same repo
      reload = "<C-r>",                    -- reload issue
      open_in_browser = "<C-b>",           -- open issue in browser
      copy_url = "<C-y>",                  -- copy url to system clipboard
      add_assignee = "<space>aa",          -- add assignee
      remove_assignee = "<space>ad",       -- remove assignee
      create_label = "<space>lc",          -- create label
      add_label = "<space>la",             -- add label
      remove_label = "<space>ld",          -- remove label
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    pull_request = {
      checkout_pr = "<space>po",           -- checkout PR
      merge_pr = "<space>pm",              -- merge PR
      list_commits = "<space>pc",          -- list PR commits
      list_changed_files = "<space>pf",    -- list PR changed files
      show_pr_diff = "<space>pd",          -- show PR diff
      add_reviewer = "<space>va",          -- add reviewer
      remove_reviewer = "<space>vd",       -- remove reviewer request
      close_issue = "<space>ic",           -- close PR
      reopen_issue = "<space>io",          -- reopen PR
      list_issues = "<space>il",           -- list open issues on same repo
      reload = "<C-r>",                    -- reload PR
      open_in_browser = "<C-b>",           -- open PR in browser
      copy_url = "<C-y>",                  -- copy url to system clipboard
      add_assignee = "<space>aa",          -- add assignee
      remove_assignee = "<space>ad",       -- remove assignee
      create_label = "<space>lc",          -- create label
      add_label = "<space>la",             -- add label
      remove_label = "<space>ld",          -- remove label
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    review_thread = {
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      add_suggestion = "<space>sa",        -- add suggestion
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    submit_win = {
      approve_review = "<C-a>",            -- approve review
      comment_review = "<C-m>",            -- comment review
      request_changes = "<C-r>",           -- request changes review
      close_review_tab = "<C-c>",          -- close review tab
    },
    review_diff = {
      add_review_comment = "<space>ca",    -- add a new review comment
      add_review_suggestion = "<space>sa", -- add a new review suggestion
      focus_files = "<leader>e",           -- move focus to changed file panel
      toggle_files = "<leader>b",          -- hide/show changed files panel
      next_thread = "]t",                  -- move to next thread
      prev_thread = "[t",                  -- move to previous thread
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
    },
    file_panel = {
      next_entry = "j",                    -- move to next changed file
      prev_entry = "k",                    -- move to previous changed file
      select_entry = "<cr>",               -- show selected changed file diffs
      refresh_files = "R",                 -- refresh changed files panel
      focus_files = "<leader>e",           -- move focus to changed file panel
      toggle_files = "<leader>b",          -- hide/show changed files panel
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
    }
  }
})
