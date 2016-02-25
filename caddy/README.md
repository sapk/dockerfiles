```

docker pull sapk/caddy
docker run -d --name caddy --restart=always  --link web-server1 --link web-server2  -p 80:80 -p 443:443 -v /data/caddy/conf:/srv/ sapk/caddy -agree -email mon@email.com

```
