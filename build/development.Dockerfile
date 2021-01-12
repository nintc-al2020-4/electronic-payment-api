FROM ruby:2.6.6-alpine
ENV LANG C.UTF-8

ENV APP_HOME /rails_app
WORKDIR $APP_HOME

# https://github.com/sass/sassc-ruby/issues/146#issuecomment-569304548
# https://github.com/bitnami/bitnami-docker-rails/issues/99#issuecomment-569901428
ENV BUNDLE_BUILD__SASSC --disable-march-tune-native

# Install apk package
COPY build/scripts/apk_install.sh scripts/apk_install.sh
RUN /bin/sh scripts/apk_install.sh

# Prepare App
COPY . $APP_HOME

EXPOSE 3000
CMD bundle exec rails server -b 0.0.0.0
