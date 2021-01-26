#!/bin/bash

# running the script - ./run_itsx.sh <run_id>

# TODO LIST:
# 1. Should we allow the following ITSx parameters (?): -E 0.01 --search_eval 0.01
# ...

if [ -z "$1" ]
    then
        echo "No run_id argument supplied!"
        exit
fi

# get run id
run_id=$1

# parse command line arguments (example: --cpu 8 --save_regions all --silent T -t all -N 2 --complement True --preserve True --concat T --detailed_results T --partial 50)
options=$@
arguments=($options)
index=0
itsx_args="-o itsx_out"
for argument in $options
  do
    index=`expr $index + 1`
    case $argument in
      --cpu) itsx_args="$itsx_args $argument ${arguments[index]}" ;;
      --save_regions)  itsx_args="$itsx_args $argument ${arguments[index]}" ;;
      --silent) itsx_args="$itsx_args $argument ${arguments[index]}" ;;
      -t) itsx_args="$itsx_args $argument ${arguments[index]}" ;;
      -N) itsx_args="$itsx_args $argument ${arguments[index]}" ;;
      --complement) itsx_args="$itsx_args $argument ${arguments[index]}" ;;
      --preserve) itsx_args="$itsx_args $argument ${arguments[index]}" ;;
      --concat) itsx_args="$itsx_args $argument ${arguments[index]}" ;;
      --detailed_results) itsx_args="$itsx_args $argument ${arguments[index]}" ;;
      --partial) itsx_args="$itsx_args $argument ${arguments[index]}" ;;
    esac
  done

# get working directory
pwd=$(pwd)

user_dir="$pwd/userdir/$run_id"
outdata_dir="$pwd/outdata"
infile="source_$run_id"

echo "Start"

echo "Starting new analysis in $user_dir"
echo "ITSx program parameters: $itsx_args"

# rm (if exists) user working dir and create as new
if [ -d "$user_dir" ]
  then
      rm -fr "$user_dir"
fi
mkdir "$user_dir"

# copy indata to user's workdir
cp "$pwd/indata/$infile" "$user_dir"

# run ITSx
cd "$user_dir"
perl "/ITSx_1.1.2/ITSx" -i "$user_dir/$infile" "$itsx_args"

# archive and move to outfile_dir dir
logfile="$user_dir/source_$run_id.log"
cp "$user_dir/ITSx_out.summary.txt" "$logfile"
tar -czvf "$infile.tar.gz" ITSx_out*
mv "$infile.tar.gz" "$outdata_dir/"
mv "$logfile" "$outdata_dir/"

echo "End"
