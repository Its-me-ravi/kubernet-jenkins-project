FROM centos:7

LABEL maintainer="rp808462@gmail.com"

# Install Apache and unzip utility
RUN yum install -y httpd unzip && yum clean all

# Copy ZIP from local context (same repo folder)
COPY photogenic-master.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Extract the zip and clean up
RUN unzip photogenic-master.zip && \
    cp -rvf photogenic-master/* . && \
    rm -rf photogenic-master photogenic-master.zip

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose HTTP port
EXPOSE 80

