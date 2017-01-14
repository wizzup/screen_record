# prepare windows for recording using tmux, 
# support 480p and 720p
# usage: prepare-windows.sh <720>
#

case ${1} in
  720)
    echo 720p
    SZX=160
    SZY=48
    ;;
  *)
    # default on 480p
    echo 480p
    SZX=107
    SZY=32
    ;;
esac

echo SZX = ${SZX} SZY = ${SZY}

# start tmux is it is not already running
[[ -n ${TMUX} ]] || tmux

# create pane layouts on new window
tmux new-window -c .
tmux select-pane -t 0
tmux split-window 
tmux select-pane -t 0
tmux split-window -h
tmux select-pane -t 0
tmux resize-pane -x ${SZX} -y ${SZY}
