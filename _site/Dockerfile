FROM jekyll/jekyll
# RUN apk add nginx
ADD . /app
WORKDIR /app
RUN chown -R jekyll /app
RUN gem build freelancer-theme-jekyll.gemspec

# Expose ports
RUN jekyll build
# /srv/jekyll
# EXPOSE 4000
WORKDIR /app
RUN pwd 
# RUN usermod -a -G nginx jekyll
RUN mkdir -p /usr/share/nginx/html
RUN cp -r ./_site/* /usr/share/nginx/html
ADD nginx.conf /etc/nginx/nginx.conf
RUN chmod 777 /usr/share/nginx
RUN chmod 777 -R /usr/share/nginx/html
RUN ls -lart
FROM nginx
EXPOSE 80
# COPY --from=0 /tmp/_site /usr/share/nginx/html
# RUN chown -R jekyll /usr/share/nginx
# ENTRYPOINT ["bundle","exec","jekyll serve;"]
# ENTRYPOINT ["/usr/share/nginx","-g","daemon off;"]
# docker run --name village-connect-test  -p 4000:4000  test-vaillge:latest jekyll server
# FROM nginx:latest

# COPY _site /usr/share/nginx/html