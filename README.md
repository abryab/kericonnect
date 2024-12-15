# Bitdefender Antivirus Offline Updater for Kerio Connect Linux Version

This repository provides a script to automate antivirus updates for Kerio MailServer. Follow the steps below to set up the `antivirus_updater.sh` script and configure it to run every 2 days using a cron job.

## Installation Guide

### 1. Create the UpdateBit Directory
Create the directory `UpdateBit` under the path `/opt/kerio/mailserver/`:

```bash
sudo mkdir -p /opt/kerio/mailserver/UpdateBit
```

### 2. Place the Script
Move the `antivirus_updater.sh` file to the `UpdateBit` directory:

```bash
sudo mv antivirus_updater.sh /opt/kerio/mailserver/UpdateBit/
```

Ensure the script is executable:

```bash
sudo chmod +x /opt/kerio/mailserver/UpdateBit/antivirus_updater.sh
```

### 3. Configure the Cron Job
Set up a cron job to run the script every 2 days:

1. Open the crontab editor:
   ```bash
   sudo crontab -e
   ```

2. Add the following line:
   ```bash
   0 0 */2 * * /opt/kerio/mailserver/UpdateBit/antivirus_updater.sh
   ```
   This will run the script every 2 days at midnight.

3. Save and exit the editor.

### 4. Verify the Cron Job
To ensure the cron job is active, list the current jobs:

```bash
sudo crontab -l
```

You should see the line you added:
```bash
0 0 */2 * * /opt/kerio/mailserver/UpdateBit/antivirus_updater.sh
```

## Notes
- Ensure you have sufficient permissions to create directories and edit crontab.
- If logging is needed, modify the cron job to append output to a log file:
  ```bash
  0 0 */2 * * /opt/kerio/mailserver/UpdateBit/antivirus_updater.sh >> /var/log/antivirus_updater.log 2>&1
  ```

## License
This project is licensed under the MIT License. See the LICENSE file for details.

