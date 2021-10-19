# align_blog
##### start it
cd projects
git clone git@github.com:wenph1993/align_blog.git

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