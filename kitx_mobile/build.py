import os
import sys
import json

from pathlib import Path

print("entry args: ", sys.argv)

skipFlutterBuild = False

for arg in sys.argv:
    if arg.lower() == "--skip-flutter-build":
        skipFlutterBuild = True

commands = [
    "flutter pub get",
    "flutter build apk --split-per-abi",
    "flutter build apk",
]

Path(".ci_cd").mkdir(parents=True, exist_ok=True)

if not skipFlutterBuild:
    for command in commands:
        print(">>> " + command)
        print(os.system(command))

path = Path(".ci_cd/")

files = Path("build/app/outputs/flutter-apk/").glob("*")

data = { "publish_list": [], "sha1": []}

# index = 0
for each in files:
    newName = each.name.replace("app", "kitx-mobile")
    # os.rename(path + file, path + newName)
    newFile = each.rename(path / newName)
    if newFile.suffix == ".apk":
        data["publish_list"].append(str(newFile.resolve()))
    elif newFile.suffix == ".sha1":
        data["sha1"].append(f"{newFile.read_text()} {newFile.stem}")
    print(each.name + " -> " + newFile.name)
    # index += 1


print(data)

json.dump(data, open("data.json", "w", encoding="utf-8"))
