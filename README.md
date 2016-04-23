## README

### Create a Workspace Folder
```
$ mkdir BAI5_AIP
$ cd BAI5_AIP
```

### New Rails Application with SQLite3 Database
```
$ mkdir apiapp
$ cd apiapp
$ rvm use ruby-2.3.0@apiapp --ruby-version --create
```
Install Rails 5 Beta3
```
$ gem install rails --pre
```
Create new Rails Api Application
```
$ rails new apiapp --api
```

### Scaffolding the plan resource
```
$ cd apiapp
```
ID will generate automatically
```
$ rails g scaffold plan content:string
```

### Update database and generate serializer
```
$ rake db:migrate
```
Add this line to your application's Gemfile: 
```
gem 'active_model_serializers'
```
And then execute
```
$ bundle
```
Generate a serializer
```
$ rails g serializer plan content
```

### Run server
```
$ rails s
```

### Create a new Plan
```
$ curl -H "Content-Type:application/json; charset=utf-8" -d '{"content":"something new"}' http://localhost:3000/plans
```
<br>

### Useful Links
* http://railsapps.github.io/installrubyonrails-mac.html
* https://wyeworks.com/blog/2015/6/11/how-to-build-a-rails-5-api-only-and-backbone-application
* http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
* https://devcenter.heroku.com/articles/getting-started-with-rails5

### Useful Commands
Reset Rails Database
```
$ rake db:reset
```


