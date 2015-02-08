all:
	$(MAKE) -C notes all
	$(MAKE) -C slides all

clean:
	$(MAKE) -C notes clean
	$(MAKE) -C slides clean

realclean:
	$(MAKE) -C notes realclean
	$(MAKE) -C slides realclean

.PHONY: all clean realclean
