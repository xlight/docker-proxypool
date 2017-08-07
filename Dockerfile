FROM python:slim
WORKDIR /www
RUN apt-get update && apt-get install -y curl unzip
RUN curl -L -o /root/ProxyPool.zip https://github.com/Greyh4t/ProxyPool/archive/master.zip && \
    cd /root && unzip ProxyPool.zip && mv ProxyPool-master/* /www/
RUN pip install requests gevent lxml beautifulsoup4
EXPOSE 8000
CMD python proxypool.py
