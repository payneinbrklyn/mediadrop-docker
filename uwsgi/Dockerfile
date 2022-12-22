# docker-mediadrop
# https://github.com/nmarus/docker-mediadrop
# Nicholas Marus <nmarus@gmail.com>

FROM mediadrop-uwsgi:homebase-0.9
ADD ./install-python.sh ./prep-env /bin/
#setup apt
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    chmod +x /bin/install-python.sh /bin/prep-env

#install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    apt-get -y install apt-utils curl git wget 

RUN apt-get -y install default-mysql-client && \
    apt-get -y install libjpeg-dev zlib1g-dev libfreetype6-dev default-libmysqlclient-dev && \
    apt-get -y install build-essential python3.9-full python3-pip python3-setuptools python3.9-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt install -y libssl-dev libncurses5-dev libsqlite3-dev libreadline-dev libtk8.6 libgdm-dev libdb4o-cil-dev libpcap-dev

#Custom Python install
RUN 


#install uwsgi
RUN pip install virtualenv 
RUN pip install uwsgi uwsgitop


#startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Startup
CMD ["/start.sh"]
