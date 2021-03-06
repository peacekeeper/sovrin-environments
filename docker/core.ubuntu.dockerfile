FROM sovrinbase

ARG uid=1000

# Install environment
RUN apt-get update -y && apt-get install -y \ 
	git \
	wget \
	python3.5 \
	python3-pip \
	python-setuptools \
	python3-nacl \
	apt-transport-https \
	ca-certificates 
RUN pip3 install -U \ 
	pip \ 
	setuptools
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EAA542E8
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D82D8E35
RUN echo "deb https://repo.evernym.com/deb xenial master" >> /etc/apt/sources.list 
RUN echo "deb https://repo.sovrin.org/deb xenial master" >> /etc/apt/sources.list 
RUN useradd -ms /bin/bash -u $uid sovrin
USER sovrin
WORKDIR /home/sovrin