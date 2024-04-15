FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y
RUN yum clean all

RUN yum install -y python3 
RUN yum -y --enablerepo=extras install epel-release && yum clean all
RUN yum -y install python-pip

# RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
# RUN python get-pip.py -y 
RUN yum install git -y
RUN yum update -y
