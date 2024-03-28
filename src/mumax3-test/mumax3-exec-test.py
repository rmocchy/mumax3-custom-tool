import sys

print(
    "==============================\n"\
    "mumax3-exec-test has called !"\
    "==============================\n"
      )

args = sys.argv
msg = " ".join(args)

print(
    "received command :\n"\
    f"   {msg}"
    )