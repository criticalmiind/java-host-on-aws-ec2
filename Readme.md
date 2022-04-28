# Live Scripts

## AWS EC2 Setup Steps
1. Open Aws <a href="console.aws.amazon.com">Console</a>.
2. Click on <a href="./images/1.png">Launch a virtual machine</a>.
3. After Click Page Configuration Like <a href="./images/3.png">This</a> (create key pair <a href="./images/2.png">This</a> if not exist, key pair ```.pem``` will download automatically).
4. After Creating Instance Click on <a href="./images/4.png">View all Instance</a>.
5. After that you will see your running instance like <a href="./images/5.png">this</a>.
6. Check your instance and click on connect, like <a href="./images/6.png">this</a>.
7. After Clicking on Connect, click on ```SSH client``` Tab, like <a href="./images/7.png">this</a>.
8. Now you need your ```.pem``` file which auto downloaded in your system when you create key pairs, to give permissions to your ```.pem``` file use following command:
```bash
chmod 400 Testing_Scripts.pem
```
9. Now you need to connect your AWS ec2 Instance using terminal ssh, following command: <a href="./images/8.png">Screenshot</a>
```bash
example: ssh -i "your_.pem_file" ec2_instance_user@server_host

ssh -i "Testing_Scripts.pem" ubuntu@ec2-34-220-56-187.us-west-2.compute.amazonaws.com
```



## AWS EC2 Instance Dep and Required Library Installations
1. Basic packages commands we need:
```bash
sudo su
```
```bash
apt update;
apt install nano;
apt install git;
```

2. install java we need for our project execution
```bash
apt install default-jre
```

3. Python3 is already installed in ec2 Ubuntu if not you can install from following commonds (Optional):
```bash
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt-get update
sudo apt-get install python3.6
```



## Project Setup in AWS EC2 Instance
1. create a folder for your files and give permissions.
```bash
mkdir files;
chmod -R 777 files;
cd files;
```
2. clone your project from github repo, example:
```bash
# clone project
git clone https://github.com/criticalmiind/java-host-on-aws-ec2.git .

# cd to your project
cd infra-problem-master;
```

3. Installing Project Dependancies:
```bash
chmod a+x ./lein.sh
```
