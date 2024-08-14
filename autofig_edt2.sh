#!/bin/bash

# PDF阅读器设置
pdf_reader="evince"

# 遍历当前目录下的所有.gp文件
for gpfile in *.gp; do
    if [[ -f "$gpfile" ]]; then
        # 获取不带扩展名的文件名
        basename="${gpfile%.*}"

        echo "Processing: $gpfile"

        # 执行gnuplot，生成LaTeX和EPS文件
        gnuplot "$gpfile"

        # 编译LaTeX文件生成PDF
        pdflatex "${basename}.tex"
        if [ $? -ne 0 ]; then
            echo "pdflatex compilation failed for ${basename}.tex."
            continue # 跳过当前循环的其余部分
        fi

        # 将PDF转换为EPS（如果需要）
        pdftocairo -eps "${basename}.pdf" "${basename}.eps"

        # 清理过程中产生的多余文件，保留PDF、EPS和.tex文件
        rm -f "${basename}.aux" "${basename}.log" "${basename}.nav" "${basename}.out" "${basename}.snm" "${basename}.toc" "${basename}.vrb" "${basename}-inc-eps-converted-to.pdf"

        # 删除由gnuplot生成的额外的EPS文件
        rm -f "${basename}-inc.eps"

        echo "PDF and EPS files have been generated and auxiliary files cleaned: ${basename}.pdf, ${basename}.eps"

        # 打开PDF文件
        if command -v $pdf_reader >/dev/null 2>&1; then
            $pdf_reader "${basename}.pdf" &
        else
            echo "PDF reader not found. Please open the PDF manually."
        fi
    fi
done

# 如果没有找到任何.gp文件
if [ $(ls *.gp 2>/dev/null | wc -l) -eq 0 ]; then
    echo "No gnuplot (.gp) files found in the current directory."
fi
