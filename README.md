# Interdictum-Prothesium
### SEALI para ejecución de Interdictum Prothesium

En cierta medida, la forma en la creamos actualmente productos musicales está mediada por una serie de dispositivos tanto teóricos como prácticos que responden a un método de producción similar al que vemos en la elaboración automatizada de productos manufacturados en serie. Estos dispositivos están marcados por un profundo proceso de reticulación lattice, segmentación, estructuración y clasificación propuesto desde la misma historia de la música y estudiado ampliamente por Trevor Wishart. Además, desde finales del siglo XX la música ha sido reducida a un único e infinito modo de reproducción desde el fonoautógrafo hasta las plataformas de reproducción digitales. Esta problemática exhibe la falta de apertura a la afectación que podría existir en los mismos procesos de creación de una obra musical. El mismo concepto de obra acabada, deja ver la imposibilidad del proceso vivo que tiene el propio sonido, atrapado y sistemáticamente sometido a su reticulación automatizada.   

Lo que busca Interdictos prostésicos es profundizar en estas problemáticas partiendo de un proceso creativo enfocado en la exploración del carácter experimental que cada intérprete podría desarrollar dentro de su práctica. Este proceso resultó en la consolidación de materiales sonoros que sirvieron como elemento detonador para la creación de la presente obra. En ese sentido quiero agradecer especialmente a Diego Sanchez, Diego Villaseñor, Aída Padilla, Gilberto Ramón Celis, Elena Sanchez y Fabían Rangel quienes  contribuyeron para conformar la materia sonora de la obra. Además, estos materiales sonoros sirvieron para entrenar varios modelos del Sistema Escucha Automática para la Libre Improvisación SEALI, el cual es el agente que se desenvuelve desde la electrónica.

Estos materiales sonoros fueron tomados como base de datos para entrenar varios modelos mediante redes neuronales profundas al Sistema Escucha Automática para la Libre Improvisación SEALI. Con ellos SEALI puede reconocer los materiales y responder de manera algorítmica en tiempo real mientras son identificados. Además el sistema puede reconocer en un nivel más alto la estructura musical que deviene de formas como la composición académica contemporánea, la electroacústica y la improvisación libre. De manera tal que el sistema adecua su comportamiento en términos de complejidad, densidad, centralidad, brillo espectral y amplitud basándose en los modelos de las bases de datos que le fueron proporcionadas. Cabe destacar que la forma en la que el sistema reacciona a lo percibido en la obra parte de los propios materiales que fueron grabados por los interpretes, que a su vez están sujetos a diferentes procesos de transformación electrónica y además se integran procesos de síntesis sonora.

## Guia de instalación

Nota: Esta guia ha sido realizada para sistemas operativos GNU/LINUX. Hasta el momento los algoritmos no han sido probados en sistemas operativos OSX y Windows, aunque el proceso debe ser muy similar.

El Sistema de escucha automática para la libre improvisación (SEALI) en la versión de interdictos protésicos contiene 6 modelos ejecutables vía tensorflow_model_server, 6 algoritmos de escucha de máquinas desarrollados en el lenguaje de programación Python y un algoritmo de reactividad generado en Supercollider. Estos modelos fueron generados a partir de los materiales sonoros que 6 músicos aportaron para la elaboración de esta obra, por consiguiente, cada modelo identifica dichos materiales de manera individual a través del análisis en tiempo real que realizan los algoritmos de escucha de máquina.

### Requerimientos:

    • Python 3.5 (o posterior)

    • Supercollider 3.10 (o posterior)

    • Tensorflow_model_server:

      apt-get update && apt-get install tensorflow-model-server

    • Pip3: PythonOSC, JSON, Essentia, SoundCard_

      pip3 install essentia SoundCard jsonlib install python-osc

### 1. Clonar desde la terminal o descargar el repositorio:

    git clone https://github.com/Atsintli/Interdictum-Prothesium.git
    
### 2. Reubicar modelos y base de datos:
Reubica en la carpeta principal del repositorio las seis carpetas que contienen los modelos y los directorios con archivos de audio que encontrarás del siguiente link:

   https://archive.org/details/clases_interdictos
       
### Modelos correspondientes a cada instrumento:    

    • 01_flauta_model_4k
    • 02_piano_model_5k
    • 03_guitarra_model_11k
    • 04_violin_model_4k
    • 05_cb_model_5k
    • 06_perc_model_5k
    
### 3. Abrir la terminal en la carpeta del repositorio y ejecutar:

       source init.bash
       
Este código corre paralelamente los 6 algoritmos de escucha automática para comunicarse con Supercollider via OSC.

#### Algoritmos de escucha automática:

    • 01_extract_features_OSC_sender_flauta.py
    • 02_extract_features_OSC_sender_piano.py
    • 03_extract_features_OSC_sender_guitarra.py
    • 04_extract_features_OSC_sender_violin.py
    • 05_extract_features_OSC_sender_cb.py
    • 06_extract_features_OSC_sender_perc.py

### 4. Abrir el siguiente código con Supercollider y ejecutar (ctrl+enter) todas las lineas de código:
Este código carga mediante el archivo get_audios_&_syths_IP.scd varios sinstetizadores y directorios a los archivos de audio previamente reubicados (es necesario cambiar todos los directorios de get_audios_&_syths_IP.scd a los tuyos propios).

       osc_sonification_data_reciver.scd

### 5. A improvisar con SEALI!!!
