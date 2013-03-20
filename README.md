# Getting started:

    bundle
    cp config/database.yml.example.postgres config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate

    bundle exec rails s

Visit [localhost:3000/projects](http://localhost:3000/projects) and add a new project.
(If you don't know the project's $GEM_HOME path, use `echo $GEM_HOME` from the project's root folder)

- [x] Interface to add projects by name & path to gemset
- [x] Search those gems for *LICENSE* files
- [x] Build dependency models out of the gem's name and join them to the project
- [x] Interface to flag dependencies as approved
- [ ] Parse markdown if the LICENSE contains is a *LICENSE*.md
- [ ] Tag dependencies with license info -unimplemented
- [ ] Export csv -unimplemented
- [ ] Import csv -unimplemented
