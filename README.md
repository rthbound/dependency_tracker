Do also check out [LicenseFinder](https://github.com/pivotal/LicenseFinder) from [pivotal](https://github.com/pivotal). They also have a SaaS version of their product in the works at [http://licenseaudit.pivotallabs.com/](http://licenseaudit.pivotallabs.com/).  If your projects are hosted on github, their tool may suffice.

### Purpose

* **dependency_tracker** provides an interface for viewing and
approving dependencies based on the license agreements under which
they have been released.
* It provides a rake task for exporting all third party
software dependencies and their associated license agreements as a *.csv
file.
* It makes it easy to spot software with unsatisfactory
or missing licenses.
* It will assume that if a dependency's licensing is deemed
agreeable for one project, it will be agreeable in all projects. Saves you
time wasted by considering the same thing repeatedly.

### Getting started:

    bundle
    cp config/database.yml.example.postgres config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate

    bundle exec rails s

Visit [localhost:3000/projects](http://localhost:3000/projects) and add a new project. You'll be asked
to provide both the root path and gem home path for each dependency.

## Screenshots

Here's a couple of screenshots to help you get the picture.

The project index:
![Project index page](https://raw.github.com/rthbound/dependency_tracker/master/screenshots/projects_index.png)

The project show:
![Project show page](https://raw.github.com/rthbound/dependency_tracker/master/screenshots/project_show.png)
# Contributing

Please share any ideas you have that could make this project more useful. Issues and Pull Requests are more than welcome.
