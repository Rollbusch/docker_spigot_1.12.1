FROM ubuntu:22.04

WORKDIR /app
COPY . .

RUN apt-get -y update
RUN apt-get install -y git openjdk-21-jdk-headless
RUN java -jar BuildTools.jar -rev 1.21.1 

RUN apt-get install -y dos2unix
RUN dos2unix start.sh

RUN chmod +x start.sh

CMD ["./start.sh"]

EXPOSE 25565