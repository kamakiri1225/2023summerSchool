set terminal png size 1200,400
set output "gnuplot/result/002_multiplot.png"

set tmargin at screen 0.8
set multiplot layout 1,3
set ytics 0.05
set xrange[0:0.01] reverse
set yrange[0:0.2]
set grid
set key horizontal at 0.2, 0.0125

R=0.01
#r(x)=R*(1-(x/0.2) )**0.5
uz(x)=0.2*(1-(x/R)**2)
set xlabel "uz[m/s]"
set ylabel "r[m]"

fnames=system("/bin/ls ./postProcessing/sampleDict")

set title "z=0.001m"
plot \
      uz(x) notitle with line lw 3 lt 2,\
      "postProcessing/sampleDict/".fnames."/z_0.001m_U.xy" using 1:4 notitle lt 8 pt 6

set title "z=0.05m"
plot \
     uz(x) notitle with line lw 3 lt 2,\
     "postProcessing/sampleDict/".fnames."/z_0.05m_U.xy" using 1:4 notitle lt 8 pt 6

set title "z=0.15m"
plot \
     uz(x) notitle with line lw 3 lt 2,\
     "postProcessing/sampleDict/".fnames."/z_0.15m_U.xy" using 1:4 title "OpenFOAM laminar" lt 8 pt 6

unset multiplot
