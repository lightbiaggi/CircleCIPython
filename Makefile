
NAME := toil
INSTALLROOT := installdir
INSTALLDIR := $(INSTALLROOT)/$(NAME)

describe := $(shell git describe --dirty)
tarfile := $(NAME)-$(describe).tar.gz

all:
	false

# python-coverage pulls in these other packages
# - libjs-jquery-hotkeys libjs-jquery-isonscreen libjs-jquery
#   libjs-jquery-tablesorter
# however, it also wants jquery.debounce, which is not packaged.. (but not
# required for functionality...)
# 
build-dep:
	apt-get install python2.7
	apt-get install python-coverage

install:
	mkdir -p $(INSTALLDIR)
	cp -pr lib $(INSTALLDIR)/lib
	install -p theprogram.py $(INSTALLDIR)

tar:    $(tarfile)

$(tarfile):
	$(MAKE) install
	tar -v -c -z -C $(INSTALLROOT) -f $(tarfile) .

test:
	./run_tests.py

cover:
	./run_tests.py cover

clean:
	rm -rf htmlcov .coverage
	find . -name '*.pyc' -print0 |xargs -0 rm
