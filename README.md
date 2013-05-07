## The Story

I was tasked with gathering a list of all the gem dependencies and javascript dependencies being used in each of
my client's Rails applications. Obviously that's no task for a human, so I created this application to get the job done.

The application is really only useful in your development environment. It has two primary functions:

1. To provide a CSV export of all your projects' gem/js dependencies and their associated licenses.
2. To provide an interface for "approving" dependencies.

If a dependency exists in multiple projects, you should only need to approve it in one for it to be listed as approved in the other projects.

## Screenshots

Here's a couple of screenshots to help you get the picture.

The project index:
![Project index page](https://raw.github.com/rthbound/dependency_tracker/master/screenshots/projects_index.png)

The project show:
![Project show page](https://raw.github.com/rthbound/dependency_tracker/master/screenshots/project_show.png)

## Getting started:

    bundle
    cp config/database.yml.example.postgres config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate

    bundle exec rails s

Visit [localhost:3000/projects](http://localhost:3000/projects) and add a new project.
(If you don't know a project's $GEM_HOME path, use `echo $GEM_HOME` from the project's root folder).

- [x] Interface to add projects by name & path to gemset
- [x] Search those gems for *LICENSE* files
- [x] Build dependency models out of the gem's name and join them to the project
- [x] Interface to flag dependencies as approved
- [ ] Parse markdown if the LICENSE contains is a *LICENSE*.md
- [ ] Tag dependencies with license info -unimplemented
- [x] Export csv -unimplemented
- [ ] Import csv -unimplemented

# Contributing

Please share any ideas you have that could make this project more useful. Issues and Pull Requests are more than welcome.
