FROM alpine

LABEL maintainer="zentao Docker Maintainers <chaiyd.cn@gmail.com>"

#setting time zone 
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add tzdata openjdk8 \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

RUN wget http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar xzvf apache-maven-3.6.3-bin.tar.gz
RUN cp -R apache-maven-3.6.3 /usr/local/bin
RUN export PATH=apache-maven-3.6.3/bin:$PATH
RUN export PATH=/usr/local/bin/apache-maven-3.6.3/bin:$PATH
RUN ln -s /usr/local/bin/apache-maven-3.6.3/bin/mvn /usr/local/bin/mvn
#RUN ls -l /usr/local/bin
RUN echo $PATH