# Trio-task
Actual trio task files are in master branch


The goal of project task was to deploy the trio task onto AWS, making use of the services I had learned during the asynchronous week.

To acomplish this, I first began by creating a brand new vpc on aws. The vpc would allow for of the infrastructure to be housed within it, and it was given a cidr block of 16.

![vpc](https://github.com/Hamza-Dogar/triotask/blob/main/images/vpc.PNG)

After creating the vpc, I created 3 subnets, one public and two private. Each subnet was given unique cidr blocks so that they did not overlap with one another.

![subnets](https://github.com/Hamza-Dogar/triotask/blob/main/images/subnets.PNG)

With the public subnet I created an internet gateway so that it could connect to the internet. On this public subnet I then created an ec2 instance where I would clone the trio-task onto and deploy through the use of docker. Next, I added a security group to the instance which would allow for it to connect to the gateway and internet as well as to one of the private subnets (the one which will have the rds).

![ec2](https://github.com/Hamza-Dogar/triotask/blob/main/images/ec2.PNG)

On one of the private subnets I then created a rds database and added its own security group which would only allow for it to communicate with the ec2 instance on the public subnet. I created this subnet in a different availability zone to the ec2 instance so that if one zone was unavailable the entire application would not stop working. I then made note of the end point and port of the rds database and moved back into the ec2 instance.

![rds](https://github.com/Hamza-Dogar/triotask/blob/main/images/rds.PNG)

I ssh'ed into my ec2 instance through visual studio code and cloned the trio-task repository. I then completed the dockerfiles for the databse and the flask app as well as creating a new deploy.sh file where I entered all of my docker commands so that I only had to run the one file instead of manually running each docker command.
Next, I created a table through mysql and so once deploy.sh was run you could navigate to the address of the ec2 instance and see the flask app running like in the following picture:

![webpage](https://github.com/Hamza-Dogar/triotask/blob/main/images/asw-triotask.PNG)
