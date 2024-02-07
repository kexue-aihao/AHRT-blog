# 如何创建免费的Cloudflare账户且搭建免费的Vless节点

------------------------

创建Cloudflare门户网站

> https://dash.cloudflare.com/sign-up

Cloudflare的门户网站访问还是比较正常的

解析正常的地区大致预览图:

![image](/img/如何搭建Vless免费节点/Cloudflare网站解析1.png)

不能正确解析到网站的就这一个地区，还是亘古不变的移动大内网

![image](/img/如何搭建Vless免费节点/Cloudflare网站解析1.png)

1.打开这个Cloudflare的门户网站，然后通过匿名邮箱来进行注册

2.注册成功之后就可以搭建Vless节点了

搭建Vless步骤演示图:

![image](/img/如何搭建Vless免费节点/搭建Vless节点步骤演示图.png)

![image](/img/如何搭建Vless免费节点/搭建Vless节点步骤演示图2.png)

3.搭建Vless节点的源代码我会放在仓库对应的文件夹里面，自行Copy就可以了

UUID是怎么获取呢，其实有一个网站可以在线生成UUID，如果你担心UUID会泄露的话，你直接用V2rayN生成一个UUID就可以了

> UUID在线生成网站:https://1024tools.com/uuid.

4.完成第二步的操作之后就可以点击完成并部署了

![image](/img/如何搭建Vless免费节点/保存并部署.png)

5.复制部署后的链接

![image](/img/如何搭建Vless免费节点/保存并部署2.png)

6.粘贴到另外一个空白的选项卡，并且在这个链接的斜杠后面粘贴你的UUID，然后回车，即可获取到搭建好的Vless节点链接，一般正常情况，我们选择非TLS的Vless节点链接即可

7.Cloudflare优选出来的IP，我会不定时更新在我的博客里面