# COPY ejemplo
FROM debian:latest

LABEL nombre="Christian Cardenas Sanchez"
LABEL version=1.0

RUN apt update && apt -y upgrade
RUN apt-get install -y apt-utils
RUN apt-get install -y curl
RUN apt install -y ufw
RUN apt install -y wget
RUN apt install -y nano
# INSTALACION DE APACHE
RUN apt install -y apache2 apache2-utils
RUN service apache2 start
# HABILITAR PARA PETICIONES WEB
RUN ufw allow http
# INSTALAR MYSQL
RUN apt install -y  mariadb-server mariadb-client
RUN apt install -y php-mysql
# INSTALAR GLPI
RUN wget https://github.com/glpi-project/glpi/releases/download/9.4.5/glpi-9.4.5.tgz
RUN tar xf glpi-9.4.5.tgz -C /var/www/html/
RUN chown -R www-data /var/www/html/glpi/config
RUN chown -R www-data /var/www/html/glpi/files
# RUN apt install -y php-{apcu,cas,gd,imap,ldap,mbstring,simplexml,xmlrpc}
RUN apt install -y php-apcu
RUN apt install -y php-cas
RUN apt install -y php-gd
RUN apt install -y php-imap
RUN apt install -y php-ldap
RUN apt install -y php-mbstring
RUN apt install -y php-simplexml
RUN apt install -y php-xmlrpc
RUN a2enmod rewrite
RUN touch /etc/apache2/conf-available/glpi.conf
RUN echo "<Directory /var/www/html/glpi>\n AllowOverride all\n </Directory>" > /etc/apache2/conf-available/glpi.conf
RUN a2enconf glpi
