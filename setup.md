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
* copy the following into the file removing the `#` that's in front 

`# [logstash-6.x]
# name=Elastic repository for 6.x packages
# baseurl=https://artifacts.elastic.co/packages/6.x/yum
# gpgcheck=1
# gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
# enabled=1
# autorefresh=1
# type=rpm-md`

* installl logstash 
`sudo yum install -y logstash`
