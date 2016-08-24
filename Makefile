init_files = a.txt b.txt dependents dependents1 dependents2


main: hello.o
	$(CC) -pthread $(LDFLAGS) -o $@ $^ -lz $(LIBS)
	time ./main

help:
	@echo learnning makefile

.o : .c
	$(CC) $(CFLAGS) -I. $(CPPFLAGS) -c -o $@ $<

init:
	@touch run.log
	@touch $(init_files)
	@echo

special_variable: init
	@echo special_variables Usage:
	@echo "\t"'$$^ is: ' $^
	@echo "\t"'$$< is: ' $<
	@echo "\t"'$$@ is: ' $@

clean:
	@echo "the prefix '-' mean does echo the commands itself."
	-rm $(init_files)
	-rm *.o main
