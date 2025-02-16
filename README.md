# fc3

Split three types of free commercial Chinese fonts based on [cn-font-split](https://github.com/KonghaYao/cn-font-split), packaged into small fonts of 300-500KB for quick loading on web pages.

[→ 中文说明](#cn)

## Usage

```css
@import url(//cdn.jsdelivr.net/npm/fc3/index.css)
```

## Body Font s

SourceHanSans-VF
https://github.com/adobe-fonts/source-han-sans/releases
https://mirrors.cloud.tencent.com/adobe-fonts/source-han-sans/Variable/TTF/

## Code Font c

[FiraCode](https://github.com/tonsky/FiraCode)

![](https://raw.githubusercontent.com/tonsky/FiraCode/master/extras/logo.svg)

## Heading Font h

Alibaba Sans ( [Download](https://www.alibabafonts.com/#/more) |  [Online Debugging](https://www.iconfont.cn/fonts/detail?spm=a313x.7781069.1998910419.d9df05512&cnid=pOvFIr086ADR) )

![](https://i-01.eu.org/1717043622.gif)

Alibaba Sans is a Simplified Chinese dual-axis variable font, which includes but is not limited to GB2312, totaling 6763 Chinese characters; 52 English uppercase and lowercase letters; and 227 commonly used punctuation marks, for a total of 7042 characters.

It is one of the few dual-axis variable Chinese fonts available domestically and internationally. The square form is solid and robust, while the round form is smooth and gentle;

The switch between square and round makes Alibaba Sans highly adaptable, also liberating more possibilities for creative expression.

The variable weight allows designers to make infinite fine adjustments, enriching creative design expression.

![](https://i-01.eu.org/1717043776.avif)

For usage, refer to [css : font-variation-settings](https://developer.mozilla.org/docs/Web/CSS/font-variation-settings)

```
font-variation-settings: 'wght' 500, 'BEVL' 10;
font-family: h;
```

## Compilation Dependency

Install `woff2_compress`

On macOS, you can

```
brew install woff2
```

<h1 id="cn">fc3 : 中文说明</h1>

基于 [cn-font-split](https://github.com/KonghaYao/cn-font-split) 切分三种免费商用的中文字体，分包为300-500KB的小字体，以便于在网页上快速加载。

## 使用

```css
@import url(//cdn.jsdelivr.net/npm/fc3/index.css)
```

## 正文字体 s

思源黑体可变版
https://github.com/adobe-fonts/source-han-sans/releases
https://mirrors.cloud.tencent.com/adobe-fonts/source-han-sans/Variable/TTF/

## 代码字体 c

[FiraCode](https://github.com/tonsky/FiraCode)

![](https://raw.githubusercontent.com/tonsky/FiraCode/master/extras/logo.svg)

## 标题字体 h

阿里妈妈方圆体 ( [下载](https://www.alibabafonts.com/#/more) |  [在线调试](https://www.iconfont.cn/fonts/detail?spm=a313x.7781069.1998910419.d9df05512&cnid=pOvFIr086ADR) )

![](https://i-01.eu.org/1717043622.gif)

阿里妈妈方圆体为一款简体中文双轴可变字体，收纳的中文字符包括但不限于 GB2312，共计6763个汉字；英文大小写共52个；常用标点符号共227个，总计7042个字符。

是目前国内外为数不多的中文双轴可变字体。方体坚实而硬朗，圆体润泽而柔美；

方圆间的切换让方圆体极具适用性，也解放了创意表达的更多可能性。

粗细的可变使得设计师具备无限微调的可能，让创意设计有了丰富表达。

![](https://i-01.eu.org/1717043776.avif)

使用请参考 [css : font-variation-settings](https://developer.mozilla.org/docs/Web/CSS/font-variation-settings)

```
font-variation-settings: 'wght' 500, 'BEVL' 10;
font-family: h;
```

## 编译依赖

安装 `woff2_compress`

macos 上可以

```
brew install woff2
```
