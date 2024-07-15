FROM python:3-alpine
ENV TZ=Asia/Shanghai
RUN pip3 install flask requests gevent \
    && apk add bash zstd curl \
    && curl -s https://gosspublic.alicdn.com/ossutil/current/ossutil-linux-amd64.zip > /tmp/ossutil-linux-amd64.zip \
    && unzip /tmp/ossutil-linux-amd64.zip -d /tmp \
    && mv /tmp/ossutil-linux-amd64/ossutil64 /usr/local/bin/ossutil \
    && rm -rf /tmp/ossutil-linux-amd64 /tmp/ossutil-linux-amd64.zip \
    && apk cache clean
