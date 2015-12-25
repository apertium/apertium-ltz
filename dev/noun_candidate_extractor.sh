#!/bin/bash

cat wiki.crp.txt | grep -o -E "(^| )[eE]ng [A-Z][a-z]+($|[.,?\!]| [^A-Z])" | sed -r 's/^ ?[eE]ng ([A-Z][a-z]+).*/\1/' > noun_candidates_eng.txt
cat noun_candidates_eng.txt | sort -f | uniq -c | sort -nr > noun_candidates_eng_hitparade.txt
cat noun_candidates_eng_hitparade.txt | sed -r 's/ *([0-9]+) (.*)/<e lm="\2"><i>\2<\/i><par n="CANDIDATE-eng-xxx__n_f"\/><\/e>    <!-- \1 -->/' | sort > noun_candidates_eng.dix
