RAYLIB_DIR = /usr/local/lib
BASE_FLAGS = -program main -L -L$(RAYLIB_DIR) -L -lraylib

dynamic: $(wildcard *.scm)
	echo "$(BASE_FLAGS)" > all.options
	csm

static:
	echo "-static -L $(RAYLIB_DIR)/libraylib.a $(BASE_FLAGS)" > all.options
	csm

package: static
	mkdir -p package
	cp -R ../data package/
	cp main package/
	cp ../LICENSE package/
	tar -caf movement-demo.tar.gz package

clean:
	rm -fr main *.o *.so *.import.scm *.link package
