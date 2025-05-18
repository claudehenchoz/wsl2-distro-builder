# WSL2 Distro Builder

This project provides a framework for building a customizable WSL2 distribution based on Ubuntu using Podman and Docker. The built image can be exported as a tar file for easy import into WSL2 environments. The distribution is configured using Ansible, which enforces the desired state of the system on a daily schedule.

## Project Structure

```
wsl2-distro-builder
├── docker
│   ├── Dockerfile          # Instructions to build the Docker image
│   ├── entrypoint.sh       # Entry point script for the Docker container
│   └── setup-ansible.sh    # Script to install and configure Ansible
├── ansible
│   ├── inventory           # Ansible inventory file
│   ├── ansible.cfg         # Ansible configuration file
│   └── playbooks
│       ├── base.yml        # Base configuration playbook
│       └── scheduled-tasks.yml # Playbook for scheduled tasks
├── scripts
│   ├── build.sh            # Script to build the Docker image
│   ├── export-tar.sh       # Script to export the WSL2 distro as a tar file
│   └── setup-cron.sh       # Script to set up a cron job for Ansible pull
├── config
│   ├── wsl.conf            # WSL2 configuration file
│   └── ansible-pull-config.yml # Configuration for Ansible pull
├── .github
│   └── workflows
│       └── build-and-release.yml # CI/CD workflow for building and releasing
├── .gitignore              # Git ignore file
└── README.md               # Project documentation
```

## Getting Started

### Prerequisites

- Docker or Podman installed on your machine.
- Basic knowledge of Ansible and WSL2.

### Building the WSL2 Distro

1. Clone the repository:
   ```
   git clone <repository-url>
   cd wsl2-distro-builder
   ```

2. Build the Docker image:
   ```
   ./scripts/build.sh
   ```

3. Export the image as a tar file:
   ```
   ./scripts/export-tar.sh
   ```

### Importing into WSL2

To import the tar file into WSL2, use the following command:
```
wsl --import <DistroName> <InstallLocation> <TarFilePath>
```

### Configuration Management with Ansible

The WSL2 distro uses Ansible to manage configurations. The `setup-cron.sh` script sets up a cron job that runs `ansible pull` daily to ensure the system remains in the desired state.

### Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

### License

This project is licensed under the MIT License. See the LICENSE file for more details.