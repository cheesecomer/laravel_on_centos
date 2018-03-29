# Laravel On CentOS
| Software          | Version                   |
| :-----------------|:--------------------------|
| Docker            | 18.03.0-ce, build 0520e24 |
| docker-compose    | 1.20.1, build 5d8c71b     |
| PHP               | 7.2                       |
| Composer          | latest                    |
| Laravel Framework | 5.6.14                    |
| Nginx             | 1.13.10                   |


```
vagrant up && vagrant ssh
```

```
cd /vagrant/laravel
docker-compose up -d nginx
```