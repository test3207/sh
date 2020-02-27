#!/bin/bash

# node开发环境，安装nvm，node(10.16)，常用全局包(pm2,cnpm,yarn)，并设置国内镜像

case "$(uname -s)" in

   Linux)
     curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
     export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     ./source/nvm-setup.exe
     ;;

esac

nvm node_mirror https://npm.taobao.org/mirrors/node/
nvm npm_mirror https://npm.taobao.org/mirrors/npm/

nvm install 10.16
nvm use 10.16

npm config set registry https://registry.npm.taobao.org
npm install -g cnpm yarn pm2
