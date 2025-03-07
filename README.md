
  Using the Iac to build an infrastructure with the use of \terraform and Ansible
  #Steps to build the Infrastructure

1.Clone the Repository to your local
2.git clone <RepoURL>
3.Initialize terrraform to create instance and deploy jenkins
4.cd jenkins
5.terraform init
terraform apply --auto-approve
The terraform script will deploy and EC2 instance and the jenkins.sh script will run as sript.sh to bootstrap the server
6.Copy the instance Public IP and access jenkins on the browser.
http://<public>:8080
6.Copy the jenkins token and login to the jenkins server.
7.Go to manage jenkins and create project and either use a jenkins file of a pipeline syntax.
The pipeline will clone the repo to perform task