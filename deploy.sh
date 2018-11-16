#!/usr/bin/env bash

# 用户
LINUX_USER="chenx"
# 用户家目录
LINUX_HOME="/home/$LINUX_USER"
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

  # reload
  #$LINUX_HOME/nginx/sbin/nginx -s reload
fi
