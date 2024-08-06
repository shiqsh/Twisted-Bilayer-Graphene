#!/bin/bash

# 检查输入参数
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename.tex>"
    exit 1
fi

texfile=$1
filename="${texfile%.*}"

# 编译 LaTeX 文件生成 PDF
pdflatex "$texfile"
if [ $? -ne 0 ]; then
    echo "pdflatex compilation failed."
    exit 1
fi

# 将PDF转换为EPS（如果需要）
pdftocairo -eps "${filename}.pdf" "${filename}.eps"

# 清理过程中产生的多余文件，保留PDF、EPS和.tex文件
rm -f "${filename}.aux" "${filename}.log" "${filename}.nav" "${filename}.out" "${filename}.snm" "${filename}.toc" "${filename}.vrb" "${filename}-inc-eps-converted-to.pdf"

# 删除由gnuplot生成的额外的EPS文件
rm -f "${filename}-inc.eps"

echo "PDF and EPS files have been generated and auxiliary files cleaned: ${filename}.pdf, ${filename}.eps"


