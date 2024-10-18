# Docker使用说明

本项目旨在方便电力巡检的同学们快速上手使用 ***docker***，不会过多介绍*docker*的原理

## Dockerfile注意事项

1. 请提前将基础镜像下载到本地，以免构建镜像时受网络环境影响
2. 如果想直接 shell 脚本中使用 `python` 执行命令，请创建 `python3` 到 `python` 的软连接
3. 使用pip安装python包时，请使用 `-i`指定国内镜像源

## 构建镜像

在目标文件夹下执行此命令：
```bash
docker build --pull = false -t $IMAGE:$TAG .
```

pull=false 可以从本地拉取基础镜像
\$IMAGE:$TAG 是镜像名和标签，例如 *test:v1*
. 是将该目录下的所有文件复制到镜像中

## 清理缓存

在删除镜像时，往往会发现内存并没有释放与镜像大小相同的空间，这个时候就需要清理缓存

- 清除所有未被使用的缓存镜像：
```bash
docker image prune
```

- 清除所有未被使用的缓存容器、网络和数据卷：
```bash
docker system prune  
```