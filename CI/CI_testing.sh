pip3 install /github/home/phylanx-0.0.1-cp37-cp37m-linux_x86_64.whl
pip3 install numpy
export 'PHYLANX_PLUGINS_PATH'=/usr/local/lib/python3.7/dist-packages/phylanx-libs/phylanx/

files=`ls testing/python/*.py`
pass=0
fail=0
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
    python3 $entry &>/dev/null
    if [ $? -eq 0 ]; then
        pass=$((pass+1))
    else
        fail=$((fail+1))
fi
done
echo $pass / $((pass+fail))
