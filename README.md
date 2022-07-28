# r-causalverse
Dockerfile for tidyverse + causal inference related R packages

# Running Instructions
1. [Launch and connect to an AWS instance](https://tilburgsciencehub.com/tutorials/more-tutorials/running-computations-remotely/launch-instance/)

2. Install docker on the instance:
- Update the packages on your instance:
`$ sudo yum update -y`
- Install Docker:
`$ sudo amazon-linux-extras install docker`
- Start the Docker Service:
`$ sudo service docker start`
- Tip- Add the ec2-user to the docker group so you can execute Docker commands without using sudo:
`$ sudo usermod -a -G docker ec2-user`

3. [Move the R scripts or folder from your local machine to the AWS instance](https://tilburgsciencehub.com/tutorials/more-tutorials/running-computations-remotely/move-files/)

4. Obtain the docker template for running R on AWS
- Fork this repository
- Edit the `source` directory and `password` fields in the docker-compose.yml file.

The source directory will contain the filepath of the folder containing all the R scripts you’d like to run on the instance. Finally, set a password which serves as the log in password of RStudio once launched.

Note: The source directory should be based on the EC2 machine and not local machine [e.g. `/home/ec2-user/<FOLDER NAME>`]

- Move this repo folder containing the **updated** docker-compose.yml file to the EC-2 machine

5. Pull the image from docker hub:
`docker pull shrabastee/r-causalverse:latest`

6. Install docker-decompose command on EC-2:

- Copy the appropriate docker-compose binary from GitHub:
`sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose`

- Fix permissions after download:
`sudo chmod +x /usr/local/bin/docker-compose`

- Verify if download was successful:
`docker-compose version`

7. Run and configure docker image :
`docker-compose -f docker-compose.yml run --name rstudio --service-ports rstudio`

8. Open the 8787 web server port on EC2 to host R
- Go to AWS management console
- Click the running instance —> Security
- Add default security group —> edit inbound rules
- Specify in bound rule: IP version = IPv4; Type = Custom TCP; Port range = 8787

9. Launch R:
- Open a new web window and enter URL: http://<instance IP>: 8787
Copy-paste the Public IPv4 DNS address for instance IP above.
- Enter `rstudio` as username and password as specified in the docker-compose file.
