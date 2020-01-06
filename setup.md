## installing logtash 

### run the following commands 

* update 
`sudo yum update -y`
* install java
`sudo yum install -y java-1.8.0-openjdk`
* get key 
`sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch`
* create install file
`sudo vi /etc/yum.repos.d/logstash.repo`
* copy the following into the file

[logstash-6.x] <br/>
name=Elastic repository for 6.x packages <br/>
baseurl=https://artifacts.elastic.co/packages/6.x/yum <br/>
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch <br/>
enabled=1 <br/>
autorefresh=1 <br/>
type=rpm-md <br/>

* installl logstash 
`sudo yum install -y logstash`
