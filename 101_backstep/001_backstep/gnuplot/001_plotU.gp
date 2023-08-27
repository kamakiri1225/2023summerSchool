set xtics -2,1,15
set grid
set noytics
set xrange [ -2.5 : 17 ]
set yrange [ 0 : 3 ]

set lmargin 0
set rmargin 0
unset border
set arrow from -2,3 to 15,3 nohead lw 3 lc rgb "blue"
set arrow from -2,1 to 0,1 nohead lw 3 lc rgb "red"
set arrow from 0,1 to 0,0 nohead lw 3 lc rgb "green"
set arrow from 0,0 to 15,0 nohead lw 3 lc rgb "black"
set arrow from 15,0 to 15,3 nohead lw 3 lt 0
set arrow from -2,1 to -2,3 nohead lw 3 lt 0

plot x
