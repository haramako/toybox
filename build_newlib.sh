HOS=/home/harada/hos

# CPUS=1がないと、並列でコンパイルされて出力が混じる
#clang-10 -I. -DUSE_INCLUDE_NEXT -fno-builtin -nostdlib -I${HOS}/vencor/newlib/include -I${HOS}/cstd/include -E lib/lib.c -dM && exit

export CFLAGS="-DUSE_INCLUDE_NEXT -fno-exceptions -fno-builtin -I${HOS}/vencor/newlib/include -I${HOS}/cstd/include -mcmodel=large"

export LDFLAGS="-Wl,-T/home/harada/hos/app/app.ld,-e_start
 -nostdlib -static -L${HOS}/vendor/newlib/lib -L${HOS}/cstd/src -lc -lstd -lc"

export CC="clang-10"

# CPUS=1がないと、並列でコンパイルされて出力が混じる
#CPUS=1 make -j1
make
