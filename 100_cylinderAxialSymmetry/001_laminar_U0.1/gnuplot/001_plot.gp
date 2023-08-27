R=0.01
uz(x)=0.2*(1-(x/R)**2)
set xlabel "r[m]"
set ylabel "uz[m/s]

fnames=system("/bin/ls ./postProcessing/sampleDict")

plot "postProcessing/sampleDict/".fnames."/z_0.15m_U.xy" using 1:4 title "OpenFOAM laminar" lt 8 pt 6,uz(x) title "theory" with line lw 3
