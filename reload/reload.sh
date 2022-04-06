#!/bin/bash

OLD_PID=$(cat "$1")
/bin/kill -HUP "$OLD_PID"
sleep 10
# 检查是否启动成功
NEW_PID=$(cat "$1")

# 旧进程退出, 新进程启动
ps --pid "$OLD_PID" &>/dev/null
OLD_EXIST=$?
ps --pid "$NEW_PID" &>/dev/null
NEW_EXIST=$?

if [ $OLD_EXIST -eq 1 ] && [ $NEW_EXIST -eq 0 ]; then
  exit 0
else
  exit -1
fi
