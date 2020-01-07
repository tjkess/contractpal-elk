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

* install gem 
`sudo yum install gem`

* clone amazon es plugin 
`git clone https://github.com/awslabs/logstash-output-amazon_es.git`

* build it 

`cd logstash-output-amazon_es` <br/>
`gem build logstash-output-amazon_es.gemspec` <br/>
`mv logstash-output-amazon_es.gem /amazon_es.gem` <br/>
`cd /usr/share/logstash` <br/>
`bin/logstash-plugin install /amazon_es.gem`


* create file this file `touch /etc/logstash/conf.d/logstash.conf`

```input{
    s3 {
        bucket => "elk-test-bucke"
        access_key_id => "key"
        secret_access_key => "secret"
        region => "us-west-2"
    }
}
output {
    amazon_es {
        hosts => ["elasticsearch/endpoint"]
        region => "us-west-2"
        # aws_access_key_id and aws_secret_access_key are optional if instance profile is configured
        aws_access_key_id => 'key'
        aws_secret_access_key => 'secret'
       # index => "production-logs-%{+YYYY.MM.dd}"
    }
}```
