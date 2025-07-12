# Use the provided base image
FROM ghcr.io/berriai/litellm:main-stable

# Set the working directory to /app
WORKDIR /app

# Copy the configuration file into the container at /app
COPY config.yaml .

# Make sure your docker/entrypoint.sh is executable
# RUN chmod +x ./docker/entrypoint.sh

# Expose the necessary port
EXPOSE 4000/tcp

# Override the CMD instruction with your desired command and arguments
# For production, remove --detailed_debug as it slows down response times
CMD ["--port", "4000", "--config", "config.yaml", "--detailed_debug"]