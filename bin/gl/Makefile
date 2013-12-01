FILE = main
SRCS = $(wildcard *.cpp)
HDRS = $(wildcard *.h)
OBJS = $(SRCS:%.cpp=%.o)

CC      = g++
CCFLAGS = -Wall -Wextra -g

# OpenGL
LDFLAGS += -framework Cocoa
LDFLAGS += -framework OpenGL

# SFML
LDFLAGS += -lsfml-system
LDFLAGS += -lsfml-window
LDFLAGS += -lsfml-graphics

all : $(FILE)

$(FILE): $(OBJS)
	$(CC) $(CCFLAGS) $(LDFLAGS) -o $@ $(OBJS)

%.o: %.cpp
	$(CC) $(CCFLAGS) -c $< -o $@

# Assemblage
%.s: %.cpp
	$(CC) $(CCFLAGS) -S $< -o $@

# Préprocesseur
%.i: %.cpp
	$(CC) $(CCFLAGS) -E $< -o $@

.PHONY: clean, proper, run

clean:
	rm -rf *.o *.i *.s 2> /dev/null

proper: clean
	rm -f $(FILE) *~ 2> /dev/null

run : $(FILE)
	./$(FILE)

