# 💽 Project: Sharing LVM-Based Disk Between Virtual Machines in VMware Workstation

## 🧠 Objective

Simulate real-world behavior of:
- Creating an LVM-based disk in one VM (`server-2`)
- Moving (sharing) that disk to another VM (`server-3`) to access the data
- Treating the disk like a removable external drive in virtual infrastructure

---

## 🖥️ VM Setup

| VM Name   | Purpose                     |
|----------|-----------------------------|
| server-1 | Primary system with source data |
| server-2 | Has LVM-based external disk |
| server-3 | Acts like another PC that reads the external disk |

---

## ⚙️ Step-by-Step Process

### 🔧 Part 1: Add Virtual Disk to `server-2`

1. In VMware Workstation:
   - Go to `server-2` → Settings → Add → **Hard Disk**
   - Choose: **SCSI**, **Create new virtual disk**, **5GB**, don’t pre-allocate
   - Finish and boot `server-2`

2. Check the disk in the VM:

############ -------- script ------- ###########


sudo fdisk /dev/sdb
# Press: n → p → Enter → Enter → w

# Create filesystem structure
sudo pvcreate /dev/sdb1
sudo vgcreate vg_external /dev/sdb1
sudo lvcreate -n lv_data -L 4.8G vg_external
sudo mkfs.ext4 /dev/vg_external/lv_data

#Mount and Add Files

sudo mkdir -p /mnt/lvm_storage
sudo mount /dev/vg_external/lv_data /mnt/lvm_storage

# Test file
echo "hello from server-2" | sudo tee /mnt/lvm_storage/hello.txt



🔁 Part 4: Share the Disk with server-3
Shutdown both VMs

In VMware:

Go to server-3 → Settings → Add Hard Disk

Choose: Use an existing virtual disk

Browse and select the .vmdk file of server-2’s 5GB disk
Boot up server-3



#Mount LVM Disk in server-3 in VM 2
# Scan and activate LVM
sudo vgscan
sudo vgchange -ay
sudo lvscan

# Mount the volume
sudo mkdir -p /mnt/shared_disk
sudo mount /dev/vg_external/lv_data /mnt/shared_disk

# Check contents
ls /mnt/shared_disk
cat /mnt/shared_disk/hello.txt

