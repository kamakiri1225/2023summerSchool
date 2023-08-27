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

def custom_sort_key(file_name):
    # ファイル名から数字部分を抽出して返す
    match = re.search(r'(-?\d+)', file_name)
    if match:
        return int(match.group())
    return file_name
    
    
# ファイル名を数字部分と非数字部分に分割するための正規表現パターン
pattern = r'(\d*\.\d+|\d+)'
resultDir = Path("../postProcessing/sampleDict")  # 計算フォルダ
latestTime = sorted([a for a in os.listdir(resultDir) if is_int(a)], key=float)[-1] # latestTimeを抜き出す
sampleDictdata = resultDir/ latestTime

# x=からはじまるデータのみが必要
caseList = [data for data in os.listdir(sampleDictdata) if "x=" in data]
caseList = sorted(caseList, key=custom_sort_key)

# グラフのセット    
fig, axes = plt.subplots(1, 1, figsize=(16,6))
fig.subplots_adjust(left=0.1, right=0.9, bottom=0.1, top=0.6)  # 余白を調整

# 軸の範囲の設定
axes.set_xlim([-2.5, 17])
axes.set_ylim([0, 3])


# 枠の始点と終点をリスト化
point_list = [
    {'start': [-2, 3],'end': [15, 3], 'color': 'blue'},
    {'start': [-2, 1],'end': [ 0, 1], 'color': 'red'},
    {'start': [ 0, 1],'end': [ 0, 0], 'color': 'green'},
    {'start': [15, 0],'end': [15, 3], 'color': 'gray'},
    {'start': [-2, 1],'end': [-2, 3], 'color': 'gray'},
]

# 枠を作成
for point in point_list:
    axes.annotate('', xy=point['end'], xytext=point['start'],
                arrowprops=dict(arrowstyle='-', 
                                connectionstyle='arc3', 
                                facecolor=point['color'], 
                                edgecolor=point['color'])
           )

# 横軸：流速、縦軸：高さでプロット
for i, zCase in enumerate(caseList):
    match = re.search(r'(-?\d+)', zCase)
    if match:
        z_pos = int(match.group())
    else:
        print("No number found in the file name.")
    
    # OpenFOAMのデータをデータフレームで取得
    df_cae = pd.read_table(sampleDictdata/zCase, index_col=False, names=('x[m]', 'y[m]', 'z[m]', 'k[m2/s2]', 'Ux[m/s]', 'Uy[m/s]', 'Uz[m/s]'))
    if i != len(caseList) - 1:
        axes.scatter(df_cae["Ux[m/s]"] + z_pos, df_cae["y[m]"], color="red")
    else:
        axes.scatter(df_cae["Ux[m/s]"] + z_pos, df_cae["y[m]"], color="red", label="OpenFOAM")



# 実験データをデータフレームの取得する行をリスト化
data_list = [
    {'start_row': 1188, 'end_row':1309},
    {'start_row': 1312, 'end_row':1433},
    {'start_row': 1436, 'end_row':1557},
    {'start_row': 1560, 'end_row':1681},
    {'start_row': 1684, 'end_row':1805},
    {'start_row': 1808, 'end_row':1929},
    {'start_row': 1932, 'end_row':2053},
    {'start_row': 2056, 'end_row':2177},
    {'start_row': 2180, 'end_row':2301},
    {'start_row': 2304, 'end_row':2425}
]

for i, data in enumerate(data_list):
    start_row = data_list[i]['start_row']
    end_row = data_list[i]['end_row']
    nrows = end_row - start_row+1
    
    df_exp = pd.read_csv("../exptData/fc_bs007.csv", skiprows=range(1, start_row-2), nrows=nrows, header=1)
    
    if i != len(data_list) - 1:
        axes.scatter(df_exp["U/Uc"].values + df_exp["x/H"].values,df_exp["y/H"].values, color="black", marker='o', edgecolors='black', facecolors='none')
    else:
        axes.scatter(df_exp["U/Uc"].values + df_exp["x/H"].values,df_exp["y/H"].values, color="black", marker='o', edgecolors='black', facecolors='none',  label="expdata")

axes.legend(loc="upper center",bbox_to_anchor=(0.9, 1.5), fontsize=12)
axes.set_xlabel("x/H")
axes.grid('-')

plt.savefig("plot.png")
