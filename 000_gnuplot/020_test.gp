set terminal png font "Times,32" size 600, 480
set output "image/020_test.png"
plot [-10:10] [-2:2] sin(x) title "sin(x)"

set terminal pdf enhanced color solid font "Times,32" size 10cm,10cm
set output "image/020_test.pdf"
replot

set terminal postscript font "Times,32" size 600, 480
set output "image/020_test.eps"
replot

set terminal svg enhanced font "Times,32" size 600, 480
set output "image/020_test.svg"
replot

#set terminal qt
