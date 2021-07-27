(module dotfiles.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util dotfiles.util
             packer packer}})

(defn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :dotfiles.plugin. name))]
    (when (not ok?)
      (print (.. "dotfiles error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name))))))))

;; Plugins to be managed by packer.
(use
  :wbthomason/packer.nvim {}
  :tpope/vim-surround {}
  :tpope/vim-commentary {}
  :tpope/vim-fugitive {}
  :tpope/vim-dispatch {}
  :tpope/vim-dotenv {}
  :tpope/vim-sleuth {}
  :godlygeek/tabular {}
  :nvim-lua/popup.nvim {}
  :nvim-lua/plenary.nvim {}
  :nvim-telescope/telescope.nvim {:requires {:nvim-lua/popup.nvim :nvim-lua/plenary.nvim} :mod :telescope}
  :plasticboy/vim-markdown {}
  :neoclide/coc.nvim {:branch :release}
  :sheerun/vim-polyglot {}
  :bakpakin/ats2.vim {}
  :ap/vim-buftabline {}
  :jiangmiao/auto-pairs {}
  :kien/rainbow_parentheses.vim {}
  :cespare/vim-toml {}
  ; :vimwiki/vimwiki {}
  :mattn/calendar-vim {}
  :itchyny/lightline.vim {}
  :arthurxavierx/vim-caser {}
  :skywind3000/asyncrun.vim {}
  :Shougo/vinarise.vim {}
  :hardliner66/vim-run {:mod :vrun}
  :hardliner66/neovim-twitch-chat {:run "./install.sh" :mod :twitch_chat}
  :Olical/aniseed {:tag :v3.20.0}
  :Olical/conjure {:tag :v4.22.1}
  :liuchengxu/vim-which-key {:mod :whichkey}
  :sakhnik/nvim-gdb {:run "./install.sh"}
  :nightsense/office {:mod :office}
  :lambdalisue/suda.vim {}
  :Olical/nvim-local-fennel {}

  ;:HerringtonDarkholme/yats.vim {}
  ;:Olical/AnsiEsc {}
  ;:Olical/vim-enmasse {}
  ;:PeterRincker/vim-argumentative {}
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  ;:dag/vim-fish {}
  ;:easymotion/vim-easymotion {:mod :easymotion}
  ;:guns/vim-sexp {:mod :sexp}
  ;:hashivim/vim-terraform {}
  ;:hylang/vim-hy {}
  ;:janet-lang/janet.vim {}
  ;:radenling/vim-dispatch-neovim {}
  ;:tpope/vim-abolish {}
  ;:tpope/vim-commentary {}
  ;:tpope/vim-dadbod {}
  ;:tpope/vim-dispatch {}
  ;:tpope/vim-eunuch {}
  ;:tpope/vim-fugitive {:mod :fugitive}
  ;:tpope/vim-repeat {}
  ;:tpope/vim-sexp-mappings-for-regular-people {}
  ;:tpope/vim-sleuth {}
  ;:tpope/vim-surround {}
  ;:tpope/vim-unimpaired {}
  ;:tpope/vim-vinegar {}
  ;:wlangstroth/vim-racket {}
  )