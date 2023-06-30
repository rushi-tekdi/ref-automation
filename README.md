# ref-automation

## Step 1 – Installing Nginx

  git clone https://github.com/Unified-Learner-Passbook/ref-automation.git

Go to specific directory where you have clone the repository i.e. ref-automation 
Then perform the following command 

  sudo chmod -R +x nginx.sh

Export your_domain=<domain you want > 
Example : (export your_domain=test.automation.com)
Then run the nginx.sh file 
./nginx.sh 

## Step 2 - Register your server to the Domain
Register The Server IP in the domain name in A records and wait for the validation. 
 
### Install Certbot 
To install certbot for the ubuntu20.04 for nginx use cases follow the below command 

  sudo apt install certbot python3-certbot-nginx

  sudo certbot 

Add your mail id in the next step.

Then agree to the terms and conditions by Typing "Y" + Enter
After that certbot will show you domain name you have setup select the appropriate domain name there with number 
Ex : 
1. Test.automation.com 
2. www.test.automation.com

Then select 1

Select the option redirecting the http to https access and you are done with the SSL certificates

## Step 3 - Setting Up the services 
 
After installing certificates to the domain go to specific directory i.e. ref-automation
And perform the following command 

  sudo docker-compose up -d 

Once all the containers are up and running then perform the below commands step by step 

  sudo docker exec -it postgres_db bash
  psql -U postgres
  CREATE DATABASE cred_ms
  CREATE DATABASE cred_ms_schema
  CREATE DATABASE identity 

And exit the container
Perform the following command in the terminal : 
 
sudo docker restart credential_ms cred_schema_ms_service did_l3_service

### Step 4 - Nginx configurations 

Go to the /etc/nginx/sites-enabled/ and go to the config file of your domain that we have created 
add the below entity in the file in the server block 

location /registry/ {
                proxy_pass http://regisry:8081/;
        }

Like above add your service name and in proxy_pass add container name with assign Port
save and close the file 
then run the below commands 

  sudo nginx -t 
  sudo systemctl restart nginx 

check the domain name with https access.
