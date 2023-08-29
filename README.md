# 2023summerSchool

OpenFOAMの結果と理論値・実験データとの比較を行うためのモデル

- 000_gnuplot
- 100_cylinderAxialSymmetry
- 101_backstep
- 200_Ahmed-body
- 201_3dDamBreak
- 202_shockTube
- 203_sloshingTank
- 300_AdvectionEq

OpenFOAM v2206
gnuplot 5.4


【やること】

- パワポの見直し
- Ahmed bodyの深い考察
- Ahmed bodyの揚力について
- Ahmed body境界条件（壁関数など）
- interfaceHeightの計算手法
- ベクター形式でアニメーション作成は可能か
- gnuplotの日本語読み
- cfMeshの無償、有償の違い
- CFDEMとOpenFOAMのDEMとの違い
- gnuplotでvector
- 行列ソルバの比較

【追加したい資料】

- 連続式の誤差、残差
- Ahmed bodyの抗力係数についての考察（現状0.37→フルモデルメッシュ分割0.3）
- FreeCADでモデル作成
- cfMeshで作成（ヘキサメッシュ、ポリヘドラル）

※cfMeshはヘキサメッシュで境界層の厚みを変えることができなかった。y+が小さすぎる（y+=5など）
ポリヘドラルメッシュはうまく動作しないときがある。
