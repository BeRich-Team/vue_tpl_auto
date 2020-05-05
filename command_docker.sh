

source_dir=$1
build_dir=$2
project_name=$3
branch_name=$4
target_dir=$5
echo "source_dir: $source_dir"
echo "build_dir: $build_dir"
echo "project_name: $project_name"
echo "branch_name: $branch_name"
echo "target_dir: $target_dir"

project_full_name=${project_name}_${branch_name}
docker=which docker

${docker} stop ${project_full_name} || true \
    && ${docker} rm ${project_full_name} || true \
    && cd ${source_dir}  \
    && ${docker} build  -t ${project_full_name}_image  . \
    && ${docker} run -d  -p 8083:80 --name ${project_full_name}_container -v ${source_dir}/${build_dir}:/www/server/nginx/html/ -v ${project_full_name}/nginx.conf:/www/server/nginx/nginx.conf ${project_full_name}_image