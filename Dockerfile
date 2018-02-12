FROM ubuntu:latest

# ------------------------------------------------
# Package Install
# ------------------------------------------------
RUN apt-get update && apt-get -y install \
		sudo \
		vim \
		git \
		wget \
		openssh-server \
		openssh-client \
		language-pack-ja-base \
		language-pack-ja \
		tzdata

# ------------------------------------------------
# Setting SSH
# ------------------------------------------------
RUN sed -i \
	-e 's|^#PermitRootLogin .*$|PermitRootLogin no|g' \
	-e 's|^#UseDNS yes|UseDNS no|g' \
	-e 's|^PermitRootLogin .*$|PermitRootLogin no|g' \
	-e 's|^UseDNS yes|UseDNS no|g' \
	/etc/ssh/sshd_config

# ------------------------------------------------
# Setting container
# ------------------------------------------------
ADD run.sh /run.sh
RUN chmod a+x /run.sh

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV TZ Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&&  echo "Asia/Tokyo" > /etc/timezone \
&&  dpkg-reconfigure -f noninteractive tzdata

EXPOSE 22
ENTRYPOINT ["/run.sh"]
