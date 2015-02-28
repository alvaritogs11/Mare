# -*- Makefile -*-
# Example standalone makefile for foreachmare

pms_SOURCES = filtroptr_tareas.cc

pms_OBJECTS = $(pms_SOURCES:%.cc=%.o)

# Same value as provided to MARE for the invocation of ./configure --prefix=...
MARE_PREFIX = /home/alvaro/Qualcomm/MARE/0.12.1/x86_64-linux-gnu/debug

CXX= g++ -std=c++11 -pthread
CPPFLAGS = -I$(MARE_PREFIX)/include
CXXFLAGS = -g -Wall -Wextra
LDFLAGS = -L$(MARE_PREFIX)/lib
LIBS= -lmare -lm

all: pms

pms: $(pms_OBJECTS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $^ $(LIBS) -o $@

.PHONY: clean
clean:
	$(RM) $(pms_OBJECTS) pms

.DELETE_ON_ERROR:
