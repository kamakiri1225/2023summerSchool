set title font "Arial,24"        #タイトルのフォントサイズ
set xlabel font "Arial,24"       #ラベルのフォントサイズ
set ylabel font "Arial,24"
set tics font "Arial,24"         #ticsはメモリ文字
set key font"Arial,24"           #keyは凡例

set lmargin 15
set rmargin 8
set title "test"
set xlabel "x"
set ylabel "sin(x)" offset -5,0
plot sin(x) title "test
