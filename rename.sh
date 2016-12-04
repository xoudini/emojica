#!/bin/sh

#  rename.sh
#
#  Usage:
#  1. Copy into folder containing images.
#  2. Navigate into the directory in Terminal.
#  3. Run script:
#       sh rename.sh
#

DIR="$( cd "$(dirname "$0")"; pwd )";
COUNT=0;
FOUND=0;

echo "Renaming images in $DIR";

for f in *.png; do
    COUNT=$(( COUNT + 1 ));

    name=$(echo "$f" | sed 's/-200d//g' | sed 's/-fe0f//g');

    if [ "$name" != "$f" ]; then
        FOUND=$(( FOUND + 1 ));
        echo "\tRenaming $f";
        mv "$f" "$name";
    fi;
done;

echo "-----------------------------";
echo "Renamed $FOUND of $COUNT images.";
