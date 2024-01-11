# https://github.com/huginn/huginn/pkgs/container/huginn-single-process
FROM ghcr.io/huginn/huginn-single-process:ac59e7ad8135cdfc962a8a5ec7cef137469a31ed

ENV RAILS_ENV=production
ENV ADDITIONAL_GEMS="huginn_ruby_agent(github: sergio-fry/huginn_ruby_agent),selenium-webdriver"
ENV PORT=3000
ENV IP=0.0.0.0

COPY env.build .env
RUN bundle config set --local without 'develpoment test'
RUN bundle install

USER 0
#RUN apt-get update 
#RUN apt-get install -y firefox
# RUN apt-get install -y snap
# RUN snap install firefox
# RUN apt-get update && apt-get install --no-install-recommends -y firefox && \
#	rm -rf /var/lib/apt/lists/* && \
#	rm -rf /usr/share/doc/ && \
#	rm -rf /usr/share/man/ && \
#	rm -rf /usr/share/locale/ && \
#	rm -rf /var/log/*

USER 1001

EXPOSE 3000



