set title "Pressure P1"          # タイトル表示
set xlabel "Time(sec)"           # x軸ラベル表記
set ylabel "Puressure(Pa)"       # y軸ラベル表記
set xrange[0:8]                  # x軸範囲
set yrange[0:12000]              # y軸範囲
set grid                         # グリッド
#set terminal postscript eps
#set term postscript eps enhanced color
#set terminal eps
#set output "test_P1.eps"
set terminal png                 # 画像png形式
set output "test_P1.png"         # ファイル名
plot "../../exp_data/test_case_2_exp_data.csv" us 1:2 title "EXP" with line lt 8 lw 4, "../../postProcessing/probes/0/p" us 1:2 title "OpenFOAM" with line lt 7 lw 4

