target_dir=$4
echo "source_dir: $source_dir"
echo "project_name: $project_name"
echo "branch_name: $branch_name"
echo "target_dir: $target_dir"

cd $target_dir
pwd

/usr/local/bin/docker stop react_admin_test_app || true \
 && /usr/local/bin/docker rm react_admin_test_app || true \
 && cd /Users/lk-mbp/Documents/docker/jenkins_home/workspace/react_admin_test  \
 && /usr/local/bin/docker build  -t react_admin_test_app  . \
 && /usr/local/bin/docker run -d  -p 8083:80 --name react_admin_test_app -v /Users/lk-mbp/Documents/docker/jenkins_home/workspace/react_admin_test_app/build:/usr/local/var/www/ -v /Users/lk-mbp/Documents/docker/jenkins_home/workspace/react_admin_test_app/nginx.conf:/usr/local/etc/nginx/nginx.conf react_admin_test_app