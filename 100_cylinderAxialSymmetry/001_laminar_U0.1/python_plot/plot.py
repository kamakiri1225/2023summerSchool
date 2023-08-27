import re
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import os, shutil
from pathlib import Path

# 文字列を含む要素を数字で昇順にする関数
def atoi(text):
    print(text)
    return int(text) if text.isdigit() else text

def natural_keys(text):
    return [ atoi(c) for c in re.split(r'(\d+)^', text) ]

# 数字であるかどうかの判定
def is_int(s):
    try:
        int(s)
        return True
    except ValueError:
        return False

# ファイル名を数字部分と非数字部分に分割するための正規表現パターン
pattern = r'(\d*\.\d+|\d+)'
resultDir = Path("../postProcessing/sampleDict")  # 計算フォルダ
latestTime = sorted([a for a in os.listdir(resultDir) if is_int(a)], key=float)[-1] # latestTimeを抜き出す
sampleDictdata = resultDir/ latestTime
# 数字部分だけを抜き出して、数値に変換してソートする
caseList = sorted(os.listdir(sampleDictdata), key=lambda f: [float(d) if d.isdigit() else d for d in re.split(pattern, f)])


# 理論式
Radius = 10/1000 # 半径 10mm = 0.01m
ub = 0.1       # 断面平均速度(流入速度0.1m/s)
y = np.arange(0,Radius,0.01/1000)
uy = 2*ub*(1-(y/Radius)**2)

# グラフのセット    
fig, axes = plt.subplots(1, 4, figsize=(24,8), tight_layout=True)

for i, zCase in enumerate(caseList):

    # OpenFOAMのデータをデータフレームで取得
    df_data = pd.read_table(sampleDictdata/zCase, index_col=False, names=('x[m]', 'y[m]', 'z[m]', 'Uz[m/s]'))
    # 横軸：流速、縦軸：動径方向でプロット
    axes[i].scatter(df_data["Uz[m/s]"], df_data["x[m]"], color="red", label="OpenFOAM")
    
    # 理論式のプロット
    axes[i].plot(uy, y, color="green", label="Theory")
    
    axes[i].set_ylabel("y[m]", fontsize=16)
    axes[i].set_xlabel("Uz[m/s]", fontsize=16)
    if i>=3: plt.legend(loc="upper center",bbox_to_anchor=(1.2, 1.0), fontsize=16)
    axes[i].grid("-")
    axes[i].set_title(f"z={zCase.split('_')[1]}", fontsize=20)

plt.savefig("plot.png")
