set terminal png size 1000, 400

set output "gnuplot/result/".FILE.".png"
replot

reset
set term x11
#    EOF
