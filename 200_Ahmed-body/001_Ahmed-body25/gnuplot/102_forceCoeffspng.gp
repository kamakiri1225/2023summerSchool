set terminal png size 600,480
set output "gnuplot/result/forceCoeffs.png"
set yrange [0.2:0.5]
set xlabel "step" font ",12"
set ylabel "forceCoeffs" font ",12"
set grid

plot \
    0.299 title "Exp." lc rgb "black" dt 2 lw 2,\
    "postProcessing/forceCoeffs1/0/coefficient.dat" us 1:2 with line lc rgb "red" lw 2 title "OpenFOAM"

set terminal qt 0
reset