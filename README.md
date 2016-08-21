说明 
====

一个Nodejs+Redis+Backend Service的例子。部署之后，每次访问，会返回当前用户的IP地址和此IP地址总计访问的次数。访问次数保存在Redis里。如果配置了环境变量`BACKEND`，每次请求，都会向`BACKEND`发送一次请求。

部署
====

为了能运行此程序，你需要先安装Docker和docker-compose，然后运行`docker-compose up`，运行成功后访问`http://localhost:3000/`，如果Docker在远程，需要修改对应的IP地址。

