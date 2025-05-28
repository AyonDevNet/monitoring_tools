# 🛠️ Bash Monitoring & Management Tools for Linux Systems

A collection of powerful Bash scripts for monitoring and managing Linux systems. This toolkit is designed for system administrators, DevOps engineers, and Linux power users who want quick, effective tools for resource monitoring, MySQL setup, user management, and more.

📌 Repository: [monitoring_tools](https://github.com/AyonDevNet/monitoring_tools)


## 🚀 Key Features

- 🔍 Monitor system resources (RAM, disk, network)
- 🧰 Automate MySQL installation and secure setup
- 👤 Create multiple users from a file
- 🗃️ Compress files with custom naming
- 🌐 Perform basic network diagnostics
- 🧪 Ready-to-run Bash scripts for any Linux environment

---

## 📂 Script Overview

| File Name               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `mysql_install_script.sh` | Install and secure MySQL 5.7 automatically using Bash                     |
| `disk.sh`              | Check disk usage and show mounted partitions                                |
| `ram_usages.sh`        | Monitor RAM usage and system memory stats                                   |
| `network.bash`         | Perform basic network tests like ping, IP info, and connectivity checks     |
| `users_add_create.sh`  | Create users in bulk from a file and assign passwords                       |
| `compressd_file.sh`    | Compress and archive files with custom options                              |
| `compressd.text`       | Sample file input for compression                                            |

---

## ⚙️ Usage Instructions

1. **Clone this repo:**
   
   git clone https://github.com/AyonDevNet/monitoring_tools.git
   cd monitoring_tools

Make scripts executable:

permission : 
chmod +x *.sh *.bash

Run any script:
./disk.sh
./mysql_install_script.sh
./users_add_create.sh

🧠 Use Cases
System resource monitoring (RAM, Disk, Network)

Automated LAMP server provisioning

Multi-user creation for lab or production environments

Daily/weekly backups using compression

Quick Linux diagnostics in CLI

💡 Why Use These Bash Tools?
✅ Lightweight and no dependencies

✅ Written for real-world system admin tasks

✅ Easy to understand and customize

✅ Ideal for automation and cron jobs

✅ Works on most Debian/Ubuntu-based systems

🔐 Security & Warnings
These scripts require sudo/root privileges to perform system-level operations. Always review scripts before running in a production environment.



🤝 Contributions
Pull requests, bug fixes, and suggestions are welcome! Please fork the repository and open an issue if you'd like to propose improvements.

📜 License
This project is open-source and available .

👤 Author
AyonDevNet
🔗 GitHub Profile
DevOps & Network Engineer | Passionate about Linux, automation, and monitoring.

⭐ Star this repo if you find it helpful, and follow for future Bash scripting tools!

