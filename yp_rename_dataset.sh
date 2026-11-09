set -e

DATASET_FOLDER=$1

cd $DATASET_FOLDER
rm model.ply

for dir in *; do
    #delete if file
    if [[ -f $dir ]]; then
        rm -rf dir
        continue
    fi

    mv $dir model_ship-${dir##*-}
done

for dir in */; do
    cp $dir/box3d_corners.txt .
    break
done

mkdir model-ship
for f in *; do
  [ "$f" = "$DIR_NAME" ] || mv "$f" "$DIR_NAME"/
done