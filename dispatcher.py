from os import listdir, makedirs
from os.path import isfile, join
import random
import re

sources = [join(".", "transition", dir) for dir in listdir(join(".", "transition"))]
ratio = 0.9

# Make dirs if necessary
try:
    makedirs(join(".", "data", "train"))
except FileExistsError as E:
    pass
except Exception as E:
    raise E
try:
    makedirs(join(".", "output"))
except FileExistsError as E:
    pass
except Exception as E:
    raise E
try:
    makedirs(join(".", "data", "test"))
except FileExistsError as E:
    pass
except Exception as E:
    raise E

remint = re.compile("(\d+\t)")

for source_folder in sources:
    for filepath in listdir(join(source_folder)):
        print("Converting "+join(source_folder, filepath))
        # Parsing
        sentences = []
        with open(join(source_folder, filepath)) as file:
            for line in file.readlines():
                if line.startswith("1\t"):
                    sentences.append([])
                sentences[-1].append(remint.sub("", line))

        # Randomization
        random.shuffle(sentences)
        limit = int(ratio * len(sentences))
        train, test = sentences[:limit], sentences[limit:]

        # Output
        with open(join(".", "data", "train", filepath), "w") as f:
            f.write("".join(
                [
                    line
                    for sentence in train
                    for line in sentence
                ]
            ))
        with open(join(".", "data", "test", filepath), "w") as f:
            f.write("".join(
                [
                    line
                    for sentence in test
                    for line in sentence
                ]
            ))

with open(join(".", "output", "train.tab"), "w") as f:
    for filepath in listdir(join(".", "data", "train")):
        with open(join(".", "data", "train", filepath)) as inp:
            f.write(inp.read())

with open(join(".", "output", "test.tab"), "w") as f:
    for filepath in listdir(join(".", "data", "test")):
        with open(join(".", "data", "test", filepath)) as inp:
            f.write(inp.read())