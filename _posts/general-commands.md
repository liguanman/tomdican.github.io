---
title: general-tech-tricks
date: 2017-2-23  13:51:25
updated: 2017-2-23 13:51:25
tags: guide,command
categories: Docs
toc: true
---

## shell

1. go to the specified dir
```bash
. ./cd.sh
```

## jquery-css

1. different from val(),text(),html();

2. selector
	- first-child()
	- eq(),gt(),lt()

3. button press style（bootstrap）
	- .btn-default:hover,.btn-default:active,.btn-default:focus {
		  background-color: gray;
		  box-shadow: none;
  }

4. input validation（bootstrap）
	- [refrence](https://stackoverflow.com/questions/32933165/validate-input-fields-on-bootstrap-modal-window-button-clicks-using-angular)
	- disable input validation , remove control-lable class
	
5. stack order of the element
		z-index: 1;z-index:-1
		
6. jquery change  css value，$( this ).css( "width", "+=200" )

7. jquery add event to new element
```html
$("#search-info").on("click","button",function () {
    console.log("1");
	var p = $(this).parent();
    var bookReferrerWeiboUrl = p.find("a").attr("href");
});
```

## java
1. DOM child tag operator
```java
public static Element getDirectChild(Element parent, String name)
{
    for(Node child = parent.getFirstChild(); child != null; child = child.getNextSibling())
    {
        if(child instanceof Element && name.equals(child.getNodeName())) return (Element) child;
    }
    return null;
}
```