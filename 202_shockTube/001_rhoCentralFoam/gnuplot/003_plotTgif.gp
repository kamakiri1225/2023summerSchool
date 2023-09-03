set terminal gif animate delay 20
set output "gnuplot/result/T.gif"

set xrange[-5:5]
set yrange[220:450]
set xlabel "x[m]" font ",12"
set ylabel "T[K]" font ",12"

fileName="x_sec_T_p_rho_U.xy"
timeNames=system("/bin/ls ./postProcessing/sampleDict")

do for [tn in timeNames]{
	set title "time = ".tn
	plot \
	    "../exactSolution/time".tn.".csv" us 1:2 with line lw 2 lc rgb "black" title "exact solution",\
            "postProcessing/sampleDict/".tn."/".fileName us 1:2 with line lw 2 lc rgb "red" title "OpenFOAM"
}
unset output
set terminal qt 0
reset