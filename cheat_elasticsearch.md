# Issue
### View all your indices in your cluster:
```
$ curl -XGET http://127.0.0.1:9200/_cat/indices?v
health status index                       uuid                   pri rep docs.count docs.deleted store.size pri.store.size
yellow open   elastiflow-4.0.1-2020.06.13 FsvvPn7_RcGUZR3-Qn7I2A   3   1     171618            0     66.9mb         66.9mb
yellow open   elastiflow-4.0.1-2020.06.14 vZ-PUcW2RcubSqSKM9GSAw   3   1     162320            0     63.4mb         63.4mb
yellow open   elastiflow-4.0.1-2020.06.15 iMO5QeFcTReb-MazCfrE5g   3   1     161860            0     62.7mb         62.7mb
yellow open   elastiflow-4.0.1-2020.06.16 l8-9JBpIStyO6oatcS8D7Q   3   1     160257            0     62.9mb         62.9mb
yellow open   elastiflow-4.0.1-2020.06.20 iLZ7SOfuT3qP1R0VxrSRmA   3   1     165346            0     65.3mb         65.3mb
yellow open   elastiflow-4.0.1-2020.06.21 pagBoEbcSRq3LatI_BqpaA   3   1      50684            0     21.2mb         21.2mb
yellow open   elastiflow-4.0.1-2020.06.10 tiW7Yq_9RaWfSMB0HqiVdg   3   1     188858            0     73.8mb         73.8mb
yellow open   elastiflow-4.0.1-2020.06.11 e9sWMrTYQAK4w8aPJrx6wQ   3   1     184030            0     70.4mb         70.4mb
yellow open   elastiflow-4.0.1-2020.06.12 5kFRc1sFT-WsfJ1Uzph7ZA   3   1     190610            0     74.2mb         74.2mb
yellow open   elastiflow-4.0.1-2020.06.17 c59dmwbAQoWk7uagk4U33g   3   1     162244            0     64.7mb         64.7mb
yellow open   elastiflow-4.0.1-2020.06.18 A-1ctEPfTAWmcJWrAYPLYQ   3   1     156380            0       62mb           62mb
yellow open   elastiflow-4.0.1-2020.06.19 AQpYJ9-7TJmWlYGHRwJvRg   3   1     170568            0     66.8mb         66.8mb
yellow open   elastiflow-4.0.1-2020.06.09 Y2vjdoNAQOaQkSYZYlsxKQ   3   1      71881            0     29.1mb         29.1mb
```
### delete one index
```
curl -XDELETE http://elasticsearch:9200/elastiflow-4.0.1-2020.06.09
```
