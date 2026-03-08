# DevOPS Journey 🚀

A comprehensive collection of DevOps tasks and hands-on projects documenting my learning journey through containerization, infrastructure, and DevOps best practices.

## Overview

This repository contains practical DevOps projects following the [roadmap.sh](https://roadmap.sh) learning path. Each project is designed to build real-world skills in Docker, shell scripting, server management, and infrastructure automation.

## Prerequisites

Before getting started, make sure you have the following installed:

- **Git** - Version control system
- **Docker** - Containerization platform
- **Bash** - Shell scripting environment
- **Basic Linux/Unix knowledge** - Command line proficiency

## Repository Structure

```
DevOPS-journey/
├── README.md                          # This file
├── roadmap.sh-devops/
│   ├── basic_dockerfile/              # Docker fundamentals
│   │   ├── Dockerfile                 # Basic Alpine Linux container
│   │   └── README.md                  # Project documentation
│   ├── Server-Performance-Stats/      # Shell scripting project
│   │   ├── README.md                  # Project documentation
│   │   └── server-stats.sh            # Performance monitoring script
│   └── static-site/                   # AWS & Nginx deployment project
│       ├── README.md                  # Project documentation
│       ├── index.html                 # Landing page
│       ├── style.css                  # Site styling
│       ├── logo.png                   # Site assets
│       ├── example-rsync.sh           # Deployment script template
│       ├── rsync.sh                   # Deployment script (personalized)
│       └── your-key.pem     # AWS private key
```

## Projects

### 1. Basic Dockerfile
**Status:** ✅ Complete

A foundational Docker project that demonstrates containerization basics using Alpine Linux.

- **Skills:** Docker fundamentals, image building, container execution
- **Technology:** Docker, Alpine Linux
- **Repository:** [basic_dockerfile/](roadmap.sh-devops/basic_dockerfile/)
- **Project URL:** https://roadmap.sh/projects/basic-dockerfile

**Quick Start:**
```bash
cd roadmap.sh-devops/basic_dockerfile
docker build -t hello-captain:latest .
docker run hello-captain:latest
```

📖 [View Full Documentation](roadmap.sh-devops/basic_dockerfile/README.md)

### 2. Server Performance Stats
**Status:** ✅ Complete

A shell script that monitors and displays real-time server performance statistics including CPU, memory, disk usage, and network stats.

- **Skills:** Bash scripting, system monitoring, performance analysis
- **Technology:** Bash, Linux utilities
- **Repository:** [Server-Performance-Stats/](roadmap.sh-devops/Server-Performance-Stats/)
- **Project URL:** https://roadmap.sh/projects/server-stats

**Quick Start:**
```bash
cd roadmap.sh-devops/Server-Performance-Stats
bash server-stats.sh
```

📖 [View Full Documentation](roadmap.sh-devops/Server-Performance-Stats/README.md)

### 3. Static Site Deployment with Nginx and Rsync
**Status:** ✅ Complete

A comprehensive AWS EC2 project that demonstrates cloud infrastructure setup, web server configuration, and automated deployment. Deploy a static website to AWS using Nginx and rsync.

- **Skills:** AWS EC2 management, Nginx configuration, Infrastructure automation, Rsync deployment, SSH access, Security groups
- **Technology:** AWS EC2, Nginx, Rsync, Bash, HTML5, CSS3
- **Repository:** [static-site/](roadmap.sh-devops/static-site/)
- **Project URL:** https://roadmap.sh/projects/static-site-server

**Quick Start:**
```bash
cd roadmap.sh-devops/static-site
cp example-rsync.sh rsync.sh
# Edit rsync.sh with your EC2 IP address
chmod +x rsync.sh
./rsync.sh
```

📖 [View Full Documentation](roadmap.sh-devops/static-site/README.md)

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/ahmad-porto/DevOPS-journey.git
cd DevOPS-journey
```

### Navigate to a Project

Each project has its own README with specific instructions:

```bash
# For Docker project
cd roadmap.sh-devops/basic_dockerfile

# For Shell scripting project
cd roadmap.sh-devops/Server-Performance-Stats
```

## Learning Path

This repository follows the [roadmap.sh DevOps Roadmap](https://roadmap.sh/devops), covering:

- ✅ Containerization & Docker
- ✅ Shell Scripting & Automation
- ✅ Cloud Infrastructure & AWS
- ⏳ Kubernetes (Coming Soon)
- ⏳ CI/CD Pipelines (Coming Soon)
- ⏳ Infrastructure as Code (Coming Soon)
- ⏳ Monitoring & Logging (Coming Soon)

## Project Contributions

All projects are developed and tested across multiple platforms:
- Windows
- Ubuntu/Linux

## Resources

- [roadmap.sh DevOps Path](https://roadmap.sh/devops)
- [Docker Documentation](https://docs.docker.com/)
- [Linux Foundation](https://www.linuxfoundation.org/)
- [Bash Scripting Guide](https://www.gnu.org/software/bash/manual/)

## How to Use This Repository

1. **Clone** the repository to your local machine
2. **Navigate** to the project folder you're interested in
3. **Read** the project-specific README.md
4. **Follow** the setup and run instructions
5. **Experiment** and modify the code to learn

## License

This project is open for educational purposes.

## Contact & Support

For questions or suggestions, feel free to open an issue or reach out.

---

**Happy Learning!** 🎓
