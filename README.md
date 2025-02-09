# Script para subir los cambios a Github.

Este script tiene la finalidad de realizar la subida de los commits confirmados a un repositorio almacenado en GitHub.

A pesar de que hay soluciones mejores y mas eficientes, como el uso de un gestor de credenciales, este script
fue desarrollado para aquellas personas que no les guste utilizar este tipo de software y prefiera ingresar sus
credenciales de manera personal/manual, o para los usuarios que utilizan sistemas operativos sin un entorno de
escritorio, donde típicamente suele ser complejo el copiar y pegar texto directamente desde el shell.

Esto ultimo en casos donde se podria tener el token almacenado en un archivo y al querer leer su contenido, copiar
este y luego pegarlo durante la autenticacion solicitada por 'git push', podria resultar complejo.

De manera general, este script se ejecuta de la siguiente manera.

sh Push\_Github.sh Nombre\_Usuario\_GitHub Ruta\_Archivo\_Token Nombre\_Repositorio\_GitHub Nombre\_Rama

_____________________________________________________________________________________________________________________

Evidentemente este script debe de ser ejecutado dentro del directorio del repositorio local del cual se quieran subir
los commits confirmados a GitHub.
_____________________________________________________________________________________________________________________

El segundo argumento utilizado para invocar al script es utilizado para indicar el token de autenticacion.

A pesar de que podemos indicar el valor del token directamente como el segundo argumento, lo ideal es que se tenga
almacenado el token de autentacion dentro de un archivo en el sistema de archivos del sistema. De esta manera, lo
que indicariamos como argumento seria la ruta absoluta o relativa hacia dicho archivo que contenga el token.

En este último caso, donde indiquemos la ruta al archivo que contenga el valor del token, si se quiere indicar que
el archivo se encuentra en el mismo directorio donde se ejecuta el script, debemos de ser explicitos referenciando
al directorio actual por medio de './'; Por ejemplo './Token.txt', ya que si solo indicamos 'token.txt' el script
interpretara este segundo argumento como el valor real del token y no hara una lectura del archivo en cuestión para
extraer el valor del token que será utilizado para la autenticación.
