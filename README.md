# docker-murmur
Dockerized murmur server on Alpine Linux

Clone this repo, edit the config file `murmur.ini`, add `fullchain.pem` and `privkey.pem` certificate files (Let's Encrypt FTW) and ...

## Ship it!
```
docker build -t mfin/murmur .
docker run -d -p 64738:64738 mfin/murmur
```