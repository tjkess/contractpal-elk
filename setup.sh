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

echo 'input{
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
}' > /etc/logstash/conf.d/logstash.conf

sudo systemctl start logstash
