`how to` [accelerate octave utilizing nvblas](https://devblogs.nvidia.com/parallelforall/drop-in-acceleration-gnu-octave/)
---
the following steps work for linuxmint. other linux distros can be configured in the same way.
  1. create `$HOME/.nvblas.conf`:
      > #Put here the CPU BLAS fallback Library of your choice<br />
      > NVBLAS_CPU_BLAS_LIB libatlas.so<br />
      > #NVBLAS_CPU_BLAS_LIB libopenblas.so
      >
      > #Specify which output log file (default is stderr)<br />
      > #NVBLAS_LOGFILE nvblas.log
      >
      > #List of GPU devices Id to participate to the computation<br />
      > #By default if no GPU are listed, only device 0 will be used<br />
      > #`NVBLAS_GPU_LIST ALL` would mean all compute-capable GPUs detected on the system will be used by NVBLAS.<br />
      > NVBLAS_GPU_LIST 0 1
      >
      > #Use of NVBLAS_AUTOPIN_MEM_ENABLED flag can be essential for good performance.<br />
      > NVBLAS_AUTOPIN_MEM_ENABLED
      >
      > #See [NVBLAS documentation](http://docs.nvidia.com/cuda/nvblas/index.html) for complete list of options.
  1. add to your `$HOME/.bashrc`:
      > export NVBLAS_CONFIG_FILE="$HOME/.nvblas.conf" #set config file<br />
      > alias octave='LD_PRELOAD=libnvblas.so octave'<br />
      > alias octave-cli='LD_PRELOAD=libnvblas.so octave-cli'
      >
      > #in case you use `NVBLAS_CPU_BLAS_LIB libopenblas.so` in `$HOME/.nvblas.conf`<br />
      > #export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/OpenBLAS/lib"
  1. open a new terminal(to let changes in `$HOME/.bashrc` take effect if you are not familiar with terminals) and run `octave` or `octave-cli`

now you can enjoy octave with nvblas.
