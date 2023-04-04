# Mirror-it
One Command to mirror any website, powered by caddy and docker.

- Can be used to build a mirror site for a website that cannot be accessed, for friends to use.

[中文说明](README.cn.md)

## Quick Start
### Mirror Google
if you have docker installed, you can run the following command to mirror google.com on port 8888
```bash
docker run --name mirror-it -p 8888:888 -e SITE="https://www.google.com" mereith/mirror-it
```
### Install Docker
if you don't have docker installed, you can use the following link to install it:
```bash
curl -fsSL https://get.docker.com | bash -s docker
```

## Authentication
To prevent the mirror site from being abused, you can set up authentication, so that only people who know the password can access the mirror site. Here is an example, the account password is `admin`:
```bash
docker run --name mirror-it -p 8888:888 \
  -e SITE="https://www.google.com" \
  -e USER="admin" \
  -e PASSWORD="admin" \
  -e ENABLE_AUTH="true" \
  mereith/mirror-it
```
## Environment Variables
| Environment Variable | Description |
| --- | --- |
| USER | Username |
| PASSWORD | Password |
| SITE | Site to mirror |
|ENABLE_AUTH| set true to enable Authentication|