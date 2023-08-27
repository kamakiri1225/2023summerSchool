call "gnuplot/common_layout.gp"
call "gnuplot/common_file.gp"

scale=1
set x2label "[U/U_c]" offset -18,0.5

plot \
"< awk -F ',' 'NR==1105,NR==1185 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale):1 title "Exp" with p pt 1 lc 1,\
"< awk -F ',' 'NR==1188,NR==1309 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+1):1 title "" with p pt 1 lc 1,\
"< awk -F ',' 'NR==1312,NR==1433 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+2):1 title "" with p pt 1 lc 1,\
"< awk -F ',' 'NR==1436,NR==1557 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+3):1 title "" with p pt 1 lc 1,\
"< awk -F ',' 'NR==1560,NR==1681 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+4):1 title "" with p pt 1 lc 1,\
"< awk -F ',' 'NR==1684,NR==1805 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+5):1 title "" with p pt 1 lc 1,\
"< awk -F ',' 'NR==1808,NR==1929 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+6):1 title "" with p pt 1 lc 1,\
"< awk -F ',' 'NR==1932,NR==2053 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+7):1 title "" with p pt 1 lc 1,\
"< awk -F ',' 'NR==2056,NR==2177 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+8):1 title "" with p pt 1 lc 1,\
"< awk -F ',' 'NR==2180,NR==2301 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+9):1 title "" with p pt 1 lc 1,\
"< awk -F ',' 'NR==2304,NR==2425 {print $2,$4}' exptData/fc_bs007.csv" using ($2/scale+10):1 title "" with p pt 1 lc 1,\
"< cat postProcessing/sampleDict/*/x=-2H_k_U.xy" using ($5/scale-2):2  title "CFD" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=-1H_k_U.xy" using ($5/scale-1):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=0H_k_U.xy" using ($5/scale  ):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=1H_k_U.xy" using ($5/scale+1):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=2H_k_U.xy" using ($5/scale+2):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=3H_k_U.xy" using ($5/scale+3):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=4H_k_U.xy" using ($5/scale+4):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=5H_k_U.xy" using ($5/scale+5):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=6H_k_U.xy" using ($5/scale+6):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=7H_k_U.xy" using ($5/scale+7):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=8H_k_U.xy" using ($5/scale+8):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=9H_k_U.xy" using ($5/scale+9):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=10H_k_U.xy" using ($5/scale+10):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=11H_k_U.xy" using ($5/scale+11):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=12H_k_U.xy" using ($5/scale+12):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=13H_k_U.xy" using ($5/scale+13):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=14H_k_U.xy" using ($5/scale+14):2  title "" with l lt 1 lc 0, \
"< cat postProcessing/sampleDict/*/x=15H_k_U.xy" using ($5/scale+15):2  title "" with l lt 1 lc 0
