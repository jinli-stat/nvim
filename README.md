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

rm -rf ~/.config/nvim/.git
```

### Windows:

#### 使用命令提示符 (cmd)

备份：
```cmd
move "%LOCALAPPDATA%\nvim" "%LOCALAPPDATA%\nvim.bak"
move "%LOCALAPPDATA%\nvim-data" "%LOCALAPPDATA%\nvim-data.bak"
```

安装：

```cmd
git clone https://github.com/jinli-stat/nvim.git %LOCALAPPDATA%\nvim
```

#### 使用 PowerShell

备份：
```powershell
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```

安装：
```powershell
git clone https://github.com/jinli-stat/nvim.git $env:LOCALAPPDATA\nvim
```

