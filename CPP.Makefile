TARGET = yourtarget
SRCS = $(wildcard src/*.cpp) 
OBJS = $(patsubst src/%.cpp, obj/%.o, $(SRCS))

INCLUDES= -Isrc/3rd/utf8 -Isrc/3rd/SQLiteCpp 
COMFLAG = -Wall -O3 -Wno-deprecated -pthread --std=c++11 $(INCLUDES)
LDFLAGS = -Wall -O3 -pthread -DNDEBUG 
LIBS = -lsqlite3 src/3rd/libfoo.a

obj/%.o:src/%.cpp
	g++ $(COMFLAG) -c  $< -o $@

all: obj $(OBJS) libfoo.a 
	g++  $(LDFLAGS)  $(OBJS) $(LIBS) -o $(TARGET)
	@echo "all build ok."

libfoo.a:
	$(MAKE) -C ./src/3rd/
obj:
	test -d obj || mkdir obj
stop:
	killall $(TARGET)
start:
	./$(TARGET) 

.PHONY:clean
clean:
	rm -rf obj/*.o $(TARGET)
	$(MAKE) clean -C ./src/3rd/
