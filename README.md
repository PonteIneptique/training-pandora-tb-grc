training-pandora-tb
====================

**Warning** Ubuntu only oriented documentation.

This repository contains necessary scripts to convert Perseids/Perseus treebank resources in order to train Pandora with it

# Required installs

```shell
sudo apt-get install python3 libsaxonhe-java
```

# Folders

- **input** contains directory in which we keep licence. Each subfolder of inputs has a texts folder in which we find treebank
- **transition** contains simple transformation of treebank to tab formats
- **output** contains split data set for pandora (merged indifferently of source)
- **data** contains split data set for pandora (keeping the names)
- **perseids-proxies** contains cloned repositories of Perseids Proxy generated resources

# Order of build

```shell
make transform-xml
make split
make data
```