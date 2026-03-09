# syntax=docker/dockerfile:1
FROM alpine:latest

COPY <<EOF /etc/hello.conf
message=Hello World
version=1.0
env=production
EOF

CMD ["cat", "/etc/hello.conf"]