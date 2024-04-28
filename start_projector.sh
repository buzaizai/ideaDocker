#!/bin/bash

# 确保 projector-installer 已安装，尽管我们在 Dockerfile 中已经安装，这里做个确认
pip3 install --quiet projector-installer || true

# 安装 IntelliJ IDEA Ultimate
projector install Idea_Ultimate

# 等待一段时间确保安装完成，这里等待30秒作为示例
sleep 1


# 启动 IntelliJ
projector run IntelliJ
