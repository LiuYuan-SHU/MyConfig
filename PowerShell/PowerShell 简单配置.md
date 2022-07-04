# PowerShell 简单配置

Created: July 4, 2022 9:23 AM
Tags: PowerShell

[How to set up PowerShell prompt with Oh My Posh on Windows 11](https://www.youtube.com/watch?v=5-aK2_WwrmM)

# 一些要素

- **Hack(NerdFonts)**: 一个字体
- **Scoop:** 一个命令行安装程序
- **Oh My Posh**: 主题引擎
- **Terminal-Icons**: 文件和文件夹图标
- **PSReadline**: 自定义文本编辑环境，自动补全
- **z**: 实现目录之间的跳转
- **Fzf, PSFzf**: 模糊查询

# Windows PowerShell 配置文件

```powershell
$env:USERPROFILE/.config
└━━ powershell
		 |   # config file —— PowerShell配置文件
		 ├━━ user_profile.ps1
		 |   # prompt customization —— Oh My Posh配置文件
		 └━━ my.omp.json
```

# 配置步骤

## 安装字体

[Releases · ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts/releases)

安装***Hack.zip***中的***Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf***

然后将字体设置为对应的字体

## PowerShell的安装和Terminal Preview配置

### 安装PowerShell

![Untitled](PowerShell%20%E7%AE%80%E5%8D%95%E9%85%8D%E7%BD%AE%208e014b1719b14aceaef2f5249a4e664a/Untitled.png)

### 将PowerShell设置为默认启动项

![Untitled](PowerShell%20%E7%AE%80%E5%8D%95%E9%85%8D%E7%BD%AE%208e014b1719b14aceaef2f5249a4e664a/Untitled%201.png)

### 更改终端的配置颜色

在设置中打开JSON配置文件，找到`One Half Dark(modified)`，复制一份，开始做自己的修改：

1. 设置一个能够区分的名字
2. 将`background`的值改为`"#001B26"`

## 安装Scoop

```powershell
iwr -useb get.scoop.sh | iex
scoop install curl sudo jq
curl 'https://api.inkdrop.app' | jq .
# 安装git
winget install -e --id Git.Git
# 安装neovim
scoop install neovim gcc
```

## 配置PowerShell

```powershell
mkdir .config/powershell
nvim .config/powershell/user_profile.ps1
```

**user_profile.ps1**

```powershell
# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\tig.exe'
```

---

```powershell
mkdir ~/Documents/PowerShell
nvim $PROFILE.CurrentUserCurrentHost
```

**Microsoft.PowerShell_profile.ps1**

```powershell
. $env:USERPROFILE\.config\powershell\user_profile.ps1
```

在设置完之后记得重新打开一个窗口检查配置是否成功

## 安装Oh My Posh

```powershell
Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force
# winget install JanDeDobbeleer.OhMyPosh -s winget
```

在配置文件`~/.config/powershell/user_profile/ps1`中添加字段：

```powershell
# Prompt
Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt Paradox
```

视频中没有使用`oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\Paradox" | Invoke-Expression`而是使用了被我注释掉的上方两个语句。但是在重新加载配置文件的时候发生了报错。大意是不再支持这样的加载方式，通过[官方文档](https://ohmyposh.dev/docs/migrating)查询到可以使用新的方式来添加依赖。

******你可以在`$env:POSH_THEMES_PATH`查看有哪些主题，你也可以在[这个地方](https://www.cnblogs.com/jiuman/p/15203572.html)查看你喜欢的主题。如果你每次打开PowerShell的时间很长，或者是每输入一条指令就需要等待很久，说明你的主题加载失败了。**

## 自定义Oh My Posh——配置`my.omp.json`

> 文件路径：`~/.config/powershell`
> 

**my.omp.json:**

```json
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "alignment": "left",
      "segments": [
        {
          "background": "#0077c2",
          "foreground": "#ffffff",
          "leading_diamond": "\u256d\u2500\ue0b6",
          "style": "diamond",
          "template": " {{ .Name }} ",
          "type": "shell"
        },
        {
          "background": "#ef5350",
          "foreground": "#fffb38",
          "properties": {
            "root icon": "\uf292"
          },
          "style": "diamond",
          "template": "<parentBackground>\ue0b0</>\uf0e7 ",
          "type": "root"
        },
        {
          "background": "#444444",
          "foreground": "#e4e4e4",
          "powerline_symbol": "\ue0b0",
          "properties": {
            "style": "full"
          },
          "style": "powerline",
          "template": " {{ .Path }} ",
          "type": "path"
        },
        {
          "background": "#fffb38",
          "background_templates": [
            "{{ if or (.Working.Changed) (.Staging.Changed) }}#ffeb95{{ end }}",
            "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#c5e478{{ end }}",
            "{{ if gt .Ahead 0 }}#c792ea{{ end }}",
            "{{ if gt .Behind 0 }}#c792ea{{ end }}"
          ],
          "foreground": "#011627",
          "powerline_symbol": "\ue0b0",
          "properties": {
            "branch_icon": "\ue725",
            "fetch_status": true,
            "fetch_upstream_icon": true
          },
          "style": "powerline",
          "template": " {{ .HEAD }} {{ if .Working.Changed }}{{ .Working.String }}{{ end }}{{ if and (.Working.Changed) }}|{{ end }}{{ if .Staging.Changed }}<#ef5350>-uf046{{ .Staging.String }}</>{{ end }} ",
          "type": "git"
        }
      ],
      "type": "prompt"
    },
    {
      "alignment": "right",
      "segments": [
        {
          "background": "#303030",
          "foreground": "#3c873a",
          "leading_diamond": "\ue0b6",
          "properties": {
            "fetch_package_manager": true,
            "npm_icon": " <#cc3a3a>\ue616</>",
            "yarn_icon": " <#347cba>\ue74e</>"
          },
          "style": "diamond",
          "template": " \ue718{{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }}",
          "trailing_diamond": "\ue0b4",
          "type": "node"
        },
        {
          "background": "#40c4ff",
          "foreground": "#ffffff",
          "invert_powerline": true,
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": " \uf5ef{{ .CurrentDate | date .Format }} ",
          "trailing_diamond": "\ue0b4",
          "type": "time"
        }
      ],
      "type": "prompt"
    },
    {
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "foreground": "#21c7c7",
          "style": "plain",
          "template": "\u2570\u2500",
          "type": "text"
        },
        {
          "foreground": "#e0f8ff",
          "properties": {
            "always_enabled": true,
            "display_exit_code": false,
            "error_color": "#ef5350"
          },
          "style": "plain",
          "template": "\u276f ",
          "type": "text"
        }
      ],
      "type": "prompt"
    }
  ],
  "osc99": true,
  "version": 2
}
```

将配置文件加载放到PowerShell配置文件加载中：

```powershell
# Load prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'my.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression
```

## 安装终端图标

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Import-Module Terminal-Icons
```

![Untitled](PowerShell%20%E7%AE%80%E5%8D%95%E9%85%8D%E7%BD%AE%208e014b1719b14aceaef2f5249a4e664a/Untitled%202.png)

添加配置文件加载：

```powershell
# Icons
Import-Module -Name Terminal-Icons
```

## 安装z：文件夹跳转

```powershell
Install-Module -Name z -Force
```

## 安装PSReadLine：自动补全

```powershell
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Set-PSReadLineOption -PredictionSource History
# 重启PowerShell
Set-PSReadLineOption -PredictionViewStyle ListView
```

![Untitled](PowerShell%20%E7%AE%80%E5%8D%95%E9%85%8D%E7%BD%AE%208e014b1719b14aceaef2f5249a4e664a/Untitled%203.png)

添加配置文件：

```powershell
# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
```

## 安装Fzf：Fuzzy Finder

```powershell
scoop install fzf
# 重启PowerShell
Install-Module -Name PSFzf -Scope CurrentUser -Force
# 设置快捷键
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
```

![Untitled](PowerShell%20%E7%AE%80%E5%8D%95%E9%85%8D%E7%BD%AE%208e014b1719b14aceaef2f5249a4e664a/Untitled%204.png)

添加配置文件：

```powershell
# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
```