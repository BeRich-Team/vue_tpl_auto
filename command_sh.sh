
source_dir=$1
project_name=$2
branch_name=$3
target_dir=$4
echo "source_dir: $source_dir"
echo "project_name: $project_name"
echo "branch_name: $branch_name"
echo "target_dir: $target_dir"

cd $target_dir
pwd

if [ ! -d $project_name ]; then
    mkdir $project_name
    cd $project_name
    if [ ! -d $branch_name ]; then
        mkdir $branch_name
        cp -r $source_dir/* $target_dir/$project_name/$branch_name
    else
        cp -r $source_dir/* $target_dir/$project_name/$branch_name
    fi


else 
    cd $project_name
    if [ ! -d $branch_name ]; then
        mkdir $branch_name
        cp -r $source_dir/* $target_dir/$project_name/$branch_name
    else
        cp -r $source_dir/* $target_dir/$project_name/$branch_name
    fi
fi