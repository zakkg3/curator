FROM alpine:3.7
ENV DRYRUN ""
COPY config/action-file.yml /curatorcfg/action-file.yml
COPY config/config.yml /curatorcfg/config.yml

RUN apk update && \
    apk --no-cache add python py-setuptools py-pip gcc libffi py-cffi python-dev libffi-dev py-openssl musl-dev linux-headers openssl-dev libssl1.0 curl && \
    pip install elasticsearch-curator && \
    apk del py-pip gcc python-dev libffi-dev musl-dev linux-headers openssl-dev && \
    sed -i '/import sys/a urllib3.contrib.pyopenssl.inject_into_urllib3()' /usr/bin/curator && \
    sed -i '/import sys/a import urllib3.contrib.pyopenssl' /usr/bin/curator && \
    sed -i '/import sys/a import urllib3' /usr/bin/curator && \
    curl -L https://github.com/remind101/ssm-env/releases/download/v0.0.2/ssm-env > /usr/local/bin/ssm-env && \
    cd /usr/local/bin && \
    chmod +x ssm-env

CMD echo '20  4  *  *  *    /usr/local/bin/ssm-env -with-decryption curator --config /curatorcfg/config.yml /curatorcfg/action-file.yml' $DRYRUN > /etc/crontabs/root; crond -l 2 -f
