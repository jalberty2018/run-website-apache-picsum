FROM httpd:2.4

# Copy your HTML file into Apache's public folder
COPY public/ /usr/local/apache2/htdocs/