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

【誤記、修正】
- p.50,51：ラクタ形式→ラスタ形式
- コメントの細かい修正（3次元ダムブレイク）
- 衝撃波前後のランキン・ユゴニオの関係式と理想気体の断熱過程の式より求まる
- p.119で「計算実行後に以下のコマンドでデータ出力」
- p.135テーブルデータの実験のみ比較
- メッシュ作成や計算は時間の関係で講習中には行わない。postProcessingフォルダの計算後の出力データを使う。
- 計算結果を詳細に分析したい場合は、各自Allrunなどを実行してください。
