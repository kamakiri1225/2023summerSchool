set size 1,1
set pointsize 0.4

set xtics -2,1,15
set grid
set noytics
set xrange [ -2.5 : 17 ]
set yrange [ 0 : 3 ]
set key horizontal box at 9, 3.45

set xlabel "[x/H]" offset 32,-0.5
set tmargin 20
set bmargin 20
set lmargin 0
set rmargin 0
unset border
set arrow from -2,3 to 15,3 nohead lw 3
set arrow from -2,1 to 0,1 nohead lw 3
set arrow from 0,1 to 0,0 nohead lw 3
set arrow from 0,0 to 15,0 nohead lw 3
set arrow from 15,0 to 15,3 nohead lw 3 lt 0
set arrow from -2,1 to -2,3 nohead lw 3 lt 0

set arrow from -1,3 to -1,3.1 nohead lw 1
set arrow from 0,3 to 0,3.1 nohead lw 1
set arrow from 1,3 to 1,3.1 nohead lw 1
