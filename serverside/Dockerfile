FROM ubuntu:bionic

RUN apt-get update && apt-get install -y sudo git maven default-jre default-jdk wget
COPY runner.sh runner.sh
CMD chmod +x runner.sh && ./runner.sh
