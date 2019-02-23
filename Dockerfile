FROM jekyll/jekyll
RUN apk add nginx
ADD . /app
WORKDIR /app
RUN chown -R jekyll /app
RUN gem build freelancer-theme-jekyll.gemspec

# Expose ports
RUN jekyll build

# EXPOSE 4000
# WORKDIR /app
# RUN pwd ./_site
# ADD _site /usr/share/nginx/html
# ENTRYPOINT ["bundle","exec","jekyll serve;"]
# ENTRYPOINT ["/usr/share/nginx","-g","daemon off;"]
# docker run --name village-connect-test  -p 4000:4000  test-vaillge:latest jekyll server
