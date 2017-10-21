# Makefile
#
# This file is part of an SBASIC Library under development
# http://programandala.net

# Last modified 201710211745
# See change log at the end of the file

# ==============================================================
# Requirements

# SBim
# http://programandala.net/en.program.sbim.html

# Glorara
# http://programandala.net/en.program.glosara.html

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
clean: cleantmp cleantarget cleandoc

.PHONY: cleantmp
cleantmp:
	rm -f tmp/*

.PHONY: cleantarget
cleantarget:
	rm -f target/*_bas

.PHONY: cleandoc
cleandoc:
	rm -f doc/*

# ==============================================================
# Target

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
# Documentation

%.html: %.adoc
	asciidoctor --out-file=$@ $<

%.pdf: %.html
	htmldoc \
		--book \
		--continuous \
		--no-toc \
		--linkcolor blue \
		--linkstyle plain \
		--header " t " \
		--footer "  1" \
		--format pdf14 \
		$< > $@

tmp/modules.txt: $(modules)
	ls -1 $^ > $@

tmp/sbira_glossary.adoc: tmp/modules.txt
	glosara --level=3 --input=$< > $@

doc/sbira_manual.adoc: README.adoc tmp/sbira_glossary.adoc
	cat $^ > $@

.PHONY: doc
doc: \
	doc/sbira_manual.html \
	doc/sbira_manual.pdf

# ==============================================================
# Change log

# 2017-09-17: Start.
#
# 2017-09-20: Rewrite to convert all files from the <src> directory into the
# <target> directory.
#
# 2017-10-18: Improve. Build not only the individual modules, but also all of
# them into a single file.
#
# 2017-10-20: Build manual in HTML and PDF from the source documentation.
#
# 2017-10-21: Update requirements.
