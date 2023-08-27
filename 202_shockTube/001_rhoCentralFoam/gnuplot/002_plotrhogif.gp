set terminal gif animate delay 20
set output "gnuplot/result/rho.gif"

set xrange[-5:5]
set yrange[0:1.2]
set xlabel "x[m]" font ",12"
set ylabel "rho[kg/m3]" font ",12"

fileName="x_sec_T_p_rho_U.xy"
timeNames=system("/bin/ls ./postProcessing/sampleDict")

set yrange[0:1.2]
do for [tn in timeNames]{
	set title "time = ".tn
	plot \
	    "../exactSolution/time".tn.".csv" us 1:4 with line lw 2 lc rgb "black" title "exact solution",\
            "postProcessing/sampleDict/".tn."/".fileName us 1:4 with line lw 2 lc rgb "red" title "OpenFOAM"
}
unset output
set terminal qt 0
