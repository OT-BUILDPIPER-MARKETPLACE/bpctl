#!/usr/bin/python
import os
path = '/tmp'

# Before creating
dir_list = os.listdir(path)
print("List of directories and files before creation:")
print(dir_list)
print()

# Creates a new file
with open('myfile.txt', 'w') as fp:
    pass
    # To write data to new file uncomment
    # this fp.write("New file created")

# After creating
dir_list = os.listdir(path)
print("List of directories and files after creation:")
print(dir_list)