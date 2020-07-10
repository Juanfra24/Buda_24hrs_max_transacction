# Buda_24hrs_max_transacction
Tarea para platanus en donde se obtienen las transacciones mas altas realizada en los mercados de Buda

## Pre-requisitos
Ruby 2.5.1  
Rails 5.2.4.3

## Deploy
 1. `git clone https://github.com/Juanfra24/Buda_24hrs_max_transacction.git`
 2. `cd Buda_24hrs_max_transacction`  
 3. `bundle install`
 4. `bin/rails server`

Ahora dirigirse a [http://localhost:3000/](http://localhost:3000/)

## Run
Una vez en la pagina de inicio, darle al boton Generar tabla (puede demorar 1 o 2 minutos)  
El resultado deberia ser parecido a lo siguiente:  
<a href="https://ibb.co/097ncr5"><img src="https://i.ibb.co/HPSKVqZ/output-platanus.png" alt="output-platanus" border="0"></a>

## Archivos importantes
 Tener en cuenta el archivo`\app\controllers\table_controller.rb` y el directorio `\app\views\table` donde se encuentra la mayoria del codigo hecho para el ejercicio
 
 ## ToDo
 - Montar en un docker para evitar problemas de version
 - formatear algunos datos desplegados en tablas
 - Montar una UI en algun framework como VUE
