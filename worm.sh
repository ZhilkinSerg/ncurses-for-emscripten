emcc ./worm.c \
  -L ./ncurses-6.1-llvm/lib \
  -I ./ncurses-6.1-llvm/test \
  -I ./ncurses-6.1-llvm/include \
  -lncurses_g \
  --preload-file lib/terminfo@/home/web_user/.terminfo \
  -o compiled.js \
  -Ugetenv \
  -D"getenv(name)=(char*) EM_ASM_INT ( {var envar = JSON.stringify(name);var ret=allocate(intArrayFromString(envar), 'i8', ALLOC_NORMAL);return ret ;},NULL)" \
  -g4 \
  -s WASM=1 \
  -s ALLOW_MEMORY_GROWTH=1
