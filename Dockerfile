FROM ghcr.io/berriai/litellm:main-latest

WORKDIR /app

# 暴露端口
EXPOSE 4000

# 启动命令，使用默认配置
CMD ["--port", "4000"]