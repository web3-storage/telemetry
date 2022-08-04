FROM grafana/agent:v0.26.1

# Set environment variables
ARG PROMETHEUS_PUSH_USERNAME
ARG PROMETHEUS_PUSH_PASSWORD

# Expose the port for access
EXPOSE 8000/tcp

# Copy configuration file
COPY ./grafana_agent/config.yaml /etc/agent/agent.yaml

# Provide configuration file and set environment variables from container env
CMD ["--config.file=/etc/agent/agent.yaml", "--server.http.address=0.0.0.0:8000", "--config.expand-env"]
