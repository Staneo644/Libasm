SUBDIRS = lib test

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done

fclean: 
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir fclean; \
	done

run:
	./test/test

re: fclean all

.PHONY: all clean $(SUBDIRS) fclean