FROM jekyll/jekyll
ADD . /app
WORKDIR /app
RUN chown -R jekyll /app
# RUN mkdir -p /usr/share/nginx/html
RUN bundle install && \
    bundle exec jekyll build

FROM nginx:latest
EXPOSE 80
COPY _site /usr/share/nginx/html
RUN rm -rf /app
CMD ["nginx","-g","daemon off;"]