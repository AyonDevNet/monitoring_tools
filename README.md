# 🛠️ Linux Monitoring Tool (Shell Script Based)
📋 Overview
This repository is built to provide a lightweight, efficient system monitoring tool using Shell Scripts, designed exclusively for Linux OS or Linux-based servers.

It allows system administrators and DevOps professionals to monitor essential system metrics in real time or on a scheduled basis — without relying on bulky third-party tools.

⚙️ Features
✅ CPU Usage Monitoring

✅ Memory (RAM) Usage Monitoring

✅ Disk Usage and Inode Monitoring

✅ Network Traffic Analysis

✅ Logged-in Users & Uptime Info

✅ Process Monitoring

✅ Customizable Alerts (email/logs)

✅ Easy to read CLI Output or Log File Option

🐧 Supported OS
This tool is intended only for Linux environments, such as:

-> Ubuntu

-> Debian

-> CentOS / RHEL

-> Arch Linux

Other Linux distributions with Bash support

🚀 Getting Started
1. Clone the Repository
bash
Copy
Edit
git clone https://github.com/AyonDevNet/monitoring_tools.git
cd monitoring_tool
2. Make Scripts Executable
bash
Copy
Edit
chmod +x *.sh
3. Run the Monitoring Script
bash
Copy
Edit
./monitor.sh
📂 Folder Structure
bash
Copy
Edit
.
├── monitor.sh            # Main monitoring script
├── cpu_usage.sh          # CPU monitoring
├── memory_usage.sh       # RAM monitoring
├── disk_usage.sh         # Disk space monitoring
├── network_usage.sh      # Network traffic monitoring
├── logs/                 # Folder to store logs
└── README.md             # Project documentation
🛡️ Prerequisites
Bash Shell (/bin/bash)

Standard Linux utilities (top, df, free, ifconfig, awk, grep, etc.)

📬 Contributing
Pull requests are welcome! Feel free to fork this repository and submit improvements, bug fixes, or new features.


