# Makefile
#
# This file is part of ZX Beep
# (http://programandala.net

# Last modified 201709180008
# See change log at the end of the file

# ==============================================================
# Requirements

# SBim
# http://programandala.net/en.program.sbim.html

# ==============================================================
# Notes

# $@ = the name of the target of the rule
# $< = the name of the first prerequisite
# $? = the names of all the prerequisites that are newer than the target
# $^ = the names of all the prerequisites

# `%` works only at the start of the filter pattern

# ==============================================================

VPATH = ./

MAKEFLAGS = --no-print-directory

.PHONY: all
all: zx_beep_bas

.PHONY: clean
clean:
	rm -f zx_beep_bas

zx_beep_bas: zx_beep.bas
	sbim $< $@

# ==============================================================
# Change log

# 2017-09-17: Start.
