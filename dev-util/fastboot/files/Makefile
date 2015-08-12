SRCS+=bootimg.c
SRCS+=engine.c
SRCS+=fastboot.c
SRCS+=fs.c
SRCS+=protocol.c
SRCS+=usb_linux.c
SRCS+=util.c
SRCS+=util_linux.c

VPATH+= ../libsparse
SRCS+= backed_block.c
SRCS+= output_file.c
SRCS+= sparse.c
SRCS+= sparse_crc32.c
SRCS+= sparse_err.c
SRCS+= sparse_read.c

VPATH+= ../libzipfile
SRCS+= centraldir.c
SRCS+= zipfile.c

VPATH+= extras/ext4_utils
SRCS+= allocate.c
SRCS+= contents.c
SRCS+= crc16.c
SRCS+= ext4_sb.c
SRCS+= ext4_utils.c
SRCS+= extent.c
SRCS+= indirect.c
SRCS+= make_ext4fs.c
SRCS+= sha1.c
SRCS+= uuid.c
SRCS+= wipe.c

VPATH+= libselinux/src
SRCS+= callbacks.c
SRCS+= check_context.c
SRCS+= freecon.c
SRCS+= init.c
SRCS+= label.c
SRCS+= label_android_property.c
SRCS+= label_file.c

CPPFLAGS+= -I../include
CPPFLAGS+= -I../libsparse/include
CPPFLAGS+= -I../mkbootimg
CPPFLAGS+= -Ilibselinux/include
CPPFLAGS+= -Iextras/ext4_utils
CPPFLAGS+= -Iextras/f2fs_utils
CPPFLAGS+= -std=gnu99
CPPFLAGS+= -DHAVE_OFF64_T=1

LIBS+= -lz -lpcre

OBJS= $(SRCS:.c=.o)

all: fastboot

fastboot: $(OBJS)
	cc -o $@ $(OBJS) $(LIBS)

install:
	test -d '$(DESTDIR)/usr/bin' || mkdir -p '$(DESTDIR)/usr/bin'
	cp fastboot '$(DESTDIR)/usr/bin'
