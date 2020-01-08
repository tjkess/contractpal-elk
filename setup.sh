sudo yum update -y

sudo yum install -y java-1.8.0-openjdk

sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

touch /etc/yum.repos.d/logstash.repo

echo '[logstash-6.x]
name=Elastic repository for 6.x packages 
baseurl=https://artifacts.elastic.co/packages/6.x/yum 
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md' > /etc/yum.repos.d/logstash.repo


