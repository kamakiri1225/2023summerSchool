set xrange [0:8]
set yrange [-1000:9000]
set xlabel "time[sec]"
set ylabel "Pressure[Pa]"
set grid

plot \
    "../expDate/SPHERIC_TestCase10/data_files/lateral_water_1x.txt" us 1:($2*100) with line title "Exp.", \
    "postProcessing/probes/0/p" us 1:3 with line title "OpenFOAM"
