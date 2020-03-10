# Capacitacion docker 101
    
# EXPLICACIÓN

La imagen que se crea es de un GLPI el cual es un sistema que ayuda a mantener el inventario de nuestro parque de PC que se tiene en la empresa.

Esta imagen contiene:

    • Apache
    • PHP
    • Mysql
    • GLPI

Casi listo para solo ejecutar y poner marcha el sistema GLPI.

# CREANDO LA IMAGEN DE GLPI

Cree la imagen a partir del Dockerfile:

    docker build -t glpi:1.0 .

No olvidar estar el mismo nivel del archivo Dockerfile. Luego de realizar la tarea tenemos la imagen descargada y con la instalacion previa en la imagen, para verificar esta imagen:

    docker images

Podemos observar que aparece la imagen glpi.

# CREANDO EL CONTENEDOR GLPI

Crear el contenedor para verificar si correo todo los que se realizo en la imagen:

    docker container run -it --name glpi-web glpi:1.0 bash

Con este comando tendremos la consola abierta para completar con la instalacion.

Con la teminal abierta de nuestro contenedor glpi-web, escribimos los siguientes comandos:

    service apache2 start

    service mysql start

Y por ultimo, creamos un usuarios en MySQL y tambien la base de datos, con los siguientes comandos:

    mysql -u root
    create user glpi@localhost identified by 'glpi';
    create database glpi collate utf8mb4_general_ci character set utf8mb4;
    grant all privileges on glpi.* to glpi@localhost;
    exit;

Perfecto hast aquí es todo dentro del contenedor.

# FINALIZANDO LA INSTALACIÓN

Abrir el navegador de internet y en la barra de dirección escribir la IP de nuestro contenedor, así como se muestra: 172.17.0.3/glpi
En mi caso esta es la IP que tenia asignada a mi contenedor.

1er Panatalla Bienvenida: seleccionar el idioma en el que se quiere instalar el GLPI.

2da Pantalla Terminos de la Licencia: Aceptamos los términos de la Licencia y luego clic en el botón de Continuar.

3ra Pantalla Actualizar o Instalar: Aquí pregunta si queremos instalar o actualizar, clic en instalar ya que en nuestro caso no tenemos instalada una versión anterior.

4ta Pantalla Requisitos: En esta pagina verifica si tenemos todo lo necesario para instalar GLPI, si todo es correcto deberíamos ver puros check de color verde y clic en botón continuar.

5ta Pantalla Conexion a la Base de datos: Aqui debemos proporcionar las credenciales para la conexión y creacion de la base de datos:

    • Servidor: localhost
    • Usuario: glpi
    • Contraseña: glpi

clic en continuar

6ta Pantalla Seleccion de base de datos: Escogemos la base de datos que creamos en pasos anteriores, clic en glpi y clic en el boton continuar.

7ma Pantalla: Clic en continuar

8va Pantalla Envio de Estadisticas: Pregunta si se quiere enviar estadísticas, clic en continuar.

9na Pantalla Aportar al Proyecto: clic en continuar.

10ma Pantalla Usuarios por defecto: esta ultima es la que nos muestra los usuarios por defecto, que se crean con la instalación, y clic en Utilizar GLPI.


Esto es todo. Gracias por su atención.
