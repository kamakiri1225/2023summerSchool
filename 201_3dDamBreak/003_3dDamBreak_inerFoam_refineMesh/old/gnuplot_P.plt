if (exist("n")==0 || n<0) n=0 #変数の初期化

point=n+1
sample=sprintf("%d",point+1) #数値を文字列(整数型)に変換

# 画像の保存
set terminal png
set output "gnuplot/result/graph_P".point.".png"
 
# 画枠のマージン 
set lmargin 15
set tmargin 5
set rmargin 10
set bmargin 5
set mxtics #set mxtics 10

# グリッドを表示
set grid

# 座標軸レンジとラベル
set yrange[0:12000]
set xlabel font "Arial,16"
set ylabel font "Arial,16"
set tics font "Arial,20"
set ylabel 'Pressure(Pa)' offset -2,0
set xlabel 'Time(sec)' offset 0,-1

# グラフタイトル
set title "Pressure P".point offset -5,0 font "Arial,24"

plot "exp_data/test_case_2_exp_data.csv" us 1:@sample with lines lt 8 lw 3 title "EXP", "postProcessing/probes/0/p" us 1:@sample with lines lt 7 lw 3 title "OpenFOAM"

if (n<7) pause 0.1; n=n+1; \
        reread        # スクリプトの再読み込み

n=-1
#end of script
