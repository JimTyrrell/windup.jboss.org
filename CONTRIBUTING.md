Hacking on the Windup site
=======================

Basic Steps
-----------

To contribute to the windup.jboss.org site, fork the windup repository to your own Git, clone your fork, commit your work on topic branches, and make pull requests. 

If you don't have the Git client (`git`), get it from: <http://git-scm.com/>

Here are the steps in detail:

1. [Fork](https://github.com/windup/windup.jboss.org/fork_select) the project. This creates a the project in your own Git.

2. Clone your fork. This creates a directory in your local file system.

        git clone git@github.com:<your-username>/windup.jboss.org.git

3. Add the remote `upstream` repository.

        git remote add upstream git@github.com:windup/windup.jboss.org.git

4. Get the latest files from the `upstream` repository.

        git fetch upstream

5. Import the docs

        git submodule init
        git submodule update

6. Create a new topic branch to contain your features, changes, or fixes.

        git checkout -b <topic-branch-name> upstream/master

7. Contribute new code or make changes to existing files. 

8. Commit your changes to your local topic branch. You must use `git add filename` for every file you create or change.

        git add <changed-filename>
        git commit -m `Description of change...`

9. Push your local topic branch to your github forked repository. This will create a branch on your Git fork repository with the same name as your local topic branch name.

        git push origin HEAD            

10. Browse to the <topic-branch-name> branch on your forked Git repository and [open a Pull Request](http://help.github.com/send-pull-requests/). Give it a clear title and description.


Setup your environment
----------------------

The Windup site is built using [awestruct](http://awestruct.org/), and requires a number of gems.

To setup the environment you need to follow these steps. *Certify to use the correct versions*.


1. Install Ruby *1.9.X*

    We recommend using [RVM](rvm.io), and not your platform provided ruby

2. Install bundler
  
    gem install bundler

3. Install Ruby GEMs

    bundle setup       
    
Documentation
-------------

The documentation is stored in a separate repository, which is imported as a git submodule. To contribute to the documentation, visit https://github.com/windup/windup-documentation. To update the documentation on the site to the latest version, run
    
    git submodule update
    


Running the site locally
------------------------

Having got your environment correctly set up, on windup.jboss.org root, run:

      bundle exec awestruct -d

to run awestruct in development mode, and serve the site at <http://localhost:4242>.

Staging changes
---------------

1. Contact the project lead, and ask for access to `filemgmt.jboss.org`. 

2. Run `./publish.sh -s`

3. The site will be available at <http://windup.jboss.org/jdf/staging>, which use for staging changes to the site. Stage is normally reserved for verifying minor updates to the site, or for final verification before a major update. 


Publishing on Production
------------------------

1. Make sure you have `Sendmail` installed and running. Sendmail will be used to send mail notifications.

 On Linux you can install sendmail running: `sudo yum install sendmail`.

2. Contact the project lead, and ask for access to `filemgmt.jboss.org`.

3. Update the site version on `_config/site.yml' - 

4. Run `./publish.sh -p`

5. The site will be available at <http://windup.jboss.org>, the production site.

_NOTE_: You can also run: 

    ./release.sh -s <old snapshot version> -r <release version>

This will update the version number (step 3), commit and tag and publish the site to <http://jboss.org/jdf> (step 4). Then it will reset the version number back to the snapshot version number.


