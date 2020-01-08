#!/bin/sh
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

sudo yum install -y logstash

touch /etc/logstash/conf.d/logstash.conf
# the conf for logstash might need to be changed. make changes as needed before running the script
echo 'input{
    s3 {
        bucket => "BUCKET NAME HERE"
        access_key_id => "ACCESS KEY HERE"
        secret_access_key => "SECRET KEY HERE"
        region => "us-west-2"
        interval => "10"
    }
}

filter {
    mutate {
	gsub => ["message","\|"," "]
        gsub => ["message","\["," "]
        gsub => ["message","\]"," "]
    }
    grok{
	match => {'message' => '%{URIHOST:host} %{IP:first} %{SYSLOGTIMESTAMP:timestamp} %{USERNAME:hi} %{WORD:log}: %{URIHOST:secondhost} %{IP:publicIP}'}
    }
}

output {
    elasticsearch {
        hosts => ["ELASTICSEARCH END POINT:443"]
        ssl => "true"
        index => "production-logs-%{+YYYY.MM.dd}"
    }
}' > /etc/logstash/conf.d/logstash.conf

sudo systemctl start logstash
