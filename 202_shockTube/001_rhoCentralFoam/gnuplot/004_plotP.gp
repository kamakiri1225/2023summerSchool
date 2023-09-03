set terminal gif animate delay 20
set output "gnuplot/result/p.gif"

set xrange[-5:5]
set yrange[0:110000]
set xlabel "x[m]" font ",12"
set ylabel "P[Pa]" font ",12"

fileName="x_sec_T_p_rho_U.xy"
timeNames=system("/bin/ls ./postProcessing/sampleDict")

do for [tn in timeNames]{
	set title "time = ".tn
	plot \
	    "../exactSolution/time".tn.".csv" us 1:3 with line lw 2 lc rgb "black" title "exact solution",\
            "postProcessing/sampleDict/".tn."/".fileName us 1:3 with line lw 2 lc rgb "red" title "OpenFOAM"
}
unset output
set terminal qt 0
reset