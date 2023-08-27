from matplotlib.animation import ArtistAnimation
import os
import matplotlib.pyplot as plt
import numpy as np

# 全部のグラフを2列ずつにしてまとめる
def AllAnimation(scheme_list, ExecutionTime_list):
    ax_list = []
    fig = plt.figure(figsize = (14, 50))
    plt.subplots_adjust(left=0.1, right=0.9, bottom=0.01, top=0.95, wspace=0.6, hspace=0.6)
    time_list = os.listdir(f'./resultDir/orgCase_{0}/postProcessing/samples')
    for i, scheme in enumerate(scheme_list):
        #グラフを表示する領域を，figオブジェクトとして作成．
        col = len(scheme_list)//2 + 1
        ax_list.append(fig.add_subplot(col,2,i+1))
    
    frames = []
    for time in time_list[::2]:
        frame = []
        print(time)
        title = ax.text(0, 1.05, 'Time: {time}', fontsize=15) # 追加
        for i, scheme in enumerate(scheme_list):
            temp_data = np.loadtxt(f'./resultDir/orgCase_{i}/postProcessing/samples/{time}/x_T_T.xy').T
            
            frame.append(ax_list[i].plot(temp_data[0], temp_data[1], color="blue")[0])
            
            # 計算時間
            ExecutionTime = ExecutionTime_list[i]
            ax_list[i].text(0, 1.5,ExecutionTime)
            ax_list[i].grid()
            ax_list[i].set_yticks(np.arange(-0.5,2,0.25))
            ax_list[i].set_xlabel("X(m)", fontsize=12)
            ax_list[i].set_ylabel("Temperature(K)", fontsize=12)
            ax_list[i].set_title(f"Temperature Advection Equation({scheme})", fontsize=12)
      
        frames.append(frame)
            
    ani = ArtistAnimation(fig, frames, interval=1)
    ani.save("anim1-18.gif", writer="pillow")


# ========== main  ==========
AllAnimation(scheme_list, ExecutionTime_list)