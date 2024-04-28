# 这是一个构建运行于Docker的Idea Web项目

以下给出大致步骤

```bash
git clone 
cd idea-web
docker build  -t idea-web .
docker  run -d -it -p 8880:81 -p 2222:22 --name idea-web idea-web
docker  -it idea-web /bin/bash
```

