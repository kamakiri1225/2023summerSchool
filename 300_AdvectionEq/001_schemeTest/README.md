# OpenFOAM-v2012_schemeTest

スカラー輸送方程式の移流項スキームを変えて解の振る舞いを確認
$$\frac{\partial T}{\partial t}+u\frac{\partial T}{\partial x}=0$$
![anim1-18-2](https://user-images.githubusercontent.com/36812492/227067590-ee98375e-6fb8-40e8-8595-57a0fbfd59e6.gif)
![anim18-36-3](https://user-images.githubusercontent.com/36812492/227067598-6f42a0b2-aae2-43b8-a19e-139e1f93816c.gif)

## ブログ記事
1. [【OpenFOAM】移流方程式で離散化スキームの勉強をする](https://takun-physics.net/15355/)
2. [【OpenFOAM】移流方程式で色々な離散化スキーム(解の振る舞いと計算時間)](https://takun-physics.net/15492/)

## アニメーション作成用のプログラム
```python
from pathlib import Path
import shutil
import subprocess
import numpy as np
from PyFoam.RunDictionary.ParsedParameterFile import ParsedParameterFile
import matplotlib.pyplot as plt
from matplotlib.animation import ArtistAnimation
import os

# スキームファイルを読み込む
def open_SchemeList():
    with open('./schemeTest') as f:
        scheme_list = [s.strip() for s in f.readlines()]
    return scheme_list

# baseをコピーする
def clone_file(orgCase, resultDir):
    "orgCaseをresultDirに重複しないようにコピー"
    baseName = Path(orgCase).name
 
    addName = None
    if addName!=None:
        baseName += f'_{addName}'
 
    Path(resultDir).mkdir(exist_ok=True, parents=True)
 
    n=0
    newCase = Path(resultDir) / f'{baseName}_{n}'
 
    while newCase.is_dir():
        n += 1
        newCase = Path(resultDir) / f'{baseName}_{n}'
 
    shutil.copytree(orgCase, newCase)
    
    return newCase

# スキームを入れ替える
def new_parameter(newScheme, newCase):
    fileScheme = ParsedParameterFile(newCase / 'system/fvSchemes')
    fileScheme.content['divSchemes']
    fileScheme.content['divSchemes']['div(phi,T)'] = f'Gauss {newScheme}'
    fileScheme.writeFile()
    
# Allrunスクリプトを実行する(postProcess)
def Allrun(newCase):
    "Allrunを実行"
    out_run = subprocess.check_output(['./Allrun'], cwd=newCase)
    return out_run.decode()

# グラフにする
def graph(scheme, newCase, resultDir):
    time_list = os.listdir(Path(newCase) / f'postProcessing/samples')
    plt.figure()
    for time in time_list[::7]:
        temp_data = np.loadtxt(Path(newCase) / f'postProcessing/samples/{time}/x_T_T.xy').T
        plt.plot(temp_data[0], temp_data[1],label=f'time = {time}')
        plt.legend()    

    plt.grid()
    plt.yticks(np.arange(-0.5,2,0.25))
    plt.xlabel("X(m)", fontsize=12)
    plt.ylabel("Temperature(K)", fontsize=12)
    plt.title(f"Temperature Advection Equation({scheme})", fontsize=16)
    
    # 画像賦存用データのフォルダ作成
    result_graph_dir = Path(resultDir)/'savefig'
    if(os.path.isdir(result_graph_dir) == False):
        os.mkdir(result_graph_dir)
    
    # グラフを保存
    plt.savefig(f'{result_graph_dir}/{scheme}.png')
    plt.close()

# 全部のグラフを2列ずつにしてまとめる
def Allgraph_png(scheme_list):
    fig = plt.figure(figsize = (12,36))
    for i, scheme in enumerate(scheme_list):
        print(f"{i} : make {scheme} fig")
         #グラフを表示する領域を，figオブジェクトとして作成．
        col = len(scheme_list)//2 + 1 
        ax1 = fig.add_subplot(col,2,i+1)
        time_list = os.listdir(f'./resultDir/orgCase_{i}/postProcessing/samples')

        for time in time_list[::7]:
            temp_data = np.loadtxt(f'./resultDir/orgCase_{i}/postProcessing/samples/{time}/x_T_T.xy').T
            ax1.plot(temp_data[0], temp_data[1],label=f'time = {time}')
            ax1.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0, fontsize=8)  

        plt.subplots_adjust(wspace=0.8, hspace=0.8)
        ax1.grid()
        ax1.set_yticks(np.arange(-0.5,2,0.25))
        ax1.set_xlabel("X(m)", fontsize=12)
        ax1.set_ylabel("Temperature(K)", fontsize=12)
        ax1.set_title(f"Temperature Advection Equation({scheme})", fontsize=12)


        # グラフを保存
        fig.savefig('./resultDir/savefig/Allschemes.png')
    plt.close()

# 全部のグラフを2列ずつにしてまとめる
def AllAnimation(scheme_list):
    ax_list = []
    fig = plt.figure(figsize = (14, 50))
    plt.subplots_adjust(left=0.1, right=0.9, bottom=0.01, top=0.95, wspace=0.6, hspace=0.6)
    time_list = os.listdir(f'./resultDir/orgCase_{0}/postProcessing/samples')
    for i, scheme in enumerate(scheme_list):
        #グラフを表示する領域を，figオブジェクトとして作成．
        print(f"{i} : animete {scheme} gif")
        col = len(scheme_list)//2 + 1
        ax_list.append(fig.add_subplot(col,2,i+1))
    
    frames = []
    for time in time_list[::2]:
        frame = []
        
        for i, scheme in enumerate(scheme_list):
            temp_data = np.loadtxt(f'./resultDir/orgCase_{i}/postProcessing/samples/{time}/x_T_T.xy').T
            
            frame.append(ax_list[i].plot(temp_data[0], temp_data[1], color="blue")[0])
            
            ax_list[i].grid()
            ax_list[i].set_yticks(np.arange(-0.5,2,0.25))
            ax_list[i].set_xlabel("X(m)", fontsize=12)
            ax_list[i].set_ylabel("Temperature(K)", fontsize=12)
            ax_list[i].set_title(f"Temperature Advection Equation({scheme})", fontsize=12)
      
        frames.append(frame)
            
    ani = ArtistAnimation(fig, frames, interval=1)
    ani.save("./resultDir/savefig/anim-all.gif", writer="pillow")

#================== main ========================
if (__name__ == "__main__"):# このファイルがmainファイルである場合に実行される
    orgCase = 'orgCase'
    resultDir = 'resultDir'

    # スキームのリスト
    scheme_list = open_SchemeList()
    # print(f'スキームの数 : {len(scheme_list)}')

    # 計算実行
    for i, scheme in enumerate(scheme_list):
        print(f'{i+1} ======== {scheme} =========')
        newCase = clone_file(orgCase, resultDir)   # 関数を実行する
        new_parameter(scheme, newCase)             # スキームを入れ替える
        Allrun(newCase)                            # 計算を実行
        graph(scheme, newCase, resultDir)          # グラフ化
        
    # 全てのグラフをまとめる
    Allgraph_png(scheme_list)
    AllAnimation(scheme_list)
```

# 計算事項に関する注意点

- ```# 計算実行```で計算実行しています。
計算させたい場合はmain.py内のコメントアウトしている場合は、コメントアウトを外してください。
- 計算実行時には、元のorgCaseからコピーして計算させていますが、ここにはメッシュ情報も含んでいます。
  今回のケースはメッシュ情報は同じなのでシンボリックリンクにしておく方が容量削減には良いです。

  ```python
  shutil.copytree(orgCase, newCase)
  ```
  ↓変更
  
  ```python
    PWD_ = os.getcwd() 
    shutil.copytree(orgCase, newCase) #フォルダのコピー
    shutil.rmtree(newCase /"constant/polyMesh") # メッシュ情報を削除
    os.symlink( PWD_/Path(orgCase) / "constant/polyMesh", newCase / "constant/polyMesh") #リンボリックリンク
  ```

  シンボリックリンクは```ln -s リンク先から見た相対パス   リンクの名称```なので、symlink関数での1つ目の引数は絶対パスにしています。
  
  ちょっとしたことかもしれませんが、メッシュが大きくなると有効になります。
