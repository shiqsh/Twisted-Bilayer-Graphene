# 设置终端类型为 epslatex，生成 LaTeX 文件和对应的 EPS 图像文件
set terminal epslatex color standalone size 12cm,12cm
fnstr="eb"
set output sprintf("%s.tex", fnstr)

# set the parameter
tr = 1

# set the name of inputfile
inputfile = 'eb.dat'

# 去掉图例
unset key

# 设置图像大小，按照比例放大1.2倍
set size square 1.2

# 设置图表的横纵坐标标签
set xlabel "K-Path"
set ylabel "Energy$(\\mathrm{eV})$"

# 使用 Gnuplot 统计功能获取行号x值
stats inputfile using 1 every ::0::0 nooutput # 第一行 (A)
A = STATS_min

stats inputfile using 1 every ::99::99 nooutput # 第100行 (B)
B = STATS_min

stats inputfile using 1 every ::199::199 nooutput # 第200行 (C)
C = STATS_min

stats inputfile using 1 every ::299::299 nooutput # 第300行 (D)
D = STATS_min

stats inputfile using 1 every ::399::399 nooutput # 第400行 (E)
E = STATS_min

# set the xtics
set xtics ("$\\boldsymbol{K}_{M}$" A , "$\\boldsymbol{K}^{\\prime}_{M}$" B , "$\\boldsymbol{\\Gamma}_{M}$" C , "$\\boldsymbol{M}_{M}$" D , "$\\boldsymbol{K}_{M}$" E )


# 设置y轴范围
#set yrange [-0.2:0.2]

set style line 1 lc rgb "red" lw 2 lt 1       # 线形1：红色
set style line 2 lc rgb "blue" lw 2 lt 2      # 线形2：蓝色
set style line 3 lc rgb "green" lw 2 lt 3     # 线形3：绿色
set style line 4 lc rgb "black" lw 2 lt 4     # 线形4：黑色，原来是品红
set style line 5 lc rgb "cyan" lw 2 lt 5      # 线形5：青色
set style line 6 lc rgb "orange" lw 2 lt 6    # 线形6：橙色
set style line 7 lc rgb "brown" lw 2 lt 7     # 线形7：棕色
set style line 8 lc rgb "purple" lw 2 lt 8    # 线形8：紫色
set style line 9 lc rgb "gold" lw 2 lt 1      # 线形9：金色
set style line 10 lc rgb "skyblue" lw 2 lt 2  # 线形10：天蓝色

# 绘图，指定线形
plot for [i=2 : 4*(2*tr+1)**2+1] 'eb.dat' using 1:i with lines 
#plot 'datafile.dat' u 1:6 w l ls 5

# 确认输出文件名
print sprintf("Output: %s.tex %s.ps", fnstr, fnstr)
#print 4*(2*tr+1)**2+1

