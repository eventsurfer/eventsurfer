# Eventsystem

Event-Management-System

Staging: [![Build Status](https://travis-ci.com/eventsurfer/eventsurfer.svg?branch=staging)](https://travis-ci.com/eventsurfer/eventsurfer)

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/7125f48349bb4213931d0d42a42f4c1f)](https://www.codacy.com/app/florianfynnweber/eventsurfer?utm_source=github.com&utm_medium=referral&utm_content=eventsurfer/eventsurfer&utm_campaign=Badge_Grade)

[Production](http://eventsurfer.online)

[Etherpad](https://medienpad.de/p/Y3pAwhZhbP)

Install bundle:

```
gem install bundle
```

Install project

```
git clone https://github.com/eventsurfer/eventsurfer.git
bundle install --path=vendor/bundle
```

Change file *yourpath\Eventsystem\config\database.yml*

Starting the server through the console:

```
bundle exec rails server
```

Start the rails console:

```
bundle exec rails console
```

Generate a migration:

```
bundle exec rails generate migration nameofmigration
```

Migrate changes:

```
bundle exec rails db:migrate
```

Run Rubocop:

```
bundle exec rubocop
```
