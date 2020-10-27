FROM alpine:latest
MAINTAINER C.J. May

EXPOSE 1080

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add -q --progress --no-cache --update openvpn dante-server wget ca-certificates bind-tools unzip runit && \
	wget -q https://www.privateinternetaccess.com/openvpn/openvpn.zip \
			https://www.privateinternetaccess.com/openvpn/openvpn-strong.zip \
			https://www.privateinternetaccess.com/openvpn/openvpn-tcp.zip \
			https://www.privateinternetaccess.com/openvpn/openvpn-strong-tcp.zip && \
	mkdir -p /openvpn/ && \
	unzip -q openvpn.zip -d /openvpn/udp-normal && \
	unzip -q openvpn-strong.zip -d /openvpn/udp-strong && \
	unzip -q openvpn-tcp.zip -d /openvpn/tcp-normal && \
	unzip -q openvpn-strong-tcp.zip -d /openvpn/tcp-strong && \
	apk del -q --progress --purge unzip wget && \
	rm -rf /*.zip /var/cache/apk/*

COPY ./app /app
COPY ./etc /etc

RUN chmod 500 /app/ovpn/run /app/init.sh

ENV REGION="US East" \
	USERNAME="" \
	PASSWORD="" \
	ENCRYPTION=strong \
	PROTOCOL=udp \
	DNS="208.67.222.222 208.67.220.220"

CMD ["runsvdir", "/app"]
