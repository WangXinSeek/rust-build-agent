FROM python:3-onbuild

RUN apt-get update
RUN apt-get -y install sudo apt-utils
RUN apt-get -y autoremove
RUN apt-get -y autoclean

RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh
