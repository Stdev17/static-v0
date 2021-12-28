FROM ruby:3.1.0
ENV RUBYGEMS_VERSION=3.3.3

# Set default locale for the environment	
ENV LC_ALL C.UTF-8	
ENV LANG en_US.UTF-8	
ENV LANGUAGE en_US.UTF-8

# adding metadata on the image
LABEL "repository"="http://github.com/Stdev17/static-v0"

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]