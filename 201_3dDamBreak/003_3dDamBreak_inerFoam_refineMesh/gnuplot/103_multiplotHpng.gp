set terminal png size 1500,400
set output "gnuplot/result/multiplot_H.png"

set multiplot layout 1,4

set xrange [0:8]
set yrange[0:0.6]
set tics font "Arial,20"

set ylabel 'Water Hight(m)' offset -0.5,0 font "Arial,16："
set xlabel 'Time(sec)' offset 0,-1 font "Arial,16"

set grid
set lmargin 10

set style line 1 lt 8 lw 3
set style line 2 lt 7 lw 3

set title "H1"
plot "../expData/test_case_2_exp_data.csv" us 1:10 with line ls 1 title "EXP",\
      "postProcessing/interfaceHeight/0/height.dat" us 1:2 with lines ls 2 title "OpenFOAM"

set title "H2"
plot "../expData/test_case_2_exp_data.csv" us 1:11 with line ls 1 title "EXP",\
      "postProcessing/interfaceHeight/0/height.dat" us 1:4 with lines ls 2 title "OpenFOAM"

set title "H3"      
plot "../expData/test_case_2_exp_data.csv" us 1:12 with line ls 1 title "EXP",\
      "postProcessing/interfaceHeight/0/height.dat" us 1:6 with lines ls 2 title "OpenFOAM"
      
set title "H4"
plot "../expData/test_case_2_exp_data.csv" us 1:13 with line ls 1 title "EXP",\
      "postProcessing/interfaceHeight/0/height.dat" us 1:8 with lines ls 2 title "OpenFOAM"
      
unset multiplot
set term qt
reset