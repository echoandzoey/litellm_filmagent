# LiteLLM FilmAgent 部署指南

基于官方 LiteLLM 最佳实践的部署方案，支持多种 LLM 模型的统一 API 接口。

## 🚀 快速开始

### 1. 配置环境变量

```bash
# 复制环境变量模板
cp env.example .env

# 编辑 .env 文件，添加你的 API 密钥
nano .env
```

### 2. 配置模型

编辑 `config.yaml` 文件，配置你需要的 LLM 模型：

```yaml
model_list:
  - model_name: gpt-3.5-turbo
    litellm_params:
      model: gpt-3.5-turbo
      api_key: os.environ/OPENAI_API_KEY
```

### 3. 启动服务

```bash
# 构建并启动服务
docker-compose up -d

# 查看日志
docker-compose logs -f litellm
```

### 4. 测试 API

```bash
# 健康检查
curl http://localhost:4000/health

# 测试聊天完成
curl -X POST http://localhost:4000/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer sk-1234" \
  -d '{
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

## 📁 项目结构

```
.
├── Dockerfile              # Docker 构建文件
├── docker-compose.yml      # Docker Compose 配置
├── config.yaml            # LiteLLM 配置文件
├── env.example            # 环境变量模板
├── README.md              # 使用说明
└── .env                   # 环境变量文件（需要自己创建）
```

## 🔧 配置说明

### 环境变量

- `LITELLM_MASTER_KEY`: 主密钥，用于访问 API
- `LITELLM_SALT_KEY`: 盐密钥，用于加密/解密 API 密钥
- `OPENAI_API_KEY`: OpenAI API 密钥

### 支持的模型

- OpenAI: `gpt-3.5-turbo`, `gpt-4`, `gpt-4o`
- Anthropic: `claude-3-sonnet`, `claude-3-haiku`
- Azure OpenAI: `azure/<deployment-name>`
- 更多模型请参考 [LiteLLM 文档](https://docs.litellm.ai/docs/)

## 🔒 安全建议

1. 更改默认的 `LITELLM_MASTER_KEY`
2. 使用强密码生成器生成 `LITELLM_SALT_KEY`
3. 不要将 `.env` 文件提交到版本控制
4. 在生产环境中移除 `--detailed_debug` 参数

## 📊 监控和日志

```bash
# 查看服务状态
docker-compose ps

# 查看日志
docker-compose logs litellm

# 重启服务
docker-compose restart litellm
```

## 🚀 部署到生产环境

### Dokploy 部署

1. 将项目推送到 GitHub
2. 在 Dokploy 中创建新应用
3. 配置环境变量
4. 选择 Docker Compose 部署方式
5. 设置域名和 SSL

### 手动部署

```bash
# 构建镜像
docker build -t litellm-filmagent .

# 运行容器
docker run -d \
  --name litellm-filmagent \
  -p 4000:4000 \
  --env-file .env \
  litellm-filmagent
```

## 📚 相关资源

- [LiteLLM 官方文档](https://docs.litellm.ai/)
- [支持的模型列表](https://docs.litellm.ai/docs/providers)
- [API 参考](https://docs.litellm.ai/docs/proxy/api_reference)

## 🎯 下一步

- 配置负载均衡和故障转移
- 添加数据库支持以启用用户管理
- 集成监控和日志系统
- 设置 API 速率限制
