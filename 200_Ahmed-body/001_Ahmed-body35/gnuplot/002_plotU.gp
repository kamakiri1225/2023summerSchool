set xlabel "x [m]"
set ylabel "z [m]"

set xrange [-0.3:0.2]
set yrange [0.0:0.5]

theta=25*pi/180
set arrow from -0.3,0.05 to 0.0,0.05 nohead lc rgb "blue" lw 2
set arrow from  0.0,0.05 to 0.0,0.338-0.222*sin(theta) nohead lc rgb "red" lw 2
set arrow from -0.3,0.338 to -0.222*cos(theta),0.338 nohead lc rgb "green" lw 2
set arrow from -0.222*cos(theta),0.338 to 0.0,0.338-0.222*sin(theta) nohead lc rgb "black" lw 2

set style line 1 lt 1 lw 2 lc rgb "black 
set key horizontal at 0.2, 0.55
set tmargin 3

r=0.05
Ux(x)=(x/40)*r
Z(x)=x/1000
plot \
     "< awk -F ',' 'NR==762,NR==779 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.243+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "Exp.",\
     "postProcessing/sampleDict/1000/x-243_U.xy" using (-0.243+Ux($4)):3 with line ls 1 title "CFD"
reset