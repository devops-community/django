# Django

Build and deploy a simple setup for a [Django](https://www.djangoproject.com) app on [devo.ps](http://devo.ps).

## Install

Simply use the link below:

[![Fork on devo.ps](https://app.devo.ps/assets/images/fork.png)](https://app.devo.ps/#/fork?git_url=https://github.com/devops-community/django)

Once you've forked the repository, open it in devo.ps and you will be prompted for a few settings, including the Git URL for the code of your application.

To deploy your app, you will need to navigate to the tasks page of the repo and run the task manually (click on "play" icon, right of the "Build the Django app" task).

## What's in the box?

This setup contains one server (`nodes/django.yml`) with **Nginx**, **Python**, **uWSGI** (with emperor) and **MySQL 5.5** (with a "django" user and a "django" database)

We have included as well a task (`tasks/build-django.yml`) that:

1. Clone your django app from GitHub (set to [JuhaS/django-sample-app](https://github.com/JuhaS/django-sample-app) by default).
1. Install all your application dependencies defined in your `requirements.txt` file
1. Run a build script (`scripts/install_local_py.sh`) that will:
  1. Write the configuration file (to connect it to MySQL)
1. Sync the database using the `manage.py` script
1. Setup the uWSGI application (vassal)

The current repo provides a very simple setup. Hack at will!

## Questions?

If you have any question, come ask us on the [devo.ps chat](https://www.hipchat.com/gyHEHtsXZ) or shoot us an email at [help@devo.ps](mailto:help@devo.ps) (though, you should really just [ask us in the chat](https://www.hipchat.com/gyHEHtsXZ)).

# Reference

- [Nodes in devo.ps](http://docs.devo.ps/manual/nodes)
- [Tasks in devo.ps](http://docs.devo.ps/manual/tasks)
    
