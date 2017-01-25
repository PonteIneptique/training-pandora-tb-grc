from os import listdir, makedirs
from os.path import isfile, join
import random

sources = ["perseus-tb"]
ratio = 0.9

# Make dirs if necessary
try:
	makedirs(join(".", "data", "train"))
except Exception as E:
	print(E)
try:
	makedirs(join(".", "data", "test"))
except Exception as E:
	print(E)

for source_folder in sources:
	for filepath in listdir(join(source_folder)):
		# Parsing
		sentences = []
		with open(join(source_folder, filepath)) as file:
			for line in file.readlines():
				if line.startswith("1\t"):
					sentences.append([])
				sentences[-1].append(line)

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