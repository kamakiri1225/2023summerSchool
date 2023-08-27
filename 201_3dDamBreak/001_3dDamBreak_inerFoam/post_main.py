import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path
import os
 
def graph_photo(df_exp, df_cae, cols_dic):
    for cols in cols_dic:
        fig = plt.figure(figsize=(24,8))
        plt.subplots_adjust(wspace=0.3, hspace=0.6)
 
        for i, point in enumerate(cols_dic[cols][1:]):
            ax = fig.add_subplot(2,4,i+1)
            ax.plot(df_exp['Time (s)'], df_exp[point], color='black', label='Exp data')
            ax.plot(df_cae['Time (s)'], df_cae[point], color='red', label='CAE data')
 
            if cols == 'pcolumns':
                ax.set_xlabel('Time(sec)', fontsize =16)
                ax.set_ylabel('Pressure(Pa)', fontsize = 16)
                ax.set_title(f'{point}', fontsize =16)
                ax.grid()
                ax.set_xlim(0,8)
                ax.set_ylim(0, 10000)
                ax.legend()
    
                fig.savefig('./photo/point.jpg')
            elif cols =='hcolumns':
                ax.set_xlabel('x(m)', fontsize =16)
                ax.set_ylabel('Height(m)', fontsize = 16)
                ax.set_title(f'{point}', fontsize =16)
                ax.grid()
                ax.set_xlim(0,8)
                ax.set_ylim(0, 1)
                ax.legend()
                fig.savefig('./photo/height.jpg')
            else:
                pass
 
 
# 実験データの取得
expfile = Path('exp_data/test_case_2_exp_data.csv')
df_exp = pd.read_csv(expfile,sep='\t').drop('Unnamed: 9', axis=1)
 
# カラムの取得
cols_dic = {
    'pcolumns': df_exp.columns[:9],
    'hcolumns': df_exp.columns[9:].insert(0,df_exp.columns[0])
}
 
# CAEデータの取得
caefile_p = Path('postProcessing/probes/0/p')
caefile_h = Path('postProcessing/interfaceHeight/0/height.dat')
 
df_cae_p = pd.read_csv(caefile_p, skiprows=[0,1,2,3,4,5,6,7,8,9], header=None, delim_whitespace=True).set_axis(cols_dic['pcolumns'],axis=1) #pressure data
#df_cae_h = pd.read_csv(caefile_h, skiprows=[0,1,2,3,4,5,6,7], header=None, delim_whitespace=True, usecols=[0,2,4,6,8]).set_axis(cols_dic['hcolumns'],axis=1) #height data
df_cae_h = pd.read_csv(caefile_h, header=None, delim_whitespace=True, usecols=[0,2,4,6,8]).set_axis(cols_dic['hcolumns'],axis=1) #height data
df_cae = df_cae_p.merge(df_cae_h) # CAEデータ pとhの結合
 
# make photo dir
if not os.path.exists('photo'):
    os.mkdir('photo')
 
# mainグラフ作成
graph_photo(df_exp, df_cae, cols_dic)