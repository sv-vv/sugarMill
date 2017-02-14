# Developer installer (Nusim wrapper)

## Purpose

Provides an easy to use way to install a fresh Sugar instance for development. Avoid the repetitive
work to install and configure an instance and focus on the development.


## Features

* No command line arguments. All the needed values are loaded from a configuration file (`config.sh`).
* Runs `nusim install:developer` to install the instance using the the code from a Git repository
  (customized Mango).
* Moves the installed instance to a different directory (`nusim` uses a hardcoded way to compose 
  installation the path).
* Activates the developer mode in the installed instance.
* Runs post-install scripts. Several examples are provided: simple SQL files to populate classifiers 
  tables; PHP scripts to create complex Sugar objects (Users, Accounts); shell scripts for other kinds
  of tasks (run the Sugar's cron script, f.e).
* Creates a backup copy of the existing instance (if any).
* Sets the current branch and commit hash as the version of the installed instance (by default it 
  is `999`, not quite a useful value). The version can be checked in the "About" page.
* Creates a Git repository into the installation directory (with the appropriate `.gitignore` list)
  and commits the initial status of the code.
* Displays the time needed by the main installation phases (`nusim` install, post-install processing,
  Git repo preparation) and the execution total time.


## Usage

1. Copy `config.sh.dist` as `config.sh`
2. Edit `config.sh`, set/change the values to match your project and your setup (path of the customized
   Mango, path where to create the instance, database type/user/password/name).
3. Run `./setup.sh`

### Customization

Write post-install action files in the `post-install` directories.

The files from `post-install/` subdirectory are enumerated using the shell's `*` glob specifier
and are executed as follows:
* the files ending in `.sql` are imported in the database using the `$SQLPLUS` client program;
* the files ending in `.php` are copied in the root directory of the instance and executed from
there using the current PHP interpreter;
* the files ending in `.sh` are executed in the current shell environment (using `source`);
* any other files or directories present in the `post-install` directory are ignored
  
The PHP or shell scripts can store the files they handle directly in `post-install` (as long as they
do not fit in any of the above categories) or in subdirectories.
   
The shell returns the files in the alphabetical order. Starting the file name with a numerical 
prefix provides an easy way to put the files in the needed execution order.

Several simple examples for post-script actions are listed in the `examples/` directory. 
You can copy some of them in the `post-install/` directory and customize them to match your needs,
as a starter.



## Caveats

* It always uses the `config.sh` file present in the tool's home directory.
* It works only with Oracle now.
* The backups accumulate and continue to use disk space. You need to manually delete them from time
  to time or set a cron job to do it.


## Todo

* Make it database type-agnostic. The current version works only with Oracle (it uses the sql*plus
  command line client to run the SQL files).
* Make it receive the path of the configuration file in the command line.
* Allow overriding in the command line the options loaded from the configuration file.
* Make the moving of the instance to a new directory optional (currently the moving can be avoided by 
  using `CRM_PATH="/$INSTANCE/$FLAVOR"` in `config.sh`).
* Make the backup optional.
* Provide a configuration (a number of days) and remove the older backups to make room for a new installation. 
* Provide a way (configuration, command line switch?) to allow the installation when the Mango
  repository is not in a clean state (this is not quite a good idea!).
* Extract the path to the PHP interpreter into a variable and let it be configured in `config.sh`.
* Return consistent exit codes and document them.
* Add more sample post-install scripts.
* Investigate using `nusim instance:script:run` to run the PHP post-install scripts.
* Investigate adding examples that use `https://github.com/sugarcrmlabs/SystemData` to import teams,
  roles, users, teams membership and roles membership. 


<!-- That's all, folks! -->
