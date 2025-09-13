RAYLIB_DIR = /usr/local/lib
BASE_FLAGS = -program main -L -L$(RAYLIB_DIR) -L -lraylib

dynamic: $(wildcard *.scm)
	echo "$(BASE_FLAGS)" > all.options
	csm

static:
	echo "-static -L $(RAYLIB_DIR)/libraylib.a $(BASE_FLAGS)" > all.options
	csm

package: static
	mkdir -p movement-demo
	cp -R ../data movement-demo/
	cp main movement-demo/
	cp ../LICENSE movement-demo/
	tar -caf movement-demo.tar.gz movement-demo

clean:
	rm -fr main *.o *.so *.import.scm *.link movement-demo
