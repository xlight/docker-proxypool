FROM python:2-slim
WORKDIR /www
RUN pip install requests gevent lxml beautifulsoup4
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/* && apt-get purge -y --auto-remove
RUN curl -L -o /root/ProxyPool.zip https://github.com/Greyh4t/ProxyPool/archive/master.zip && \
    cd /root && unzip ProxyPool.zip && mv ProxyPool-master/* /www/
RUN sed -i 's/proxysites = \[/proxysites = [ { "url": "http:\/\/xlight-proxylists\/proxy.txt","range": [],  "pattern": "^(?P<ip>(?:\d{1,3}\.){3}\d{1,3}):(?P<port>\d{1,5})$"}, /' /www/proxysites.py
EXPOSE 8000
CMD python proxypool.py
