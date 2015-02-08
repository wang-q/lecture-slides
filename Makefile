all:
	$(MAKE) -C slides all

clean:
	$(MAKE) -C slides clean

realclean:
	$(MAKE) -C slides realclean

.PHONY: all clean realclean
