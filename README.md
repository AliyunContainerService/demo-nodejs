说明 
====

一个Nodejs+Redis+Backend Service的例子。部署之后，每次访问，会返回当前用户的IP地址和此IP地址总计访问的次数。访问次数保存在Redis里。如果配置了环境变量`BACKEND`，每次请求，都会向`BACKEND`发送一次请求。

部署
====

