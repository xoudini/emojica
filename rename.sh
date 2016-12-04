#!/bin/sh

#
#  ------------------------------------------------------------------------
#
#  Copyright 2016 Dan Lindholm
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http:#www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#  ------------------------------------------------------------------------
#
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
