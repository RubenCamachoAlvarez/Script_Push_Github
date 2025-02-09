#!/bin/bash
#
#	Descripcion:
#
#		Este script se encarga de subir de manera automatica los cambios realizados a un repositorio que se
#		encuentra almacenado en GitHub.
#
#	Modo de uso:
#
#		sh nombre_script nombre_usuario_GitHub archivo_token|token nombre_repositorio_github nombre_rama
#
#	Ejemplo de uso:
#
#		- Cuando el token se encuentra almacenado en el archivo "Token.txt" dentro del directorio en el que
#		se ejecuta este script.
#
#			sh Push_Github.sh NombreUsuarioGitHub ./Token.txt NombreRepositorio.git NombreRama
#
#		- Cuando el valor del token se tiene a la mano.
#
#			sh Push_Github.sh NombreUsuario Token NombreRepositorio.git nombreRama
#
#	
#	Consideraciones de uso:
#
#		- Cuando se quiera indicar que el token esta almacenado en un archivo, siempre se debe de especificar
#		por medio de rutas relativas o rutas absolutas.
#
#		Principalmente cuando el token se encuentra almacenado dentro de un archivo que se encuentra en el
#		mismo directorio que el directorio de trabajo utilizado por este script.
#
#		Por ejemplo, si el token se encuentra dentro del archivo "token.txt" dentro del mismo directorio donde
#		se ha ejecutado el script, entonces se debe de hacer referencia al archivo con "./token.txt", ya que
#		si se pasa como argumento "token.txt" esto no sera interpretado como un archivo, sino como el valor
#		del token.
#
#		- Se recomienda que el nombre del repositorio sea especificado al final con ".git".
#		
#		Si el script detecta que el nombre del repositorio no finaliza con ".git", este lo agregara
#		al final del nombre del repositorio especificado como tercer argumento, pero de todos modos
#		es preferente que el mismo usuario especifique de manera completa el nombre del repositorio.
#
#		- El nombre del usuario, el nombre de los directorios intermedios y el nombre del archivo que contiene
#		el token solo pueden estar compuestas de letras, numeros, guiones bajos y guiones medios.
#
#		-Se debe de ingresar el nombre de un rama valida que exista dentro del repositorio al que se quiere
#		subir los cambios.
#
#	Salida producida:
#
#		Este script genera la URL de autenticacion necesaria para subir los cambios de manera automatica
#		sin que el usuario tenga que escribir sus credenciales (usuario y token) a mano.
#
#	PRECACION:
#
#		Debido a que este script sube a GitHub los cambios realizados a un repositorio local, por medio
#		del comando 'git push', se DEBE ejecutar este script dentro del directorio principal del repositorio.
#

nombre_usuario="$1"

archivo_token="$2"

nombre_repositorio="$3"

rama="$4"

token=""

if echo "$archivo_token" | grep -Eq '^(\.{1,2})?/(((\.{1,2})|(\.?[a-zA-Z0-9_-]+)+)/?)*$' ; then

	token=$(cat $archivo_token)

	if [ "$?" -ne 0 ]; then

		exit $?

	fi

else

	token="$archivo_token"

fi

if echo "$nombre_usuario" | grep -Eqv '^[a-zA-Z0-9_-]+$'; then

	echo "Nombre de usuario no valido" >&2

	exit 1

fi


if echo "$nombre_repositorio" | grep -Evq '\.git$'; then

	nombre_repositorio="$nombre_repositorio.git"

fi


autenticacion="https://$token@github.com/$nombre_usuario/$nombre_repositorio"

git push $autenticacion $rama
