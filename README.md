# 北京语言大学 $\LaTeX$ 学位论文模板

本模板是由BLCU-ICALL实验室所维护的北京语言大学硕博学位论文 $\LaTeX$ 模板（非官方）

模板格式参考北京语言大学研究生院官方学位材料：[硕士学位材料](https://yjsy.blcu.edu.cn/art/2023/10/19/art_13228_1169673.html)  [博士学位材料](https://yjsy.blcu.edu.cn/art/2023/10/19/art_13228_1169675.html) 

目前该项目仍在开发完善中，欢迎提交 bug/issue

## 下载模版
可直接 `clone` 本项目或下载 [blcuthesis-main.zip](https://github.com/blcuicall/blcuthesis/archive/refs/heads/main.zip)
```bash
git clone https://github.com/blcuicall/blcuthesis.git
```
模板仍在更新中，且只维护最新版。如有问题，可以先尝试使用最新模版。

## 使用模版
### 本地编译
本模板采用 XeLaTeX 编译，推荐使用本地编辑。 

在编译前需在本地安装对应的 TexLive 发行版:  [Windows](https://www.tug.org/texlive/windows.html)  [MacOS](https://tug.org/mactex/)

我们推荐使用 VSCode 进行编译: [VSCode](https://code.visualstudio.com/) ，安装 “Latex Workshop” 拓展，推荐编译配置如下：

```
{
    // LaTeX
    // 不在保存的时候自动编译
    "latex-workshop.latex.autoBuild.run": "never",
    // 编译工具
    "latex-workshop.latex.tools": [
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-pdf",
                "%DOCFILE%"
            ]
        },
        {
            "name": "pdflatex",
            "command": "pdflatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOCFILE%"
            ]
        },
        {
            "name": "bibtex",
            "command": "bibtex",
            "args": [
                "%DOCFILE%"
            ]
        }
    ],
  // 编译命令
    "latex-workshop.latex.recipes": [
        {
            "name": "xelatex",
            "tools": [
                "xelatex"
            ],
        },
        {
            "name": "xelatex*2",
            "tools": [
                "xelatex",
                "xelatex"
            ],
        },
        {
            "name": "pdflatex",
            "tools": [
                "pdflatex"
            ]
        },
        {
            "name": "xe->bib->xe->xe",
            "tools": [
                "xelatex",
                "bibtex",
                "xelatex",
                "xelatex"
            ]
        },
        {
            "name": "pdf->bib->pdf->pdf",
            "tools": [
                "pdflatex",
                "bibtex",
                "pdflatex",
                "pdflatex"
            ]
        }
    ],

    "latex-workshop.latex.clean.fileTypes": [  //设定清理文件的类型  
        "*.aux",  
        "*.bbl",  
        "*.blg",  
        "*.idx",  
        "*.ind",  
        "*.lof",  
        "*.lot",  
        "*.out",  
        "*.toc",  
        "*.acn",  
        "*.acr",  
        "*.alg",  
        "*.glg",  
        "*.glo",  
        "*.gls",  
        "*.ist",  
        "*.fls",  
        "*.log",  
        "*.fdb_latexmk",  
        "*.nav",  
        "*.snm",  
        "*.synctex.gz"  
    ],
    "debug.console.fontSize": 13,
    "editor.fontSize": 15,
    "security.workspace.trust.untrustedFiles": "open"
}
```

选择 xe->bib->xe->xe 进行完整项目编译

### Overleaf编译
由于编译方式的原因，Overleaf 普通用户线上编译可能会出现编译超时等问题，标准版及以上用户则不存在此类问题

编译时，设置编译方式为 XeLatex 即可进行编译

# 致谢

* 感谢 [@cunliangkong](https://github.com/cunliangkong) 师兄对本模板的构建
* 感谢 [@chongruining](https://github.com/chongruining) 和 [TreemanCHou](https://github.com/TreemanCHou) 对本模板的完善与补充



