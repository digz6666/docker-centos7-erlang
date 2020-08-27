FROM centos:7

# change timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Ulaanbaatar /etc/localtime

# update packages
RUN yum update -y

# install epel yum repo
RUN yum install -y epel-release

# install useful commands
RUN yum install -y               \
        # sudo                     \
        mlocate

#RUN yum group install -y "Development Tools"
# install required packages
RUN yum install -y               \
        wget                     \
        git                      \
        openssl openssl-devel    \
        gcc gcc-c++ glibc-devel  \
        make automake            \
        ncurses-devel            \
        autoconf                 \
        wxBase.x86_64            \
        libyaml-devel            \
        expat-devel

WORKDIR /tmp
RUN wget http://erlang.org/download/otp_src_18.0.tar.gz
RUN tar -xvzf otp_src_18.0.tar.gz
WORKDIR /tmp/otp_src_18.0
RUN ./configure
RUN make
RUN make install
WORKDIR /root

CMD /bin/bash && tail -f /dev/null
