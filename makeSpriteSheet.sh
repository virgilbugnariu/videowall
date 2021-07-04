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
    -s|--speed)
      SPEED="$2"
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
  SIZE=100;
fi

if [ ! $SPEED ]
  then
  echo "No speed specified, defaulting to 0.2";
  SPEED=0.2;
fi

OUTPUT_FOLDER_NAME="${OUTPUT%.*}"

echo "Input file: $INPUT";
echo "Output file: $OUTPUT";
echo "Saving to folder: $OUTPUT_FOLDER_NAME";

mkdir $OUTPUT_FOLDER_NAME;

ffmpeg -i $INPUT \
  -f image2 \
  -vf "setpts=$SPEED*PTS, fps=fps=20, crop=in_w/2:in_w/2, scale=100:100" \
  $OUTPUT_FOLDER_NAME/img%03d.jpg
convert $(ls $OUTPUT_FOLDER_NAME/img*.jpg | sort -t '-' -n -k 2 | tr '\n' ' ') -append $OUTPUT_FOLDER_NAME/$OUTPUT

exit 0;