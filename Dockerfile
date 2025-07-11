FROM ghcr.io/berriai/litellm:main-latest

WORKDIR /app

EXPOSE 4000

CMD ["--port", "4000"]