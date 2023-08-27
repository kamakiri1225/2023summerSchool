set xtics -2,1,15
set grid
set noytics
set xrange [ -2.5 : 17 ]
set yrange [ 0 : 3 ]

set xlabel "[x/H]" offset 32,-0.5

unset border
set arrow from -2,3 to 15,3 nohead lc rgb "blue" lw 3 
set arrow from -2,1 to 0,1 nohead lc rgb "red" lw 3 
set arrow from 0,1 to 0,0 nohead lc rgb "green" lw 3 
set arrow from 0,0 to 15,0 nohead lc rgb "black" lw 3 

plot x
