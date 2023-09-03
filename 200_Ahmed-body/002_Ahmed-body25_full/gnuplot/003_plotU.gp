set xlabel "x [m]"
set ylabel "z [m]"

set xrange [-0.3:0.2]
set yrange [0.0:0.5]

theta=25*pi/180
set arrow from -0.3,0.05 to 0.0,0.05 nohead lc rgb "blue" lw 2
set arrow from  0.0,0.05 to 0.0,0.338-0.222*sin(theta) nohead lc rgb "red" lw 2
set arrow from -0.3,0.338 to -0.222*cos(theta),0.338 nohead lc rgb "green" lw 2
set arrow from -0.222*cos(theta),0.338 to 0.0,0.338-0.222*sin(theta) nohead lc rgb "black" lw 2

set style line 1 lt 1 lw 2 lc rgb "black"

set key horizontal top outside box
set tmargin 3

r=0.05
Ux(x)=(x/40)*r
Z(x)=x/1000
plot \
     "< awk -F ',' 'NR==762,NR==779 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.243+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "Exp.",\
     "< awk -F ',' 'NR==781,NR==795 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.223+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==797,NR==813 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.203+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==815,NR==838 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.183+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==840,NR==863 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.163+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==865,NR==890 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.143+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==892,NR==918 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.123+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==920,NR==947 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.103+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==949,NR==976 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.083+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==978,NR==1006 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.063+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==1008,NR==1038 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.043+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==1040,NR==1070 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.023+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==1072,NR==1101 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (-0.003+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==7288,NR==7307 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (0.017+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==7309,NR==7326 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (0.037+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
     "< awk -F ',' 'NR==7328,NR==7346 {print $3,$4}' ../expData/ahmed_25_lda.csv" using (0.087+Ux($2)):(Z($1)) with points pt 7 lc "red"  title "",\
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
