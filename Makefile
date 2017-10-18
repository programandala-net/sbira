# Makefile
#
# This file is part of an SBASIC Library under development
# http://programandala.net

# Last modified 201710181346
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

.ONESHELL:

.PHONY: all
all: modules target/sbira_bas

.PHONY: clean
clean:
	rm -f target/*_bas tmp/*.bas

header=src/_sbira_header.bas
modules=$(wildcard src/[a-z]*.bas)

.PHONY: modules
modules: $(modules)
	for source in $^; do
		target=$$(basename $$source)
		sbim $$source target/$${target%.*}_bas
	done

tmp/sbira.bas: $(header) $(modules)
	cat $^ > $@

target/sbira_bas: tmp/sbira.bas
	sbim $< $@

# ==============================================================
# Change log

# 2017-09-17: Start.
#
# 2017-09-20: Rewrite to convert all files from the <src> directory into the
# <target> directory.
#
# 2017-10-18: Improve. Build not only the individual modules, but also all of
# them into a single file.
