set log y

plot "postProcessing/residuals/0/solverInfo.dat" us 1:3 with line,\
     "postProcessing/residuals/0/solverInfo.dat" us 1:6 with line,\
     "postProcessing/residuals/0/solverInfo.dat" us 1:9 with line,\
     "postProcessing/residuals/0/solverInfo.dat" us 1:14 with line
