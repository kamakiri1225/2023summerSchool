set style line 1 lc rgb "red“
set style line 2 lc rgb "blue" lw 3
set style line 3 lc rgb "blue" lw 3 dt 8
 
plot sin(x) ls 1 title "ls 1", cos(x) ls 2 title "ls 2", sin(2*x) ls 3 title "ls 3"

reset