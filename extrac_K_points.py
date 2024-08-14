# 定义文件名
filename = "eb.dat"

# 行号索引，从0开始，所以要提取第1行、第100行、第200行、第300行和第400行，实际行号为0, 99, 199, 299, 399
rows_to_extract = [0, 99, 199, 299, 399]

# 用于存储提取的数据
extracted_data = []

# 打开文件并逐行读取
with open(filename, 'r') as file:
    for i, line in enumerate(file):
        if i in rows_to_extract:
            # 提取第一列的数据，加入到extracted_data列表
            extracted_data.append(line.split()[0])

# 将提取的数据输出在一行中
output_line = ' '.join(extracted_data)
print("Extracted data from specified rows in the first column:")
print(output_line)
