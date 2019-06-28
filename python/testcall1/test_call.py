import test_call_func
test_call_func.add(1,2)

# import sys
# sys.path.append('/home/sw/py/test/testfolder2')
# '''python import模块时， 是在sys.path里按顺序查找的。
# sys.path是一个列表，里面以字符串的形式存储了许多路径。
# 使用A.py文件中的函数需要先将他的文件路径放到sys.path中'''

# import test_call_func2
# test_call_func2.add(1,2)

import sys
sys.path.append('/home/sw/py/tools')

import test_call_func2
test_call_func2.add(1,2)


# import os
import sys
sys.path.append('/home/sw/py/tools')
import get_filename
import get_name_in

dataname = 'Bz_5s_Pdyn3'
path = '/home/sw/work/bs-mp/data/2Dfrom3Dtheta/' + dataname + '/'#指定文件所在路径
filetype ='line.npy'#指定文件类型
filename = get_filename.get_filename(path,filetype)
filename = sorted(filename)
print(filename)