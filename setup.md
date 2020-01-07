## installing logtash on aws ec2 with amazon linux ami

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
```
[logstash-6.x]
name=Elastic repository for 6.x packages 
baseurl=https://artifacts.elastic.co/packages/6.x/yum 
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
```
* installl logstash 
`sudo yum install -y logstash`



* create file this file `touch /etc/logstash/conf.d/logstash.conf`

```
input{
    s3 {
        bucket => "elk-test-bucke"
        access_key_id => "key"
        secret_access_key => "secret"
        region => "us-west-2"
        interval => "10"
    }
}
output {
    elasticsearch {
        hosts => ["elasticsearch/endpoint:443"]
        ssl => "true"
       # index => "production-logs-%{+YYYY.MM.dd}"
    }
}
```
`sudo systemctl start logstash` <br/>



