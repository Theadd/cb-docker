
RUN apt update && \
    apt upgrade -y

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt -y install tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt -y install software-properties-common && \
    add-apt-repository -y ppa:ondrej/php && \
    apt update && \
    apt upgrade -y && \
    apt -y install apache2 && \
    apt -y install php7.0 && \
    apt -y install php7.0-curl php7.0-gd php7.0-mbstring php7.0-mysql php7.0-xml php7.0-zip php7.0-bz2 && \
    apt -y install imagemagick php-imagick php-pear && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/sh"]
