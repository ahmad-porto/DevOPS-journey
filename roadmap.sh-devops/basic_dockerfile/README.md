# Basic Dockerfile Project

A simple Docker project demonstrating the basics of containerization using Alpine Linux.

## Project Description

This project contains a basic Dockerfile that uses Alpine Linux as the base image and runs a simple echo command. It's a great starting point for learning Docker fundamentals.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Git** - Version control system
- **Docker** - Container platform (version 20.10 or higher)

### Installing Docker

If you don't have Docker installed, follow the official installation guide:
- [Docker Installation Guide](https://docs.docker.com/get-docker/)

Verify Docker installation:
```bash
docker --version
```

## Getting Started

### 1. Clone the Repository

Clone the DevOPS-journey repository to your local machine:

```bash
git clone https://github.com/ahmad-porto/DevOPS-journey.git
cd DevOPS-journey/roadmap.sh-devops/basic_dockerfile
```

If you haven't set up SSH keys, you can also clone using HTTPS:

```bash
git clone https://github.com/ahmad-porto/DevOPS-journey.git
```

### 2. Build the Docker Image

Navigate to the project directory and build the Docker image:

```bash
docker build -t hello-captain:latest .
```

**Note:** You can use any name you prefer instead of `hello-captain`. For example: `docker build -t my-image:latest .`

**Explanation:**
- `docker build` - Command to build a Docker image
- `-t hello-captain:latest` - Tags the image with the name `hello-captain` and version `latest`
- `.` - Builds from the Dockerfile in the current directory

You can verify the image was created:

```bash
docker images | grep hello-captain
```

### 3. Run the Container

Run the Docker container using the image you just built:

```bash
docker run hello-captain:latest
```

**Expected Output:**
```
Hello, Captain!
```

## Additional Commands

### View Running Containers

```bash
docker ps -a
```

### Remove the Image

```bash
docker rmi hello-captain:latest
```

### View Image Details

```bash
docker inspect hello-captain:latest
```

### Run Container in Interactive Mode

```bash
docker run -it hello-captain:latest /bin/sh
```

## Troubleshooting

**Problem:** `docker: command not found`
- **Solution:** Ensure Docker is installed and added to your PATH. Restart your terminal after installation.

**Problem:** `docker build` fails with permission denied
- **Solution:** Run Docker commands with `sudo` or add your user to the docker group:
  ```bash
  sudo usermod -aG docker $USER
  ```

**Problem:** Image not found when running container
- **Solution:** Ensure the image was built successfully by checking `docker images`

## Learning Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Alpine Linux Documentation](https://wiki.alpinelinux.org/)

## Next Steps

Once you're comfortable with this basic project, explore:
- Multi-stage builds
- Running web services in containers
- Using Docker Compose for multiple containers
- Publishing images to Docker Hub

## License

This project is part of the DevOPS-journey repository.
