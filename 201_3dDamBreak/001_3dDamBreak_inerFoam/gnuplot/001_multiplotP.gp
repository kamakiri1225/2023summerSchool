set multiplot layout 2,4

set xrange [0:8]
set yrange[0:12000]
set ylabel 'Pressure(Pa)'
set xlabel 'Time(sec)'

set grid

plot x
plot x**2
plot x**3
plot x**4
plot x**5
plot x**6
plot x**7
plot x**8

unset multiplot

