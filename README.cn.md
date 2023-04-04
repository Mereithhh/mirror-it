# Mirror-it
一键镜像任何网站，基于 caddy 和 docker。

[English](README.md)

## 快速开始
### 镜像 Google
如果你已经安装了 docker，可以运行下面的命令来镜像 google.com，端口为 8888
```bash
docker run --name mirror-it -p 8888:888 -e SITE="https://www.google.com" mereith/mirror-it
```
### 安装 Docker
如果你没有安装 docker，可以使用下面的链接来安装：
```bash
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```

## 加密
为了防止镜像站被滥用，可以设置加密，只有知道密码的人才能访问镜像站。下面是一个例子，账号密码为 `admin`：
```bash
docker run --name mirror-it -p 8888:888 \
  -e SITE="https://www.google.com" \
  -e USER="admin" \
  -e PASSWORD="admin" \
  -e ENABLE_AUTH="true" \
  mereith/mirror-it
```


## 环境变量
| 环境变量 | 说明 |
| --- | --- |
| USER | 用户名 |
| PASSWORD | 密码 |
| SITE | 要镜像的网站 |
|ENABLE_AUTH|是否启用加密，true 启用，其他不启用|