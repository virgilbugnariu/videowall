#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -i|--input)
      INPUT="$2"
      shift # past argument
      shift # past value
      ;;
    -o|--output)
      OUTPUT="$2"
      shift # past argument
      shift # past value
      ;;
    -s|--size)
      SIZE="$2"
      shift
      shift
      ;;
    *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;
  esac
done

if [ ! $INPUT ]
  then
    echo "No INPUT value specified";
    exit 1;
fi

if [ ! $OUTPUT ]
  then
    echo "No OUTPUT value specified";
    exit 1;
fi

if [ ! $SIZE ]
  then
  echo "No size specified, defaulting to 100x100";
  SIZE=0.02;
fi

echo "Input file: $INPUT";
echo "Output file: $OUTPUT";

ffmpeg -i $INPUT \
  -f image2 \
  -vf "frei0r=filter_name=pixeliz0r:filter_params=$SIZE|$SIZE" \
  $OUTPUT;  

exit 0;