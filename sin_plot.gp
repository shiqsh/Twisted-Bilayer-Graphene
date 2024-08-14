# 设置终端类型为 epslatex，生成 LaTeX 文件和对应的 EPS 图像文件
set terminal epslatex color standalone size 12cm,8cm
set output "sin_plot.tex"

# 设置图像大小，按照比例放大1.2倍
set size square 1.2

# 设置图表的横纵坐标标签，使用 LaTeX 进行标注
set xlabel "$x$"
set ylabel "$\sin(x)$"

# 设置 x 轴和 y 轴的范围
set xrange [-2*pi:2*pi]
set yrange [-1.5:1.5]

# 设置 x 轴刻度，并标注特殊点 π 和 2π
# 在 GNUplot 中，LaTeX 表达式的转义字符需要用双反斜杠来处理。比如 \pi 应该写成 \\pi
set xtics ("$- 2 \\pi$" -2*pi, "$-\\pi$" -pi, "$-\\frac{\pi}{2}$" -pi/2, "$0$" 0, "$\\frac{\\pi}{2}$" pi/2, "$\\pi$" pi, "$\\frac{3\\pi}{2}$" 3*pi/2, "$2\\pi$" 2*pi)


# 设置线型和颜色
set style line 1 lc rgb "blue" lw 2

# 绘制 sin(x) 函数曲线
plot sin(x) with lines linestyle 1 notitle

# 确认输出文件名
print "Output: sin_plot.tex"

