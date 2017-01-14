# record screen using ffmpeg, produce BIG LOSSLESS video file name ${TARGET}
# support 480p and 720p
# usage: record.sh <720>
#

TARGET=record.mkv

# Output size
# Get columns by `echo $COLUMNS` And lines by `echo $LINES` in bash,
# and change active tmux pane with `tmux resize-pane -x <columns> -y <lines>`
# Recommened resolution : https://support.google.com/youtube/answer/6375112

case ${1} in
  720)
    # columns 160, lines 48
    VIDSIZE=1280x720
    ;;
  *)
    # default on 480p
    # columns 107, lines 32
    VIDSIZE=854x480
    ;;
esac

# output frame rate
FRAMERATE=25

# lossless recording with minimum compression
# codec parameters : https://trac.ffmpeg.org/wiki/Encode/H.264
VIDCODEC="-c:v libx264 -preset ultrafast -crf 0"

# remove title bar and xmobar window border
SOFFSET=1,19
XGRAB="x11grab -i :0.0+${SOFFSET}"

# actual ffmpeg command
COMMAND="ffmpeg -framerate ${FRAMERATE} -video_size ${VIDSIZE} -f ${XGRAB} ${VIDCODEC} ${TARGET}"

echo ${COMMAND}
${COMMAND}
