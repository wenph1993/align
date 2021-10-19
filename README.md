# align

## versions
Ruby >= 2.4
Rails = 4.2.11.1
PostgreSQL = 12.4 with postgis
Git = 2.20.1

##### start it
cd projects
git@github.com:wenph1993/align.git
cd align_blog

## Install Notes

cp config/database.yml.example config/database.yml

bundle exec rake db:migrate

bundle install

rails s

register a user and login

## rspec test
```
rspec spec/models/task_spec.rb task测试
rspec spec/models/user_spec.rb user测试
```