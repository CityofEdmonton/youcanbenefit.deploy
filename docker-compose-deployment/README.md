## Setting up a VM

Set up a Linux VM on a cloud provider such as Google Cloud Platform, Microsoft Azure, or Amazon Web Services.

Allow HTTP and HTTPS traffic on the VM.

SSH into the VM.

## Installing git and docker
If git is already installed on the VM, then install it.

Installing docker will depend on the Linux distribution chosen.

On Ubuntu 18-04, simply run `sudo snap install docker`. 

Make sure that docker-compose is also installed.

## Configuring the VM for production

Run `sudo sysctl -w vm.max_map_count=262144` to increase the max map count for elasticsearch

## Cloning the repository

Run `git clone https://github.com/CityofEdmonton/youcanbenefit.deploy.git`.

Run `cd youcanbenefit.deploy/docker-compose-deployment`.

## Setting up a domain name

Set up a domain name and point it to the IP address of the VM.

## Setting the environment variables
Use a text editor such as vim to edit the environment variables located in the `.env` file.

There are four environment variables to be configured:
- DOMAIN_NAME: the domain name that YouCanBenefit will be hosted at
- EMAIL_FOR_DOMAIN: the associated email for the domain name
- ADMIN_USERNAME: the username that will be used to log into the admin section of YouCanBenefit
- ADMIN_PASSWORD: the password that will be used to log into the admin section of YouCanBenefit

After setting these variables, save and quit the text editor.

## Deploying

Run `sudo docker-compose up -d`.

To see the logs, run `sudo docker-compose logs`.
