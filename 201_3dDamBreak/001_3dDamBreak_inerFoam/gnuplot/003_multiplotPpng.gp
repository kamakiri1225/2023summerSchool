set terminal png size 1500,600
set output "gnuplot/result/multiplot_p.png"

set multiplot layout 2,4

set xrange [0:8]
set yrange[0:12000]
set ylabel 'Pressure(Pa)'
set xlabel 'Time(sec)'

set grid

set style line 1 lt 8 lw 3
set style line 2 lt 7 lw 3

set title "P1"
plot "../expData/test_case_2_exp_data.csv" us 1:2 with line ls 1 title "EXP",\
      "postProcessing/probes/0/p" us 1:2 with lines ls 2 title "OpenFOAM"

set title "P2"
plot "../expData/test_case_2_exp_data.csv" us 1:3 with line ls 1 title "EXP",\
      "postProcessing/probes/0/p" us 1:3 with lines ls 2 title "OpenFOAM"

set title "P3"      
plot "../expData/test_case_2_exp_data.csv" us 1:4 with line ls 1 title "EXP",\
      "postProcessing/probes/0/p" us 1:4 with lines ls 2 title "OpenFOAM"
      
set title "P4"
plot "../expData/test_case_2_exp_data.csv" us 1:5 with line ls 1 title "EXP",\
      "postProcessing/probes/0/p" us 1:5 with lines ls 2 title "OpenFOAM"
      
set title "P5"
plot "../expData/test_case_2_exp_data.csv" us 1:6 with line ls 1 title "EXP",\
      "postProcessing/probes/0/p" us 1:6 with lines ls 2 title "OpenFOAM"
      
set title "P6"
plot "../expData/test_case_2_exp_data.csv" us 1:7 with line ls 1 title "EXP",\
      "postProcessing/probes/0/p" us 1:7 with lines ls 2 title "OpenFOAM"
      
set title "P7"
plot "../expData/test_case_2_exp_data.csv" us 1:8 with line ls 1 title "EXP",\
      "postProcessing/probes/0/p" us 1:8 with lines ls 2 title "OpenFOAM"
      
plot "../expData/test_case_2_exp_data.csv" us 1:9 with line ls 1 title "EXP",\
      "postProcessing/probes/0/p" us 1:9 with lines ls 2 title "OpenFOAM"

unset multiplot
set term qt
reset
