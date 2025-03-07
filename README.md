#Steps to build the Infrastructure

Clone the Repository to your local
git clone <RepoURL>
Initialize terrraform to create instance and deploy jenkins
cd jenkins
terraform init
terraform apply --auto-approve
The terraform script will deploy and EC2 instance and the jenkins.sh script will run as sript.sh to bootstrap the server
Copy the instance Public IP and access jenkins on the browser
http://<public>:8080
Copy the jenkins token and login to the jenkins server
Go to manage jenkins and create project and either use a jenkins file of a pipeline syntax
The pipeline will clone the repo to perform task