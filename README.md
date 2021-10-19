# align

## Bare metal installation
- [ruby](https://ruby-china.org/wiki/rvm-guide)
- [rails]('https://ruby-china.org/wiki/mac-nginx-passenger-rails')

## required
- Ruby >= 2.4
- Rails = 4.2.11.1
- PostgreSQL = 12.4 with postgis
- Git = 2.20.1

## Get source
```shell
mkdir -p ~/Projects/
cd ~/Projects/
git clone git@github.com:wenph1993/align.git
```

## Install Notes
```shell
cd align

cp config/database.yml.example config/database.yml

bundle exec rake db:migrate

bundle install
```

## start up
rails s

then you can open web with localhost:3000

## register

you need register user first

## login
you can user login in

## tasks
- when you logined, you can add some action, such as add, start, done and destroy
- if you chose show closed tasks, tasks will show all tasks, included has beened done

## rspec test
```
rspec spec/models/task_spec.rb task测试
rspec spec/models/user_spec.rb user测试
```