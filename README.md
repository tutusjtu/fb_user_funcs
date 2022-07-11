# fb_user_funcs

FigureBest 扩展功能 | 编写教程 | 图图提供的扩展

---

# 1. 扩展简介

从FB4.**4**开始支持`扩展功能`, 将**fb_user_func[x].m**改成**fb_user_func.m**放置在FigureBest项目文件夹下即可使用。

![image](https://user-images.githubusercontent.com/104671948/177692067-b68d44bf-bd45-4e1c-8925-e5009efe189f.png)

# 2. 自定义扩展

请自行编写函数文件fb_user_func.m放置在FB项目目录下

[扩展编写教程](https://www.bilibili.com/video/BV1fN4y1g7Fb)

```
function fb_user_func(figureNumbers,axesNumbers,co)
fb会自动传入下列参数
figureNumbers - figure编号向量
axesNumbers - 轴号向量
co - 当前色卡
```

# 3. 图图提供的扩展列表

## fb_user_func1.m : 
降低marker的密度
## fb_user_func2.m : 
去除图例的标题
## fb_user_func3.m : 
可以单独设置中文和英文字体
