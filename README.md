## ✨Neovim 配置

这是一个基于  [AstroNvim](https://github.com/AstroNvim/AstroNvim) 的 Neovim 配置。


##  🚀 安装步骤

### Mac / Linux:

备份：
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

安装：
```bash
git clone https://github.com/jinli-stat/nvim.git ~/.config/nvim
```

### Windows:

#### 使用命令提示符 (cmd)

备份：
```cmd
move "%LOCALAPPDATA%\nvim" "%LOCALAPPDATA%\nvim.bak"
move "%LOCALAPPDATA%\nvim-data" "%LOCALAPPDATA%\nvim-data.bak"
move "%LOCALAPPDATA%\nvim-state" "%LOCALAPPDATA%\nvim-state.bak"
move "%LOCALAPPDATA%\nvim-cache" "%LOCALAPPDATA%\nvim-cache.bak"
```

安装：

```cmd
git clone https://github.com/jinli-stat/nvim.git %LOCALAPPDATA%\nvim
```

#### 使用 PowerShell

备份：
```powershell
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak -ErrorAction SilentlyContinue
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak -ErrorAction SilentlyContinue
Move-Item $env:LOCALAPPDATA\nvim-state $env:LOCALAPPDATA\nvim-state.bak -ErrorAction SilentlyContinue
Move-Item $env:LOCALAPPDATA\nvim-cache $env:LOCALAPPDATA\nvim-cache.bak -ErrorAction SilentlyContinue
```

安装：
```powershell
git clone https://github.com/jinli-stat/nvim.git $env:LOCALAPPDATA\nvim
```

