# 実行時に仮想環境上にインストールするのでnot resolvedで問題ない
import gpustat

def main():
    stats = gpustat.new_query()
    if len(stats) == 0:
        print(
            "==========================\n"\
            " GPU is not available ...\n"\
            "==========================\n"
        )
        return

    for gpu in stats.gpus:
        print(
            "=======================\n"\
            f"GPU-index   : {gpu.index}\n"\
            f"Utilization : {gpu.utilization} %\n"\
            f"memory usage: {gpu.memory_used}/{gpu.memory_total} MB \n"
            "=======================\n"\
        )
    return

main()