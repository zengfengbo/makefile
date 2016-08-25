# define vars
init_files = a.txt b.txt dependents dependents1 dependents2
CC = gcc-6

.PHONY: clean case_demo help init special_variables go

hello: hello.o
	$(CC) -pthread $(LDFLAGS) -o $@ $^ -lz $(LIBS)

go: hello
		time ./hello

help:
	@echo Learnning Makefile"\n"
	@echo Home Page:
	@echo	"\t"https://www.gnu.org/software/make/manual/html_node/index.html"\n"
	@echo "special_variables:"
	@echo "\t$$ "make special_variables
	@echo

.o : .c
	$(CC) $(CFLAGS) -I. $(CPPFLAGS) -c -o $@ $<

init:
	@touch run.log
	@touch $(init_files)

special_variable: init
	@echo special_variables:"\n"
	@echo "\t"'$$^ is: ' $^
	@echo "\t"'$$< is: ' $<
	@echo "\t"'$$@ is: ' $@
	@echo "\t"'$$(CC) is: ' $(CC)
	@echo "\t"'$$(AR) is: ' $(AR)

clean:
	@echo "the prefix '-' mean does echo the commands itself."
	-rm $(init_files)
	-rm *.o hello

case_demo:
	@case "hixxx" in \
	"hi") echo hi ;; \
	"hello") echo hello ;; \
	*) echo what ;; \
	esac
