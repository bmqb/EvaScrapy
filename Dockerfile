FROM python:alpine3.6

#ADD debian.sources.list    /etc/apt/sources.list
#RUN echo "deb-src http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "Asia/Shanghai" >  /etc/timezone && apk add --no-cache openssl-dev libffi-dev make gcc musl-dev libxml2-dev libxslt-dev git nodejs
#RUN mkdir -p ~/.pip && echo "[global]\nindex-url = http://mirrors.aliyun.com/pypi/simple/\n[install]\ntrusted-host = mirrors.aliyun.com" > ~/.pip/pip.conf

COPY . /opt/htdocs/evascrapy
WORKDIR /opt/htdocs/evascrapy
RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 6000
CMD python start.py
