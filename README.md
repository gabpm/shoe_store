# shoe_store

#Shoe Stores

This app will let users list out local shoe stores and the brands of shoes they carry.

##Author

Gabriel Puello

##Install

This app is used in connection with Sinatra and ActiveRecord. You do not have to run Rails.

Download or fork the repository and bundle in terminal in order to use the required gems and dependencies.

I have some extra files but you do not need those if you set up correctly from the beginning.

If you are starting from scratch you should first make an important folder: 'config' -- with a database.yml file inside it.

In your yml file will be :

```ruby
development:
adapter: postgresql
database: shoe_store_development

test:
adapter: postgresql
database: shoe_store_test
```

Then


Run ```rake db:create```

then:  ```rake db:test:prepare```

This will create the main and test databases.


Run ```rake db:create_migration NAME=stores```

A db folder with a sub folder called ```migrate``` with migration files will automatically be created.


Check the repository files for more information on what to insert in those files, lib folder, spec set up, Rakefile, Gemfile,and views.


After you have completed those run ```rake db:migrate``` and  ```rake db:test:prepare``` again to update your test database for specs. You should always update your test database after creating a new migration.
