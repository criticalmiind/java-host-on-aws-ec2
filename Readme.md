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

Launching ec2 Ref: <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.WebServerDB.CreateWebServer.html">Here</a>



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
# for more visit https://leiningen.org/#install
apt install leiningen;

# install make package if not installed already
apt install make;

# you need to ensure that the common libraries are installed: follow commond will allow you to build the JARs.
make libs;

# To build all the JARs and generate the static tarball, run the make clean all command from this directory. The JARs and tarball will appear in the build/ directory.
make clean all;
```

4. Run our project script/frontends:
```bash
# this is our three services which we run inside the aws ec2 ubuntu
java -jar ./build/quotes.jar & # INFO: Running quotes on port 8080
java -jar ./build/newsfeed.jar &
java -jar ./build/quotes.jar &

# or run bash file from project
./run.sh

# Our Service will run just inside the ec2, we can't access any of that service outside, so let see how we can configure ec2 service/ports to access outside on public ip/url
```

5. Check your instantance, then click on ```Actions->Security->Change security groups``` <a href="./images/9.png">Ref Image</a>.
6. Note your instance group name, in my case its ```launch-wizard-1``` <a href="./images/10.png">Ref Image</a>.
7. Goto you left sidebar and under ```Network & Security``` click on ```Security Groups``` <a href="./images/11.png">Ref Image</a>.
8. click on your instance security group, in my case ```launch-wizard-1``` <a href="./images/12.png">Ref Image</a>.
9. Click on ```Actions->Edit inbound rules``` <a href="./images/13.png">Ref Image</a>.
10. Click on ```Actions->Edit inbound rules``` <a href="./images/14.png">Ref Image</a>.
11. Add new rules like <a href="./images/13.png">this</a> and save.
12. Now go back to your ec2 instance dashboard and open your public ip/public url.


* `quotes URL` which serves a random quote from `quotes/resources/quotes.json`
* `newsfeed url` which aggregates several RSS feeds together
* `front-end url` which calls the two previous (quote&newsfeed) services and displays the results.

* `qoute url`: http://ec2-34-220-56-187.us-west-2.compute.amazonaws.com:8083/api/quote
* `newsfeed url`: http://ec2-34-220-56-187.us-west-2.compute.amazonaws.com:8082/api/feeds
* `front-end url`: http://ec2-34-220-56-187.us-west-2.compute.amazonaws.com:8081/