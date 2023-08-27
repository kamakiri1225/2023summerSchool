set xlabel "x"
set ylabel "y1"
 
set x2label "x2"
set y2label "y2"
 
plot x**2 axes x1y1, x**3 axes x2y2 with linespoints
