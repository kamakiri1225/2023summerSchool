set xtics -2,1,15
set grid
set noytics
set xrange [ -2.5 : 17 ]
set yrange [ 0 : 3 ]

unset border
set arrow from -2,3 to 15,3 nohead lw 3 lc rgb "blue"
set arrow from -2,1 to 0,1 nohead lw 3 lc rgb "red"
set arrow from 0,1 to 0,0 nohead lw 3 lc rgb "green"
set arrow from 0,0 to 15,0 nohead lw 3 lc rgb "black"
set arrow from 15,0 to 15,3 nohead lw 3 lt 0
set arrow from -2,1 to -2,3 nohead lw 3 lt 0

set pointsize 1
set xlabel "[x/H]" offset 45,1.55
scale = 1
plot \
"< awk -F ',' 'NR==1436,NR==1557 {print $2,$4}' ../exptData/fc_bs007.csv" using ($2/scale+3):1 title "" with p pt 6 lc rgb "red",\
"< cat postProcessing/sampleDict/*/x=3H_k_U.xy" using ($5/scale+3):2  title "" with lines lt 1 lc rgb "black"
#    EOF
