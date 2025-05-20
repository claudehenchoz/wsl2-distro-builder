FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    cron \
    curl \
    python3 \
    python3-pip \
    git \
    ansible \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy entrypoint and setup scripts
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY setup-ansible.sh /usr/local/bin/setup-ansible.sh

# Copy rootfs files
COPY rootfs/ /

# Make wsl-setup and 00-wsl-notice.sh executable
RUN chmod +x /usr/local/bin/wsl-setup
RUN chmod +x /etc/profile.d/00-wsl-notice.sh

# Make scripts executable
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/setup-ansible.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]