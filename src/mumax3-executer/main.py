from execute import Execute
import sys
import os

def main():
    args = sys.argv
    if len(args) <  3:
        print("src/mumax3-executer/main.py : not enough args")
        return
    abs_path = os.path.abspath(args[2]) 
    if len(args) >= 3 and args[1] == 'test':
        execute_in_bulk(abs_path, True)
    if len(args) >= 3 and args[1] == 'exec':
        execute_in_bulk(abs_path, False)
    return

def execute_in_bulk(dir_path:str, is_test:bool = True):
    mx3_paths = find_mx3_files(dir_path)
    for mx3_path in mx3_paths:
        Execute(mx3_path, is_test)
    return

def find_mx3_files(dir_path:str):
    mx3_paths = []
    for item in os.listdir(dir_path):
        item_path = os.path.join(dir_path, item)

        if os.path.isfile(item_path) and item.endswith(".mx3"):
            mx3_paths.append(item_path)
        elif os.path.isdir(item_path):
            mx3_paths.extend(find_mx3_files(item_path))
    return mx3_paths

main() 



