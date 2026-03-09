# syntax=docker/dockerfile:1
FROM alpine:latest

RUN <<EOF
  apk update
  apk add --no-cache curl
  echo "Setup complete!"
EOF

CMD ["curl", "--version"]