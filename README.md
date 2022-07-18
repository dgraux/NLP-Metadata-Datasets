Metadata of NLP datasets (using HuggingFace repository)
=======================================================

> Extracting metadata from huggingface's dataset list to build a recommender

How to use these resources?
---------------------------

__Warning__: You need _jq_ to run this. See their [Install Page](https://stedolan.github.io/jq/download/).

```
git clone "https://github.com/huggingface/datasets.git"
bash extract-metadata.sh > metadata.json
```


Repository files
----------------

This repository contains:

- `README.md` (this file): providing documentation;
- `extract-medata.sh`: the _bash_ script extracting info from the huggingface dataset lists;
- `metadata-archive.json`: an already extracted version of the file containing the metadata;
- `LICENSE`.


Authors
-------

Damien Graux <https://dgraux.github.io/>  
Anaïs Ollagnier <https://aollagnier.github.io/>  
Inria, France  
2022
