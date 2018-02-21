FROM ruby:2.5

RUN \
curl -sfLO http://www.imagemagick.org/download/ImageMagick-7.0.7-23.tar.gz && \
echo '049d94604605bef0c0dbef4836e5fd148d2ecc249026dfdc02f34f01017f7ab7  ImageMagick-7.0.7-23.tar.gz' | sha256sum -c - && \
tar -xzf ImageMagick-7.0.7-23.tar.gz && \
cd ImageMagick-7.0.7-23 && \
./configure --prefix /usr/local && \
make install && \
cd .. && \
rm -rf  ImageMagick* && \
ldconfig /usr/local/lib

RUN mkdir /chevalspree
WORKDIR /chevalspree
COPY Gemfile /chevalspree/Gemfile
COPY Gemfile.lock /chevalspree/Gemfile.lock
RUN bundle install
COPY . /chevalspree

LABEL com.wrightling.maintainer="warren@thewrightangle.com"
