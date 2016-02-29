VPATH = .
SRCS = $(wildcard SQLiteCpp/*.cpp ) 
OBJS = $(patsubst %.cpp, %.o, $(SRCS))

INCLUDES= -I./SQLiteCpp/
CFLAGES = -Wall -O3 -Wno-deprecated $(INCLUDES) --std=c++11

%.o:%.cpp
	g++ $(CFLAGES) -c  $< -o $@

libfoo: $(OBJS)
	ar -crv libfoo.a $(OBJS)
	@echo "."
	@echo "libfoo.a make succeed."
clean:
	rm -rf $(OBJS) libfoo.a 
