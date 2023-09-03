set terminal qt

fileName="x_sec_T_p_rho_U.xy"

set xrange[-5:5]
set yrange[0:1.2]
set xlabel "x[m]" font ",12"
set ylabel "rho[kg/m3]" font ",12"

plot \
    "postProcessing/sampleDict/0.007/".fileName us 1:4 with line lw 2 lc rgb "red" title "OpenFOAM",\
    "../exactSolution/time0.007.csv" us 1:4 with line lw 2 lc rgb "black" title "Exact solution"
reset