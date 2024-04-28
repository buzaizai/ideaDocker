# 使用 Debian 最新镜像作为基础镜像
FROM debian:latest

# 设置环境变量，可选，根据需要调整
ENV DEBIAN_FRONTEND=noninteractive

# 替换软件源为中科大 Debian 源
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list

# 更新系统包列表并升级系统
RUN apt-get update && apt-get upgrade -y

# 安装必备软件包，包括Nginx
RUN apt-get install -y \
    python3 \
    python3-pip \
    python3-cryptography \
    python3-netifaces \
    less \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libfreetype6 \
    libxi6 \
    curl \
    git \
    nginx

# 更新pip至最新版本
RUN python3 -m pip install --upgrade pip

# 安装 projector-installer
RUN pip3 install projector-installer

# 复制Nginx配置文件到容器
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 将启动脚本复制到容器中
COPY start_projector.sh /start_projector.sh

# 确保脚本具有执行权限
RUN chmod +x /start_projector.sh

# 修正：由于之前设置了CMD来运行start_projector.sh，此处不再需要默认的bash启动命令
# CMD ["/bin/bash"]

# 设置容器启动时执行的命令，包括启动Nginx和执行start_projector.sh
CMD ["sh", "-c", "nginx -g 'daemon off;'"]
