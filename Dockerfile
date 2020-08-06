FROM centos:7

# change timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Ulaanbaatar /etc/localtime

# update packages
RUN yum update -y

# install epel yum repo
RUN yum install epel-release

#RUN yum group install -y "Development Tools"
# install required packages
RUN yum install -y               \
        wget                     \
        mlocate                  \
        openssl-devel            \
        gcc gcc-c++ glibc-devel  \
        make automake            \
        ncurses-devel autoconf   \
        wxBase.x86_64            \
        libyaml-devel            \
        expat-devel

RUN cd /tmp
RUN wget http://erlang.org/download/otp_src_18.0.tar.gz
RUN tar -xvzf otp_src_18.0.tar.gz
RUN cd otp_src_18.0
RUN ./configure
RUN make
RUN make install

CMD /bin/bash && tail -f /dev/null
