set xlabel "x [m]"
set ylabel "z [m]"

set xrange [-0.3:0.2]
set yrange [0.0:0.5]

theta=25*pi/180
set arrow from -0.3,0.05 to 0.0,0.05 nohead lc rgb "blue" lw 2
set arrow from  0.0,0.05 to 0.0,0.338-0.222*sin(theta) nohead lc rgb "red" lw 2
set arrow from -0.3,0.338 to -0.222*cos(theta),0.338 nohead lc rgb "green" lw 2
set arrow from -0.222*cos(theta),0.338 to 0.0,0.338-0.222*sin(theta) nohead lc rgb "black" lw 2

plot x
reset