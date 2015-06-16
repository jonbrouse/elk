FROM nginx

# You can either copy the certs from the context or use the following to 
# download your certs from a secure location
#RUN \
#  mkdir /etc/nginx/certs && \
#  curl -o /etc/nginx/certs/example_com_full_chain.pem https://s3.amazonaws.com/example.com/example_com_full_chain.pem && \
#  curl -o /etc/nginx/certs/example_com.key https://s3.amazonaws.com/example.com/example_com.key

COPY assets/certs /etc/nginx/certs/
COPY assets/default.conf /etc/nginx/conf.d/default.conf
