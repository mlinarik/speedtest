FROM ubuntu:latest as builder

RUN  apt update && apt install -y wget && \
  wget https://install.speedtest.net/app/cli/ookla-speedtest-1.1.1-linux-x86_64.tgz -P /tmp && \
  tar -xf /tmp/ookla-speedtest-1.1.1-linux-x86_64.tgz -C /tmp
  
FROM ubuntu:latest as runtime
 
RUN mkdir /app
 
COPY --from=builder /tmp/speedtest* /app
