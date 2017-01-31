[The app is available in production on Heroku!](https://ellevate.herokuapp.com/)

# ELLevate

This web application is designed for teachers of English Language Learners.
Teachers sign in with Google OAuth and enter their students into the system,
including name, username, home language, WIDA language level, and an image used
as a student password (pass-image).

When students sign in, using their teacher's name, their personal username and
their pass-image they are taken to their content page. Students learn about
animals in habitats through images and sentence creation.

On their content page, students are provided an image, a sentence frame, and
space to enter their sentence. Students click the arrow key and watch their
sentence be translated into their home language.

Sentence frames and academic supports are built upon the guideline of the
[WIDA](https://www.wida.us/) Consortium.  

# How to install

### First:
Pick your favorite directory, then:

`git clone git@github.com:AliSchlereth/ellevate.git`

`cd ellevate`

### Second:
Run `bundle`. You'll need to be using Ruby 2.3.0. If you don't have that,
and you have rvm installed, you can run:

`rvm install ruby-2.3.0` ... to get 2.3.0.

The Gemfile should automatically switch rubies for you when you open PushPin

but if not, you can do `rvm use 2.3.0`.

### Third:
Now, you'll need to make sure your PostgreSQL database is running. If you've got

a small elephant at the top of your screen: great. If not, spin up your PostgreSQL app.

(If you don't have the app, go [here](http://postgresapp.com/) and follow the install instructions.)

### Fourth:
Next: run the following command in your terminal:

`rake db:create db:migrate db:seed db:test:prepare`

### Fifth:

Run `rspec`   

## Technical details:

A Rails app using a PostgreSQL database. Tests written in rspec-rails,
with dummy items coming from Factory Girl. Coverage provided by
SimpleCov.
