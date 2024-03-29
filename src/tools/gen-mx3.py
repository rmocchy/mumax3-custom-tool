import json
import os

def main():
    tar_path = "/gen-async"
    print("start gen mx3")
    genmx3(dirpath=tar_path)
    return

def genmx3(dirpath):
    template_path = os.path.join(dirpath, "template.mx0")
    json_path = os.path.join(dirpath, "params.json")
    print(template_path)
    if not os.path.exists(template_path) or not os.path.exists(json_path):
        print("not found templpate.mx0 or json")
        return

    with open(json_path, "r") as file:
        data : dict = json.load(file)
    
    keys = list(data.keys())
    if len(keys) == 0:
        return
    filenum = len(data[keys[0]])
    for i in range(filenum):
        new_mx3 = getTempContent(template_path)
        for key in keys:
            if not isinstance(data[key], list):
                print("Error : jsonには配列しか入りません")
                return
            new_mx3 = new_mx3.replace(f"<<<{key}>>>",str(data[key][i]) )
            new_path = os.path.join(dirpath, f"{convDict2NewName(data, i)}.mx0")
            with open(new_path, 'w') as file:
                file.write(new_mx3)
    return

def getTempContent(temp_path:str):
    with open(temp_path, 'r') as file:
        content = file.read()
    return content

def convDict2NewName(d: dict, id:int):
    name = ''
    for key in list(d.keys()):
        name += f"{key}{d[key][id]}-"
    return name[:-1]

main()