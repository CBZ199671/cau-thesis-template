# SPDX-License-Identifier: MIT
$pdf_mode = 5;
$out_dir = 'build';
$xelatex = 'xelatex -no-shell-escape -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$max_repeat = 5;
$clean_ext = 'run.xml bcf synctex.gz';
