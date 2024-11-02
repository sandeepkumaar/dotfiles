## MAC Setup

### brew & git
Instal brew
- brew install git (installs xcode)

For installing without sudo
```
$ mkdir ~/homebrew
$ curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip-components 1 -C homebrew
```
This will install all homebrew binaries under `~/homebrew` directory
`HOMEBREW_PREFIX` is automatically set to `~/homebrew`

### Shell
- Install oh-my-zsh: https://ohmyz.sh/
- Modify the theme in `~/.zshrc` file
- Load`bash_profile` on terminal startup
```
ZSH_THEME="gallifrey"

if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile;
fi
setopt no_share_history
```

### dotfiles
Clone dotfiles under the root directory. copy all files to Root  

### VIM
- mac has vim by default. if you need latest version - use brew to install latest
- brew install xclip #to enable clipboard copy  
- copy `.vimrc` and `.vim` to root

Install Plugins using vim native package manager
```
$ cd ~/.vim/pack/plugins/start
$ git clone https://github.com/pangloss/vim-javascript.git
$ git clone https://github.com/MaxMEllon/vim-jsx-pretty.git
$ git clone https://github.com/prettier/vim-prettier.git

$ cd ~/.vim/pack/plugins/opt
$ git clone https://github.com/dense-analysis/ale.git
$ git clone https://github.com/neoclide/coc.nvim.git
```
#### Coc-Settings  
- `coc-settings.json` present in .vim will be used
- refer `.config` to install extensions

### Nord theme
https://github.com/nordtheme/terminal-app

### tmux
```
brew install tmux
# to enable copy command
brew install reattach-to-user-namespace
```

### node
use nvm and set path in bash_profile



