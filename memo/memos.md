when there are too many items, mkdir zemos

---
# compile
gcc -o usemath usemath.c -lm
# install
pip3 install cython==0.25.2
# config
echo 'Acquire::ForceIPv4 "true";' >> /etc/apt/apt.conf.d/99force-ipv4