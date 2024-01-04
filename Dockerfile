# https://github.com/huginn/huginn/pkgs/container/huginn-single-process
FROM ghcr.io/huginn/huginn-single-process:ac59e7ad8135cdfc962a8a5ec7cef137469a31ed

ENV RAILS_ENV=production
ENV ADDITIONAL_GEMS=huginn_ruby_agent
ENV PORT=3000
ENV IP=0.0.0.0

COPY env .env
RUN bundle config set --local without 'develpoment test'
RUN bundle install

USER root
USER 1001

RUN apt update
RUN apt install -y openfortivpn



