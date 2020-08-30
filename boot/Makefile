CC=gcc
AS=nasm

AS_OBJS = mbr.o
AS_FLAGS = -g -O0 -f rdf

.PHONY: all
all:$(AS_OBJS)

$(AS_OBJS): $(AS_OBJS:.o=.s)
	$(AS) $(AS_FLAGS) -o $@ $^
	$(AS) -f dbg $@