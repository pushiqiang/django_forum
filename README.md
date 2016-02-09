# django_forum
This is a small and simple forum which uses the Django Framework (written in Python language).<br>
这是一个基于django的小型论坛系统

这是个基于 Python django 的小型论坛系统
---
本系统实现了一般论坛的主要功能，包括发帖，评论，评论回复，评论通知，加好友，好友消息,消息通知，简单积分规则。

由于作者的前台技术不行，所以前台页面随便找了两个模版套上，大部分页面都只有模版标签，大家就看个功能吧，前台厉害的自己写个漂亮的页面把标签套上就可以了。
<br>

部署于新浪云SAE (django1.5)<br>
python 2.7 + django 1.7<br>
demo演示:[http://pushiqiang.sinaapp.com/](http://pushiqiang.sinaapp.com/)<br>
github项目:[https://github.com/pushiqiang/django_forum.git](https://github.com/pushiqiang/django_forum.git)<br>
qq:983003089

功能：
---
1.发帖，删帖，编辑功能，使用tinymce富文本编辑器。<br>
2.多级评论，评论单级列表显示。<br>
3.加好友功能，好友消息功能，贴子评论回复通知功能。<br>
4.实现了用户注册,登陆功能（头像，密码更改，密码找回功能还未实现），通过邮箱通知注册用户。<br>
5.论坛在线人数统计，帖子评论/浏览数统计。<br>
6.简单的积分规则，发帖+5，登录+1，评论+3<br>
<br>

使用到的技术：
---
1.中间件技术（实现在线人数统计）。<br>
2.自定义过滤器（好友判断)。<br>
3.通用类视图（ListView，DetailView，CreateView，UpdateView，DeleteView）。<br>
4.django信号机制+ContentType机制(实现帖子消息评论回复功能）。<br>
5.少量缓存功能。<br>

<br>
PS：在网上找了很久基于django的论坛系统，有很多blog系统，却很少发现forum系统，有个lbforum系统还是个论坛引擎框架，故一直想自己写个小微型的django论坛系统，于是趁着过年几天的空闲写了这么个系统，权当练手了，可能还有很多bug和待改善的地方，大神勿笑，有兴趣的朋友可以看看。
