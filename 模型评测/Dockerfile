#基础镜像
FROM nvidia/cuda:11.0.3-cudnn8-devel-ubuntu20.04

#代码添加到镜像
ADD . /usr
RUN mkdir -p /order && \
    mv /usr/detect.sh /order/detect.sh
WORKDIR /usr

#设置环境变量以避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

#安装系统级依赖
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    apt-get install -y libgl1-mesa-glx && \
    apt-get install -y libglib2.0-0

#创建 Python3 到 python 的软链接
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
#安装 Python 包
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

RUN chmod +x /order/detect.sh