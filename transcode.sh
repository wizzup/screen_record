# transcode recored screen using ffmpeg, produce small lossy video file name ${TARGET}
# support 480p and 720p
# usage: transcode.sh <720>
#

TARGET=transcoded.mkv
echo output video : ${TARGET}

VIDCODEC="-c:v libx264 -preset veryslow"

if [[ -n ${1} ]];
then 
  INVID=${1}
  echo input video : ${INVID}

  COMMAND="ffmpeg -i ${INVID} ${VIDCODEC} ${TARGET}"

  echo ${COMMAND}
  ${COMMAND}
else
  echo no input video
  exit 1
fi
