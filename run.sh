#!/bin/bash
files=`ls ./testing/python/*.py`
for entry in $files
do
    rm -r /usr/local/lib/python3.7/dist-packages/phylanx/core/__pycache__ &>/dev/null
    rm -r /usr/local/lib/python3.7/dist-packages/phylanx/execution_tree/__pycache__ &>/dev/null
    rm -r /usr/local/lib/python3.7/dist-packages/phylanx/util/__pycache__ &>/dev/null
    rm -r /usr/local/lib/python3.7/dist-packages/phylanx/ast/__pycache__ &>/dev/null
    rm -r /usr/local/lib/python3.7/dist-packages/phylanx/plugins/__pycache__ &>/dev/null
    rm -r /usr/local/lib/python3.7/dist-packages/phylanx/__pycache__ &>/dev/null
    rm -r ./testing/python/__pycache__ &>/dev/null
    rm -r ./testing/python/__physlcache__ &>/dev/null
    python3 $entry
    if [ $? -eq 0 ]; then
        continue
    else
        echo $entry
fi
done
