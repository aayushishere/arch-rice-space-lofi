CFLAGS   = -O3 

# There should be nothing to edit below this line
# -----------------------------------------------------------------------------
CC			= gcc

XROOT    = /usr/X11R6
INCLPATH = -I$(XROOT)/include
LDPATH   = -L$(XROOT)/lib

HEADERS  = failsafewm.h  
OBJS     = failsafewm.o 

all: clean failsafewm
	rm -f *.o  

failsafewm: $(OBJS)
	$(CC) -s -pipe $(DEFINES) $(LDPATH) -lX11 $(OBJS) -o $@

$(OBJS): %.o: %.c $(HEADERS)
	$(CC) -c $(CFLAGS) $(DEFINES) $(INCLPATH) $<

clean:
	rm -f *~ failsafewm core *.o $(OBJS)
