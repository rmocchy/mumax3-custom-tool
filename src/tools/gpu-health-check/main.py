# 実行時に仮想環境上にインストールするのでnot resolvedで問題ない
import tensorflow as tf
from tensorflow.python.client import device_lib

def main():
    if (not tf.test.is_gpu_available()):
        print(
            "==========================\n"\
            " GPU is not available ...\n"\
            "==========================\n"
        )
        return
    
    gpus = tf.config.experimental.list_physical_devices('GPU')
    print(
            "==========================\n"\
            " GPU is available !\n"\
            "==========================\n"
        )
    for gpu in gpus:
        print("GPUの読み込みが完了しました")
        print(gpu)
    return

if __name__ == "__main__":
    main()
