CC="cc" CFLAGS="-nostdlib -DUSE_INCLUDE_NEXT=1 -I/home/harada/newlib_posix/include -I/home/harada/newlib_unchanged/include" LDFLAGS="-fno-builtin -nostdlib -static  -L/home/harada/newlib_unchanged/lib -lc" make -j1 toybox
