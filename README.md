# 这是一个构建运行于Docker的Idea Web项目

## 手动制作

以下给出大致步骤

```bash
git clone 
cd idea-web
docker build  -t idea-web .
docker  run -d -it -p 8880:81 -p 2222:22 --name idea-web idea-web
docker  -it idea-web /bin/bash
```

## docker hub推送

```bash
docker pull kunkun1/idea-web
docker  run -d -it -p 8880:81 -p 2222:22 --name idea-web kunkun1/idea-web
docker  -it idea-web /bin/bash
```

