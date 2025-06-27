FROM centos:7

LABEL maintainer="rp808462@gmail.com"

# Install required packages
RUN yum install -y httpd unzip && yum clean all

# Copy the ZIP into the image
COPY photogenic.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Extract and clean
RUN unzip photogenic.zip && rm -f photogenic.zip

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose HTTP port
EXPOSE 80


