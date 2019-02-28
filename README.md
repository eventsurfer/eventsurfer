# Eventsystem
P5-Arbeiten

[Production](http://menschenmachenmenschensachen.online)

[Etherpad](https://medienpad.de/p/Y3pAwhZhbP)


Install bundle:
```
gem install bundle
```

Initialisieren des Programms:
```
git clone https://github.com/florianfynnweber/menschenmachenmenschensachen.git
bundle install --path=vendor/bundle
```

Verändern der Datei *yourpath\Eventsystem\config\database.yml*

Starten des Servers über die Konsole:
```
bundle exec rails server
```


Starten der Webconsole:
```
bundle exec rails console
```

Generieren einer Migration:
```
bundle exec rails generate migration nameofmigration
```

Migrieren von Änderungen:
```
bundle exec rails db:migrate
```

Rubocop ausführen:
```
bundle exec rubocop
```
