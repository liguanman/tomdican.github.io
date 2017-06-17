Hexo-Theme-Wixo
===
个人定制版本：去掉标题代码块的颜色区分，去掉边框，修复toc过长的样式问题，当toc过长时显示滚动条,v1.0以上都为个人定制；
wixo原版为[v0.0](https://coding.net/u/tomdican/p/tomdican.coding.me/git/tree/v0.0/themes/wixo)

Turn your Hexo into a Wiki!

* [Demo](http://tomdican.xyz)

## Requirements ##

* Hexo >= 3.0
* [hexo-tag-bootstrap](https://github.com/wzpan/hexo-tag-bootstrap) >= 0.0.8 (optional)

## Features ##

* **Simple** - keep it simple and stupid;
* **Bootstrap** - get the power of Twitter Bootstrap with minimal hassle;
* **Notebook** - notebook-aware post arrangement and pagination. A category is a notebook;
* **Scrollspy** - automatically updating ToC targets based on scroll position;
* **Local Search Engine** - a build-in local search engine, with the help of [hexo-generator-search](https://github.com/paichyperiondev/hexo-generator-search).
* **Tag plugins** - luxuriant Bootstrap tag plugins, provided by [hexo-tag-bootstrap](https://github.com/wzpan/hexo-tag-bootstrap), including:
  - textcolor - a paragraph of text with specified color;
  - button - a button with target links, text and specified color;
  - label - a label with text and specified color;
  - badge - a badge with text;
  - alert - alert messages with text and specified color;

## Install ##

1) install theme:

``` sh
$ git clone https://github.com/wzpan/hexo-theme-wixo.git themes/wixo
```

2) install [hexo-generator-search](https://github.com/paichyperiondev/hexo-generator-search):

``` sh
$ npm install hexo-generator-search --save
```

3) install [hexo-tag-bootstrap](https://github.com/wzpan/hexo-tag-bootstrap) (optional):

``` sh
$ npm install hexo-tag-bootstrap --save
```

## Enable ##

Modify `theme` setting in your `_config.yml` to `wixo`.

## Update ##

``` sh
$ cd themes/wixo
$ git pull
```

## Configuration ##

```
rss: atom.xml
fancybox: true
favicon: favicon.png
inverse_sort: false
fold: true
google_analytics:
scratch_name: Scratch
search:
  path: search.xml
  field: all
```

* **rss** - RSS link
* **fancybox** - enable [Fancybox](http://fancyapps.com/fancybox/)
* **inverse_sort** - whether to sort all notes inversely. By default wixo will sort all notes chronologically.
* **fold** - whether to fold all the notebooks
* **google_analytics** - Google Analytics ID
* **scratch_name** - Notebook name of posts without categories variables

## Front-Matter ##

* **toc** - renders a table of contents

For example:

```
title: Tag Plugins
date: 2014-03-16 10:17:16
categories: Docs
toc: true
---
```

## License ##

This theme is provided under [MIT License](http://opensource.org/licenses/MIT).

## Credits ##

* The theme is built based on [Twitter-Bootstrap 3.1.1](getbootstrap.com/3.1.1/);
* The beautiful icons are from [Font Awesome](http://fortawesome.github.io/Font-Awesome/icons/).
