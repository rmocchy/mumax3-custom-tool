import subprocess as sp
import os

def Execute(path:str, is_test:bool = True):
    mx3_exec_cmd = "mumax3-test" if is_test else "mumax3"
    mx3_conv_cmd = "mumax3-convert-test" if is_test else "mumax3-convert"
    
    # mumax3コマンド実行箇所
    exec_process = sp.Popen([f"{mx3_exec_cmd}", f"{path}"], stdout=sp.PIPE, stderr=sp.PIPE, text=False)
    for line in exec_process.stdout:
        print(line, end='')  # 標準出力の内容を表示
    for line in exec_process.stderr:
        print(line, end='')  # 標準エラーの内容を表示
    exec_process.wait()

    # .outディレクトリが存在するか
    file_name = os.path.basename(path)
    dir_path = os.path.join(os.path.dirname(path), f"{file_name}.out")
    if not os.path.exists(dir_path):
        print("not exist output files")
    
    # conv実行箇所
    conv_process = sp.Popen([f"{mx3_conv_cmd}", f"{dir_path}", "-png", "*.ovf"], stdout=sp.PIPE, stderr=sp.PIPE, text=False)
    for line in conv_process.stdout:
        print(line, end='')  # 標準出力の内容を表示
    for line in conv_process.stderr:
        print(line, end='')  # 標準エラーの内容を表示
    conv_process.wait()

