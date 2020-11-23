#!/bin/bash
#https://github.com/a18danperllu/Practica17/
##funcion ayuda
function usage () {
	cat <<-EOF

Usage: nomscript [-u usuari] [-h hostname] [-t]
-u   usuari de la base de dades (obligatori)
-h   hostname on es connectarà (obligatori)
-p   port (no obligatori ja que per defecte és 3306, però si existeix ha de ser un numero superior a 1024 i inferior o igual a 65535)
-t   no es connecta,  només comprova connexió (tiempo)
	EOF
}
fecha=$(date)
###si no funciona bien ###
if [[ "${UID}" -eq 0 ]]
then
	echo "tienes permisos"
		#comprovar si hay parametros
		if [ $# -eq 0 ];
		then
			echo "Pero no has indicado los parametros"
			usage
		else
     			while getopts "u:h:p:t:" par;
     			do
  				case $par in

  				u)
				#usuario de bases de datos(obligatorio)
				u=true
     				echo "tu usuario es:"${OPTARG}
    				;;
  				h)
				#hostname donde se conectara
    				echo "tu hostname es: "${OPTARG}
   				;;
				p)
				#puerto
				echo "Puerto es: 3306"
				;;
				t)
				#no se conectara, pero comprovara la conexion
				echo "Ultima conexion es: $fecha"
				;;
  				esac
    			done
		fi
else
	echo "no tienes permisos"
fi
