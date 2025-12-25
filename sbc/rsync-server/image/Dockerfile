FROM alpine:latest

# Install dependencies
RUN apk add --no-cache rsync tzdata shadow

# Create a generic user/group named 'appuser', can be overwritten
RUN addgroup -g 1000 appgroup && \
    adduser -u 1000 -G appgroup -D appuser

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the standard Rsync port
EXPOSE 873

# Set the Entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# The default command (can be overridden by the user)
CMD ["rsync", "--daemon", "--no-detach", "--config=/etc/rsyncd.conf"]
