set terminal png size 900, 600
set output "gnuplot/result/profileU.png"

set pointsize 1.4
set xlabel "x [m]"
set ylabel "z [m]"
set key horizontal top outside box
set xrange [-0.3:0.2]
set yrange [0.0:0.5]

theta=35*pi/180
set arrow from -0.3,0.05 to 0.0,0.05 nohead lc rgb "gray" lw 2
set arrow from  0.0,0.05 to 0.0,0.338-0.222*sin(theta) nohead lc rgb "gray" lw 2
set arrow from -0.3,0.338 to -0.222*cos(theta),0.338 nohead lc rgb "gray" lw 2
set arrow from -0.222*cos(theta),0.338 to 0.0,0.338-0.222*sin(theta) nohead lc rgb "gray" lw 2


set style line 1 lt 1 lw 2 lc rgb "black 

r=0.05
Ux(x)=(x/40)*r
Z(x)=x/1000
set key horizontal at 0.2, 0.53
set tmargin 3

r=0.05
Ux(x)=(x/40)*r
Z(x)=x/1000
plot \
     "< awk -F ',' 'NR==784,NR==793 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.243+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "Exp.",\
     "< awk -F ',' 'NR==795,NR==804 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.223+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==806,NR==815 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.203+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==817,NR==826 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.183+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==828,NR==841 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.163+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==843,NR==859 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.143+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==861,NR==880 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.123+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==882,NR==903 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.103+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==905,NR==928 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.083+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==930,NR==954 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.063+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==956,NR==982 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.043+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==984,NR==1011 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.023+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==1013,NR==1042 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (-0.003+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==4592,NR==4610 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (0.017+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==4611,NR==4629 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (0.037+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==4630,NR==4648 {print $3,$4}' ../expData/ahmed_35_lda.csv" using (0.087+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "postProcessing/sampleDict/1000/x-243_U.xy" using (-0.243+Ux($4)):3 with line ls 1 title "CFD", \
     "postProcessing/sampleDict/1000/x-223_U.xy" using (-0.223+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-203_U.xy" using (-0.203+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-183_U.xy" using (-0.183+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-163_U.xy" using (-0.163+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-143_U.xy" using (-0.143+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-123_U.xy" using (-0.123+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-103_U.xy" using (-0.103+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-83_U.xy" using (-0.083+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-63_U.xy" using (-0.063+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-43_U.xy" using (-0.043+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-23_U.xy" using (-0.023+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x-3_U.xy" using (-0.003+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x+17_U.xy" using (0.017+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x+37_U.xy" using (0.037+Ux($4)):3 with line ls 1 title "", \
     "postProcessing/sampleDict/1000/x+87_U.xy" using (0.087+Ux($4)):3 with line ls 1 title ""

set term qt
#pause -1
#    EOF

