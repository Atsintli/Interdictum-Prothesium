#/bin/bash
export models=(01_flauta_model_4k 02_piano_model_5k 03_guitarra_model_11k 04_violin_model_4k 05_cb_model_5k 06_perc_model_5k)

puerto=8501
for model in ${models[@]}
do
  tensorflow_model_server --rest_api_port=$puerto --model_name=improv_class --model_base_path=$(pwd)/$model &
  ((puerto=puerto+10)) #para incrementar el numero de puerto
done

sleep 1
python3 01_extract_features_OSC_sender_flauta.py &
sleep 0.5
python3 02_extract_features_OSC_sender_piano.py &
sleep 0.8
python3 03_extract_features_OSC_sender_guitarra.py &
sleep 1.3
python3 04_extract_features_OSC_sender_violin.py &
sleep 2.1
python3 05_extract_features_OSC_sender_cb.py &
sleep 3.4
python3 06_extract_features_OSC_sender_perc.py
