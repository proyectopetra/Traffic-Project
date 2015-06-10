[SCRIPT PARSEADOR DE LA WEB DE LA DGT]

Este escript extrae información de la web http://infocar.dgt.es/etraffic/

Tiene dos funciones:
- getAforadores: dado el codigo de provincia y el nombre devuelve una lista de pares "Nombre","GenCod"
- getSensorData: dado el Nombre y el GenCod de un sensor, devuelve una tupla "intensidad, velocidad, ocupacion, ligeros"
