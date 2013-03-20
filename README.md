Getting started:

    bundle
    cp config/database.yml.example.postgres config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate

    bundle exec rails s

Visit [localhost:3000/projects](http://localhost:3000/projects) and add a new project.
(If you don't know the project's $GEM_HOME path, use `echo $GEM_HOME` from the project's root folder)

Anticipated improvements:
1) Provide easy interface for marking a dependency's license as "MIT", "GPL", "Apache", etc.
2) Provide a csv export feature
