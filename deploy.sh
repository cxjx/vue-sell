#!/usr/bin/env bash

# jenkins路径
JENKINS_PATH="/home/common/jenkins"
# Jenkins变量
LINUX_USER="chenx"

pwd
# /home/common/jenkins/workspace/chenx_vue-sell

# 用户家目录
LINUX_HOME=`su - $LINUX_USER -c 'echo $HOME'`
# vue-sell项目部署路径
WEB_PATH="$LINUX_HOME/nginx/html/vue-sell"

# build vue-sell
npm i && npm run build
RETVAL=$?
if [ $RETVAL = 0 ]; then
  # clean
  rm -rf $WEB_PATH

  # copy
  cp -r dist $WEB_PATH
  chown -R ${LINUX_USER}:turing $WEB_PATH

  # nginx reload
  #$LINUX_HOME/nginx/sbin/nginx -s reload
fi
