#基于的基础镜像
FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu20.04
#FROM nvida/cuda:11.3.0-cudnn8-devel-ubuntu20.04
#代码添加到镜像
ADD . /usr

RUN mkdir -p /home/blue/result
RUN mkdir /order

WORKDIR /usr
#设置环境变量以避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

#安装系统级依赖
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    apt-get install -y libgl1-mesa-glx libglib2.0-0 lftp

#安装 Python 包
RUN pip3 install --upgrade pip
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ -r requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 27301 27302 27303 27304 27305 \
       27306 27307 27308 27309 27310 \
       27311 27312 27313 27314 27315 \
       27316 27317 27318 27319 27320

COPY detect.sh /order/detect.sh
COPY run.sh /order/run.sh

RUN chmod +x /order/run.sh
RUN chmod +x /order/detect.sh