#!/usr/bin/env python

import shutil
from os import walk
from os.path import join, dirname


def mv_vf(workdir):
    li = []
    for root, dirs, files in walk(workdir):
        for file in files:
            # 检查文件名是否包含"VT"并且后缀为".ttf"
            if "VF" in file and file.endswith(".ttf"):
                to = file.replace(" ", "_")
                li.append(to)
                if root != workdir:
                    # 构建源文件路径
                    source_file_path = join(root, file)
                    # 构建目标文件路径，即当前目录下
                    target_file_path = join(workdir, to)
                    # 移动文件
                    shutil.move(source_file_path, target_file_path)
    li.sort()
    return li


li = mv_vf(join(dirname(__file__), "tmp/misans"))

print(li)
