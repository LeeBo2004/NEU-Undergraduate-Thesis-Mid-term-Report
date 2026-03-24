# 东北大学毕业设计（论文）中期报告 LaTeX 模板

本项目用于生成与学校《东北大学毕业设计（论文）中期报告》附件版式相匹配的 LaTeX 文档。

技术支持：ChatGPT-5.4


## 1. 项目特点

- 保留了附件中第一页顶部信息区、第二页表格区、左右边框和栏目标签的固定布局。
- 正式填写稿不再把 5 个正文栏目死板锁在固定高度里，而是像 `开题报告` 一样按内容长度连续排版。
- 支持自动续页，续页时左侧只保留空栏线，不重复写栏目名称。
- 支持三级标题、编号公式、非浮动表格、非浮动图片。
- 适合在固定表单中插入较长文字、公式、表格、PNG 截图和 PDF 矢量图。
- 图片与表格的推荐写法已经针对这套表单模板做过适配，避免普通浮动体在固定框里乱跑。

## 2. 核心文件说明

项目目录下与模板直接相关的主要文件如下：

```text
中期报告-latex/
├─ NEUBachelorMidterm.cls   # 模板类文件，控制版式、分页与命令
├─ main.tex                 # 当前主示例，演示正式填写方式
└─ README.md                # 本说明文档
```


## 3. 推荐编译环境

- 编译器：`XeLaTeX`
- 建议发行版：`TeX Live 2025` 或更新版本
- 建议系统：Windows
- 推荐编译方式：`latexmk -xelatex`

模板使用的是：

- `ctexart`
- `fontset=windows`
- `XeLaTeX`

标题字体优先尝试 `方正小标宋简体`。如果本机没有安装该字体，会自动回退到 `SimSun`，并尽量保持接近的视觉效果。

## 4. 快速开始


编译当前主示例：

```powershell
latexmk -xelatex main.tex
```



## 5. 最小使用模板

一个最小可用文档可以写成下面这样：

```tex
\documentclass{NEUBachelorMidterm}

\reportyear{2026}
\reportmonth{3}
\reportday{24}

\studentid{20221001}
\studentname{张三}
\grade{2022级}
\phone{138-0000-0000}
\email{zhangsan\_neu@mail.com}
\internshipunit{东北大学计算机科学与工程学院}
\thesistitle{面向校内知识库的检索增强问答系统设计与实现}

\stageonesummary{%
\section{前期工作}
\suojin 这里填写前一阶段工作总结。
}

\nextstageplan{%
\suojin 这里填写下一阶段工作计划。
}

\issues{%
\suojin 这里填写存在问题。
}

\othernotes{%
\suojin 这里填写其它说明。
}

\advisoropinion{%
\suojin 这里填写指导教师意见。
}

\advisorsignature{XXX}
\advisoryear{2026}
\advisormonth{3}
\advisorday{24}

\begin{document}
\makemidtermreport
\end{document}
```

## 6. 需要填写的基本信息命令

模板提供的基本信息命令如下：

```tex
\reportyear{2026}
\reportmonth{3}
\reportday{24}

\studentid{20221001}
\studentname{李明}
\grade{2022级}
\phone{138-0000-2026}
\email{liming\_cs@mail.neu.edu.cn}
\internshipunit{东北大学计算机科学与工程学院}
\thesistitle{面向校内知识库的检索增强问答系统设计与实现}

\advisorsignature{XXX}
\advisoryear{2026}
\advisormonth{3}
\advisorday{24}
```

说明：

- `\email{...}` 中如果有下划线 `_`，请写成 `\_`。
- `\thesistitle{...}` 可以写较长标题，模板会在单元格内自动换行。
- 如果指导教师签名需要打印后手写，可以把 `\advisorsignature{}` 留空。

## 7. 五个正文区域

正式填写时，正文由以下 5 个命令提供：

```tex
\stageonesummary{...}
\nextstageplan{...}
\issues{...}
\othernotes{...}
\advisoropinion{...}
```

对应关系如下：

- `\stageonesummary{...}`：前一阶段工作总结
- `\nextstageplan{...}`：下一阶段工作计划
- `\issues{...}`：存在问题
- `\othernotes{...}`：其它
- `\advisoropinion{...}`：指导教师意见

这些区域都支持：

- 多段文字
- 标题
- 公式
- 非浮动表格
- 非浮动图片
- 自动续页

## 8. 分页逻辑说明

这套模板和扫描版表单最大的区别，是正文部分采用“连续流式排版”：

- 前面的栏目写长了，后面的栏目会自然下移。
- 当前页放不下时，只把超出的部分续到下一页。
- 续页时左侧只保留边线，不重复打印“前一阶段工作总结”等文字。
- 如果你插入的是“不可拆分的大对象”，例如特别高的图片或完整表格，它可能会整体移到下一页，这是 LaTeX 的正常行为。

如果你确实想强制从新的一页开始，可以手动写：

```tex
\newpage
```

但一般不建议频繁手动断页，否则容易破坏自动分页的自然效果。

## 9. 正文书写方式

### 9.1 首行缩进

正文默认不是自动首行缩进，而是和 `开题报告` 一样，通过手动命令控制：

```tex
\suojin 这里是一段新的正文。
```

`\suojin` 表示首行缩进两个汉字宽度。

### 9.2 三级标题

模板已经配置好与 `开题报告` 一致风格的三级标题：

```tex
\section{系统分析}
\subsection{知识库构建}
\subsubsection{切分策略}
```

特点：

- `\section`：黑体、大号
- `\subsection`：黑体、略小
- `\subsubsection`：黑体、正文大小
- 标题支持自动编号
- 公式编号会按 `section` 编号，例如 `(1.1)`

### 9.3 公式

普通公式直接用标准 `equation` 环境：

```tex
\begin{equation}
\label{eq:hybrid-score}
S(d,q)=\lambda \cdot \mathrm{BM25}(d,q)+(1-\lambda)\cdot \cos(\mathbf{e}_d,\mathbf{e}_q)
\end{equation}
```

引用时：

```tex
式~\eqref{eq:hybrid-score}
```

建议：

- 公式和引用通常要编译两遍才能消除未定义提示。
- 模板中已经加载 `hyperref`，公式号和交叉引用可以点击跳转。

### 9.4 其它常用辅助命令

模板还提供了几条在正文里比较实用的辅助命令：

```tex
\tips{这是红色提示文字}
\verbx{figure/Figure_1.png}
```

说明：

- `\tips{...}`：输出红色提示文字，适合在空白模板或说明性示例中使用
- `\verbx{...}`：安全显示带下划线或特殊字符的路径、文件名、命令片段
- `\lb`、`\rb`：分别输出字面意义上的 `{` 和 `}`

## 10. 表格写法

这套模板里，推荐用“非浮动表格”，不要优先使用普通 `table` 浮动环境。

### 10.1 简单表格

最常用的是题注 + 表格主体：

```tex
{\zihao{5}
\tizhu{biao}{知识库构建阶段统计}
\biao{4}{
数据来源 & 文档数量 & 切分片段数 & 平均片段长度 \\ \midrule
培养方案与课程材料 & 38 & 1264 & 428 字 \\
实验中心与办事流程 & 21 & 643 & 395 字 \\
学院通知与常见问答 & 17 & 512 & 372 字 \\
合计 & 76 & 2419 & 407 字 \\
}
}
```

说明：

- `\tizhu{biao}{...}` 用来生成表题
- `\biao{4}{...}` 中的 `4` 表示 4 列
- 表格通常建议放在 `{\zihao{5} ... }` 或 `{\zihao{6} ... }` 中，避免过宽

### 10.2 自定义列格式表格

如果想用 `X` 列、居中列、自定义对齐方式，用 `\biaoX`：

```tex
{\zihao{5}
\tizhu{biao}{自定义列格式表格}
\biaoX{>{\centering\arraybackslash}X>{\centering\arraybackslash}X}{
字段 & 数值 \\ \midrule
A & 1 \\
B & 2 \\
}
}
```

### 10.3 宽表格

如果表格太宽，优先改用 `\fitbiao`：

```tex
{\zihao{5}
\tizhu{biao}{宽表格示例}
\fitbiao{lcccccc}{
配置方案 & Recall@5 & MRR & 答案准确率 & 平均响应时间/s & 幻觉率 & 备注 \\ \midrule
BM25 基线 & 0.71 & 0.58 & 0.63 & 0.42 & 0.18 & 无向量检索 \\
向量检索 & 0.79 & 0.64 & 0.70 & 0.57 & 0.15 & bge-m3 嵌入 \\
}
}
```

### 10.4 表格使用建议

- 尽量不要在正文区域直接写 `\begin{table}...\end{table}`。
- 如果表格超出边距，优先用 `\fitbiao`，其次减小字号。
- 如果表格仍然过宽，应该精简列数或缩短表头，而不是无限缩小字体。

## 11. 图片写法

### 11.1 图片文件放哪里

建议把所有图片统一放在当前项目的 `figure/` 文件夹中，例如：

```text
figure/Figure_1.png
figure/demo.pdf
```

### 11.2 推荐图片格式

当前本地 `XeLaTeX` 环境下，推荐使用：

- `PNG`
- `JPG` / `JPEG`
- `PDF`

实际测试结果：

- `PNG`：可用
- `PDF`：可用
- `BMP`：当前环境下不可用
- `TIF/TIFF`：当前环境下不可用

所以如果你手上是 `bmp`、`tif`、`tiff` 文件，建议先转换成 `png` 或 `pdf` 再插入。

### 11.3 固定宽度插图

如果你想精确控制图片宽度，用：

```tex
\tu{0.7\linewidth}{figure/Figure_1.png}
```

带下方图题时，用：

```tex
\tuxia{0.7\linewidth}{figure/Figure_1.png}{路径规划模块界面示意}{fig:ui}
```

注意：

- `\tu` 和 `\tuxia` 都必须显式写“宽度参数”。
- 你之前遇到的 PNG 报错，常见原因就是把图片路径误写到了宽度参数位置。

### 11.4 自动适配插图

如果你不想每次手写宽度，现在推荐直接用自动适配命令：

```tex
\tuauto{figure/Figure_1.png}
```

带下方图题：

```tex
\tuxiaauto{figure/Figure_1.png}{路径规划模块界面示意}{fig:ui}
```

自动适配策略是：

- 宽度尽量按正文宽度放置
- 同时限制最大高度
- 保持纵横比，不强行拉伸

当前默认最大高度由下列命令控制：

```tex
\setmidtermfiguremaxheight{0.26\textheight}
```

如果你觉得自动插图太小或太高，可以在插图前调整：

```tex
\setmidtermfiguremaxheight{0.32\textheight}
```

### 11.5 裁切 PDF 白边

如果插入的是 PDF 图，而图本身带有较大白边，可以用 `trim` 和 `clip`：

```tex
\tuxiaauto[trim=20bp 10bp 20bp 10bp,clip]{figure/demo.pdf}{实验结果对比}{fig:demo}
```

参数顺序固定为：

```tex
trim=左 下 右 上
```

也就是：

```tex
trim=left bottom right top
```

建议：

- `clip` 必须写，否则不会真正裁掉显示区域
- 单位建议显式写 `bp`、`pt` 或 `mm`
- 可以先从小数值开始试，再逐步增大

### 11.6 图片常用示例

插入 PNG 截图：

```tex
{\zihao{5}
\tuxiaauto{figure/Figure_1.png}{系统界面示意}{fig:ui-demo}
}
```

插入 PDF 矢量图并裁边：

```tex
{\zihao{5}
\tuxiaauto[page=1,trim=120bp 170bp 110bp 190bp,clip]{figure/abler_vs_beta_p.pdf}{性能对比图}{fig:beta-demo}
}
```

如果你一定要精确控制大小，则改用固定宽度命令：

```tex
{\zihao{5}
\tuxia[trim=120bp 170bp 110bp 190bp,clip]{0.72\linewidth}{figure/abler_vs_beta_p.pdf}{性能对比图}{fig:beta-demo}
}
```

## 12. 关于普通 `figure` / `table` 浮动体

本模板的正文区域不是普通论文那种自由版心，而是放在固定表单结构中排版。因此：

- 不推荐把标准 LaTeX 浮动体当成主力写法
- 不推荐直接照搬 IEEE 模板中的 `\begin{figure}[t] ... \end{figure}`
- 对这套模板来说，更稳的方式是 `\tuxia`、`\tuxiaauto`、`\biao`、`\fitbiao`

如果你使用普通浮动体，常见问题包括：

- 在固定框中位置漂移
- 编译报错
- 图表不在预期位置
- 页内留白异常

所以当前项目的推荐原则很明确：正文区优先使用模板提供的“非浮动命令”。

## 13. 模板提示文字开关

类文件中内置了模板提示开关：

```tex
\showtemplatehintson
\showtemplatehintsoff
```

默认状态是关闭提示：

```tex
\showtemplatehintsoff
```

如果你想显示空白模板中的红色提示文字，可在导言区手动打开：

```tex
\showtemplatehintson
```

## 14. 示例文件建议怎么用

### `main.tex`

当前主示例文件，建议优先参考。它演示了：

- 基本信息填写
- 三级标题
- 编号公式
- 普通表格
- 宽表格
- PNG 图片插入

### `blank-template.tex`

用于查看更接近附件样式的空白模板。适合：

- 对照学校附件格式
- 检查固定线框位置
- 打印空白版后手工填写

### `overflow-demo.tex`

用于测试长内容自动续页。适合：

- 检查“前一阶段工作总结”太长时的分页效果
- 验证续页时左侧栏目名不会重复打印

### `formal-migration.tex`

用于记录从其他论文或草稿向中期报告格式迁移的尝试，主要供参考，不是当前主流程。

### `ieee-compat-demo.tex`

这是早期尝试保留 IEEE 写法时留下的参考文件。当前模板仍建议以非浮动图表命令为主，不建议把它当作正式写作主入口。

## 15. 常见问题

### 15.1 交叉引用显示为 `??`

原因通常是只编译了一遍。解决方法：

```powershell
xelatex main.tex
xelatex main.tex
```

或者：

```powershell
latexmk -xelatex main.tex
```

### 15.2 图片插不进去

常见原因：

- 图片路径写错
- 图片格式不受当前编译器支持
- 使用了 `\tuxia` 却漏写宽度参数

例如错误写法：

```tex
\tuxia{figure/Figure_1.png}{图题}{fig:test}
```

正确写法：

```tex
\tuxia{0.72\linewidth}{figure/Figure_1.png}{图题}{fig:test}
```

或者更省事：

```tex
\tuxiaauto{figure/Figure_1.png}{图题}{fig:test}
```

### 15.3 图片太小或白边太大

处理方法：

- 自动模式下，调大 `\setmidtermfiguremaxheight{...}`
- 固定模式下，调大 `0.7\linewidth` 这类宽度参数
- 对 PDF 图片使用 `trim=...,clip`

### 15.4 表格超出边框

优先顺序建议如下：

1. 改用 `\fitbiao`
2. 缩短表头文字
3. 降低字号，例如 `{\zihao{5} ... }`
4. 重新设计列数

不建议靠无限缩小字体硬塞。

### 15.5 为什么上一页明明还有空白，下一段却跑到下一页了

因为图片、表格、显示公式等对象有时不能被很自然地拆开。只要对象本身较大，LaTeX 就可能把它整体放到下一页。这属于正常现象。



