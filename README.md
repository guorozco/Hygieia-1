
Fork from: (https://github.com/capitalone/Hygieia) to start a dashboard running on AWS

**Prerequisites**

* Terraform greater than: 0.11.7+
* Ansible greater than: 2.7.0+

**Installation Steps**

* Configure your `AWS_ACCESS_KEY_ID` and your `AWS_SECRET_ACCESS_KEY`
```
 export AWS_ACCESS_KEY_ID=XXXXXXXXX
 export AWS_SECRET_ACCESS_KEY=XXXXXXXXX

```
* Create your Key Pair on the region where is going to be deployed the solution
* Configure your Key file on the `Servers-Terraform.tf`
```
variable "key_pair" {
  default = "new-key-pair"
}

  key_name = "AWS_Gorilla_Demo"
  
}
```

This will trigger the creation of the 2 new EC2 instances:
```
resource "aws_instance" "jenkins_master_Gorilla" {
  ami           = "ami-XXXXXXXXX"
  instance_type = "t2.medium"
  security_groups = ["${aws_security_group.ssh_and_http.name}"]
  key_name = "AWS_Gorilla_Demo"
  tags {
        Name = "jenkins_master_Gorilla"
        role = "jenkins_master_Gorilla"
       }
}

resource "aws_instance" "swarm-docker_Gorilla" {
  ami           = "ami-XXXXXXXXX"
  instance_type = "t2.medium"
  security_groups = ["${aws_security_group.ssh_and_http.name}"]
  key_name = "AWS_Gorilla_Demo"
  tags {
        Name = "swarm-docker_Gorilla"
        role = "swarm-docker_Gorilla"
       }
}
```
* On your computer export the following variables:
Export you AWS Keys:
```
export AWS_ACCESS_KEY_ID='XXXXXXXXXXXXXXXXXXXXXXXXXX'
export AWS_SECRET_ACCESS_KEY='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
export ANSIBLE_HOSTS=/usr/local/bin/ec2.py
export EC2_INI_PATH=/usr/local/bin/ec2.ini
```
Then:
* Execute `./ec2 --list`
* Execute `terraform plan`
* Execute `terraform apply`

* Configure Jenkins 
```
Manage Jenkins -> Global Tool Configuration
Configure:

Maven
JDK
GIT
DOCKER


Apply and Save
```
* Create the pipeline in Jenkins select pipeline and SCM
```
Git Repository 
  https://github.com/guorozco/Hygieia-1.git
