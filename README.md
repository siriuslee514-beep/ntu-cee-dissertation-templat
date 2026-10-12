# NTU CEE MSc Dissertation LaTeX Template

适用于 NTU School of Civil & Environmental Engineering MSc dissertation 的非官方 LaTeX 模板。依据 2026 年 3 月 17 日论文指南及 2026 年 1 月 23 日官方 Word 封面/声明模板整理。使用前应核对学院最新要求。

## 快速开始

1. 下载整个仓库，使用 Antigravity 或 VS Code 打开文件夹。
2. 安装 TeX Live 或 MiKTeX，确保 `xelatex` 和 `biber` 在 PATH 中；安装 LaTeX Workshop 扩展。
3. 需要 Times New Roman 字体。模板不分发字体。环境未安装时，可在有合法使用权限的前提下，将 `times.ttf`、`timesbd.ttf`、`timesi.ttf`、`timesbi.ttf` 放入 `fonts/`。
4. 打开 `main.tex`，填写标题、姓名、专业和年份，替换摘要、致谢和正文示例。
5. 保存时自动编译；也可选择扩展中的完整编译方案。

终端编译（Windows/macOS/Linux）：

```sh
xelatex -synctex=1 -interaction=nonstopmode -halt-on-error main.tex
biber main
xelatex -synctex=1 -interaction=nonstopmode -halt-on-error main.tex
xelatex -synctex=1 -interaction=nonstopmode -halt-on-error main.tex
```

Windows 可运行 `build.bat` 或 `./build.ps1`。如工具未加入 PATH，可使用 `./build.ps1 -TexBin "你的TeX安装目录/bin/windows"`；编辑器设置中的工具路径也需相应调整。脚本默认不打开外部 PDF，使用 `-OpenPdf` 可打开。

## 文件

| 文件 | 用途 |
|---|---|
| main.tex | 个人信息、声明和论文正文 |
| cee-format.sty | 格式、封面、页码及 APA 设置 |
| references.bib | 真实文献数据库，目前为空 |
| ntu-logo.png | 来自官方 Word 模板的 NTU 校徽 |
| DECLARATIONS.md | 声明填写说明及官方示例 |
| .vscode/settings.json | 保存自动编译、PDF 预览和完整编译方案 |

## 格式及来源

- A4，单面纵向，四边 2.54 cm。
- Times New Roman 12 pt，正文 1.5 倍行距。
- 封面标题 24 pt、姓名 18 pt、学院名 15 pt；声明标题 14 pt。
- 前置顺序：封面、三份声明、摘要、致谢、可选缩写/符号/图/表清单、目录。
- References 在结论之后、附录之前；没有文献时仍显示标题和目录项。
- APA 引用由 biblatex-apa 实现，采用 APA 7；学院指南未指定版次。使用 `\parencite{key}` 和 `\textcite{key}`。
- 页码位置、正文标题层级、段落缩进及部分封面留白是 LaTeX 排版选择，非 Word 的逐像素复刻。

来源为用户提供的 `Dissertation Guidelines for Students_17 Mar 26 (1).pdf` 与 `Dissertation Template_23 Jan 26.docx`。原始文件、个人研究正文、签名、字体及编译缓存不随仓库上传。此前参考的 EEE 模板项目：https://github.com/jackieyyang/ntu-dissertation-template 。本仓库针对 CEE 要求重新组织。

## 声明与提交

三份声明采用官方文本。AI 披露 A/B/C、作者贡献 A/B 尚未选择，必须依据实际情况填写并删除不适用选项；本人和导师的签名、日期均留空。官方作者发表示例不是你的成果，不能照抄为个人声明。

指南列出 10,000–15,000 words（不计图表、附录、参考文献等）和 60–100 页。模板不自动保证长度。提交前核对正式要求、全部占位内容、引用和页码，并另行准备所需提交材料。

无真实引用时出现 `Empty bibliography` / `no citations` 警告属于预期。源码与 PDF 跳转依赖 `.synctex.gz`，编译命令须保留 `-synctex=1`。

## 权利说明

本项目非 NTU 官方发布或背书。NTU 名称、校徽和官方声明文本的权利归相应权利人；包含这些材料不意味着获得商标或其他用途的许可。字体未分发。本仓库未附加通用开源许可证。
