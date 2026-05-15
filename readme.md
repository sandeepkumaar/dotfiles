## MAC Setup

### brew & git
Instal brew
- brew install git (installs xcode)

For installing without sudo
```
$ mkdir ~/homebrew
$ curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip-components 1 -C homebrew
```

### Shell
- Install oh-my-zsh: https://ohmyz.sh/

### dotfiles
```bash
git clone https://github.com/sandeepkumaar/dotfiles ~/dotfiles
cd ~/dotfiles && bash setup.sh
```

Files managed by setup.sh:
- `~/.tmux.conf`
- `~/.bashrc`
- `~/.zshrc`
- `~/.vimrc`
- `~/.config/nvim`

### Shell Configuration
2 types of Shells 
- Login Shell: Executed when User logs in physically or via ssh
- Non-Login Shell: Executed when Terminal window opens

Linux: Uses `bash_profile` for Login and `bashrc` for Non-login shells
MacOs(Old): Always uses `bash_profile` Login and Non-login shells
MasOs(New): Uses `.zhsrc` for both Login and Non-login shells

Given these behaviours, we keep all common configs in `bashrc`   
In Linux: bash_profile -> bashrc
In MacOs: zshrc -> bash_profile -> bashrc  

bash_profile will have User specific settings

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

### vscode/windsurf
Copy `./vscode-settings.json`


## TODO
- Replace Eslint + Prettier with Biome 
- Keep a list of most used global npm packages, global package.json ? 

