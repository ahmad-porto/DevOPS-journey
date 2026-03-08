# Static Site Deployment with Nginx and Rsync

This project demonstrates the basics of setting up a remote web server on AWS EC2, configuring Nginx to serve a static website, and automating the deployment process using rsync. It's a practical introduction to cloud infrastructure, web servers, and CI/CD automation.

## 🚀 Features

- **Cloud Infrastructure** - Hosted on AWS EC2 (Amazon Linux 2023) for reliable, scalable hosting
- **Web Server** - Configured with Nginx for high-performance static file serving
- **Automated Deployment** - Custom bash script handles syncing local changes to production server
- **Responsive Design** - Clean HTML5/CSS3 landing page
- **Security-First** - Sensitive files excluded from version control and deployment

## 🛠️ Technology Stack

| Technology | Purpose |
|-----------|---------|
| **AWS EC2** | Cloud computing platform ☁️ |
| **Nginx** | Web server for static content 🌐 |
| **Rsync** | File synchronization over SSH 🔐 |
| **HTML5 & CSS3** | Frontend markup and styling 🎨 |
| **Bash** | Deployment automation script |

## 📂 Project Structure

```
static-site/
├── README.md              # This documentation
├── index.html             # Main landing page
├── style.css              # Site styling and layout
├── logo.png               # Site assets
├── example-rsync.sh       # Template for deployment script
├── rsync.sh               # Deployment automation script (created from example)
├── .gitignore             # Git ignore rules (protects .pem files)
└── your-key.pem           # Private key (⚠️ NEVER commit to public repo)
```

## ⚙️ Setup and Installation

### Prerequisites

Before you begin, ensure you have:

- **AWS Account** with EC2 access
- **Private key (.pem file)** for EC2 instance authentication
- **SSH access** to your EC2 instance
- **Bash shell** on your local machine
- **Rsync** installed (`rsync --version` to verify)

### 0. AWS Setup (Already Completed)

The following steps have been completed for this project:

#### 1. Instance Provisioning

- **Selected AMI:** Amazon Linux 2023 as the operating system
- **Instance Type:** Free Tier eligible (t3.micro) to host the site
- **Key Pair Generation:** Created and downloaded `your-key.pem` for secure SSH access

#### 2. Network & Security Configuration

- **Security Group Creation:** Defined firewall rules to control inbound traffic
  - **Port 22 (SSH):** Opened to allow remote terminal access from your local machine
  - **Port 80 (HTTP):** Opened to allow public web browsers to access the Nginx web server

#### 3. Server Access & Preparation

- **Local Permissions:** Set secure permissions on the private key:
  ```bash
  chmod 400 your-key.pem
  ```
  ⚠️ This is a requirement for SSH clients - the key must not be readable by others

- **Remote Connection:** Established connection using:
  ```bash
  ssh -i "your-key.pem" ec2-user@<public-ip>
  ```

- **System Updates:** Ensured the server had latest security patches:
  ```bash
  sudo dnf update -y
  ```

### 1. Server Preparation

#### Launch an EC2 Instance

1. Create an EC2 instance with **Amazon Linux 2023**
2. Open required ports in Security Group:
   - **Port 22** (SSH) - for remote access
   - **Port 80** (HTTP) - for web traffic

#### Install and Configure Nginx

SSH into your EC2 instance and run:

```bash
# Install Nginx
sudo dnf install nginx -y

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Verify Nginx is running
systemctl status nginx
```

#### Set Directory Permissions

Allow the `ec2-user` to manage web files:

```bash
# Change ownership of Nginx html directory
sudo chown -R ec2-user:ec2-user /usr/share/nginx/html

# Set proper permissions
sudo chmod -R 755 /usr/share/nginx/html
```

### 2. Local Setup

#### Clone the Repository

```bash
cd ~/Desktop/githubs/DevOPS-journey
cd roadmap.sh-devops/static-site
```

#### Create Deployment Script

Copy the example rsync script and update it with your details:

```bash
# Copy the example script to create your deployment script
cp example-rsync.sh rsync.sh
```

Edit `rsync.sh` and replace the EC2 IP address with your instance's public IP:

```bash
# Before:
rsync -avz --delete --exclude 'your-key.pem' --exclude 'rsync.sh' \
  -e "ssh -i your-key.pem" . ec2-user@100.55.92.214:/usr/share/nginx/html

# After: Replace 100.55.92.214 with YOUR_EC2_IP
rsync -avz --delete --exclude 'your-key.pem' --exclude 'rsync.sh' \
  -e "ssh -i your-key.pem" . ec2-user@YOUR_EC2_IP:/usr/share/nginx/html
```

Make the script executable:

```bash
chmod +x rsync.sh
```

**Note:** The `rsync.sh` file is different from `example-rsync.sh` because it contains your specific EC2 IP address. This is why it should not be committed to version control (it's in `.gitignore`).

### 3. Deploy Your Site

Run the deployment script:

```bash
./rsync.sh
```

**What the script does:**
- `-avz` - Archive mode (preserves permissions), verbose output, compression
- `--delete` - Removes files on server that don't exist locally
- `--exclude` - Ignores sensitive files (.pem, .sh scripts)
- `-e "ssh -i your-key.pem"` - Uses SSH with your private key for authentication

**Expected output:**
```
sending incremental file list
index.html
style.css
logo.png
sent 5,234 bytes  received 456 bytes  total size 1,234  speedup 2.15
```

### 4. Verify Deployment

Visit your website in a browser:

```
http://YOUR_EC2_IP
```

You should see: **"Success! My Nginx Server is Live 🚀"**

## 📝 File Descriptions

### `index.html`
Main landing page with simple HTML structure. Contains:
- Page title and styling link
- Success message
- Logo image

### `style.css`
Stylesheet for the website. Define your page layout, colors, typography, and responsive design here.

### `logo.png`
Logo or image asset displayed on the page.

### `example-rsync.sh`
Template/example deployment script. This file contains the generic rsync command structure. Use this as a reference when creating your own `rsync.sh` script with your specific EC2 IP address. This file is safe to commit to the repository since it has a placeholder IP.

### `rsync.sh`
Bash script that automates deployment to your specific EC2 instance. Created by copying and customizing `example-rsync.sh` with your actual EC2 IP. Syncs files from local machine to EC2 server using rsync over SSH. **Important:** Never commit this file to a public repository (already in .gitignore because it contains your specific server details).

### `.gitignore`
Protects sensitive files from being committed to Git:
- `*.pem` - Private key files (your AWS credentials)
- `rsync.sh` - Deployment script with your specific EC2 IP address (use `example-rsync.sh` as the shareable template)

## 🔄 Deployment Workflow

```
Edit files locally → Run ./rsync.sh → Files sync to server → Website updates
```

## 📚 Common Issues & Troubleshooting

### ❌ "Permission denied (publickey)"
**Problem:** SSH key permissions or connection issues

**Solution:**
```bash
# Fix key permissions
chmod 600 your-key.pem

# Test SSH connection
ssh -i your-key.pem ec2-user@YOUR_EC2_IP

# Verify key ownership
ls -l your-key.pem
```

### ❌ "rsync: command not found"
**Problem:** Rsync not installed on your system

**Solution:**
```bash
# Ubuntu/Debian
sudo apt-get install rsync

# macOS
brew install rsync

# RedHat/CentOS
sudo yum install rsync
```

### ❌ Connection timeout on rsync
**Problem:** Security group or network rules blocking traffic

**Solution:**
1. Check EC2 Security Group - Port 22 must be open
2. Verify EC2 instance is running
3. Confirm correct public IP address in rsync.sh

### ❌ Files not updating on server
**Problem:** Rsync script issues or file permissions

**Solution:**
```bash
# Check server directory ownership
ssh -i your-key.pem ec2-user@YOUR_EC2_IP 'ls -la /usr/share/nginx/html'

# Manually test rsync with verbose output
rsync -avvz --dry-run -e "ssh -i your-key.pem" . ec2-user@YOUR_EC2_IP:/usr/share/nginx/html
```

## 📈 Lessons Learned

- ✅ Configuring AWS Security Groups for inbound/outbound traffic
- ✅ Managing Linux file permissions (`chmod`, `chown`)
- ✅ SSH key management and authentication
- ✅ Nginx configuration and web server basics
- ✅ Automation with bash scripting
- ✅ Troubleshooting rsync connection and file synchronization issues
- ✅ Version control best practices with sensitive files

## 🛡️ Security Considerations

⚠️ **IMPORTANT - DO NOT COMMIT YOUR .PEM FILE TO GITHUB!**

If you push this folder to a public GitHub repository, anyone can view your private key and gain unauthorized access to your AWS instance.

**What we did to prevent this:**

1. **`.gitignore` file** - Already configured to exclude:
   ```
   *.pem
   rsync.sh
   ```

2. **Verify before committing:**
   ```bash
   # Check what will be committed
   git status
   
   # Make sure .pem files don't appear
   ```

3. **If accidentally committed:**
   ```bash
   # Remove from history (⚠️ Advanced)
   git rm --cached *.pem
   git commit -m "Remove sensitive files"
   ```

## 🚀 Next Steps

To enhance this project:

- Add CSS frameworks (Bootstrap, Tailwind) for better styling
- Implement SSL/TLS certificate with Let's Encrypt
- Add multiple pages and navigation
- Set up automated deployments with GitHub Actions
- Monitor site performance with CloudWatch
- Use CloudFront CDN for global distribution

## 📚 Resources

- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [Nginx Official Guide](https://nginx.org/)
- [Rsync Manual](https://linux.die.net/man/1/rsync)
- [SSH Best Practices](https://www.ssh.com/ssh/best-practices/)
- [DevOps Roadmap](https://roadmap.sh/devops)

## 📖 Further Reading

- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [Infrastructure as Code Best Practices](https://www.terraform.io/)
- [Continuous Deployment Strategies](https://www.atlassian.com/continuous-delivery/continuous-deployment)

---

**Happy deploying!** 🎉 If you encounter issues or have improvements, feel free to contribute or open an issue.
