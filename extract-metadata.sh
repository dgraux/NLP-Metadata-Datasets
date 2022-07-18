#!/bin/bash

for i in $(ls datasets/datasets); do
    languages=$(cat datasets/datasets/$i/README.md | tr -d \'\" | xargs | awk -F "---" '{print $2}' | sed 's/ - /,/g' | sed 's/:,/:/g' | tr ' ' '\n' | grep "language:" | awk -F ":" '{print $2}')
    givenLicense=$(cat datasets/datasets/$i/README.md | tr -d \'\" | xargs | awk -F "---" '{print $2}' | sed 's/ - /,/g' | sed 's/:,/:/g' | tr ' ' '\n' | grep "license:" | awk -F ":" '{print $2}')
    taskCategories=$(cat datasets/datasets/$i/README.md | tr -d \'\" | xargs | awk -F "---" '{print $2}' | sed 's/ - /,/g' | sed 's/:,/:/g' | tr ' ' '\n' | grep "task_categories:" | awk -F ":" '{print $2}')
    taskIds=$(cat datasets/datasets/$i/README.md | tr -d \'\" | xargs | awk -F "---" '{print $2}' | sed 's/ - /,/g' | sed 's/:,/:/g' | tr ' ' '\n' | grep "task_ids:" | awk -F ":" '{print $2}')
    cat datasets/datasets/$i/dataset_infos.json | \
	jq -c \
	   --arg id "$i" \
	   --arg lang "$languages" \
	   --arg givenL "$givenLicense" \
	   --arg taskC "$taskCategories" \
	   --arg taskI "$taskIds" \
	   'first({id: $id, data:{description: .[].description,url: .[].homepage, license: .[].license, givenLicense: $givenL, language: $lang | split(","), categories: $taskC | split(","), tasks: $taskI | split(",")}})' ;
    #sleep 3 ;
done

exit 0
