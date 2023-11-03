
# Sending TPS report reminder mail

This project provides instructions for sending a report mail to a single recipient or multiple recipients.

## Getting Started

Follow these steps to send an email from a script:

1. **Update package manager**
   ```bash
   apt update
2. **Install ssmtp and mailutils**
    ```bash
   apt install ssmtp mailutils -y
3. **Check mail version**
   ```bash
   mail version
4. **Generate app password for your mail**
     [Follow these instructions](https://www.devopszones.com/2020/03/how-to-create-use-app-passwords-in-gmail.html)
5. **Edit ssmpt.conf file**
    ```bash
    sudo nano /etc/ssmtp/ssmtp.conf

6. **Edit these values**
    - root=YOUR-MAIL@gmail.com
    - mailhub=smtp.gmail.com:587
    - AuthUser=YOUR-MAIL@gmail.com
    - AuthPass=generated-app-password-without-spaces
    - FromLineOverride=YES
    - UseTLS=YES
    - UseSTARTTLS=YES

7. **Make sendmail.sh and copy the script** 
    ```bash
    touch sendmail.sh 

7. **Make the sendmail.sh file executable** 
    ```bash
    sudo chmod 777 sendmail.sh  

8. **Execute the script** 
    ```bash
    ./sendmail.sh -r "recipient1, recipient2" -d "date" -m "your-Message" -s "sender-name"

