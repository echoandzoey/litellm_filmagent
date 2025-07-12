FROM ghcr.io/berriai/litellm:main-latest

WORKDIR /app

# 暴露端口
EXPOSE 4000

# 启动命令，添加配置文件支持
CMD ["--port", "4000", "--config", "/app/config.yaml"]