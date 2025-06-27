FROM centos:7

LABEL maintainer="rp808462@gmail.com"

# Install Apache and unzip
RUN yum install -y httpd unzip && yum clean all

# Download the ZIP from your GitHub
ADD https://raw.githubusercontent.com/Its-me-ravi/File1/main/photogenic-master.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Unzip the content
RUN unzip photogenic-master.zip && \
    cp -rvf photogenic-master/* . && \
    rm -rf photogenic-master photogenic-master.zip

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose the web port
EXPOSE 80



