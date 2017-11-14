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
* Runs local post-install scripts, not included in the Mango repository. Several examples are provided: 
  simple SQL files to populate classifiers  tables; PHP scripts to create complex Sugar objects 
  (Users, Accounts); shell scripts for other kinds of tasks (run the Sugar's cron script, f.e).
* Creates a backup copy of the existing instance (if any).
* Sets the current branch and commit hash as the version of the installed instance (by default it 
  is `999`, not quite a useful value). The version can be checked in the "About" page.
* Creates a Git repository into the installation directory (with the appropriate `.gitignore` list)
  and commits the initial status of the code.
* Displays the time needed by the main installation phases (`nusim` install, post-install processing,
  Git repo preparation) and the execution total time.


## Usage

1. Create a new directory and open a terminal window in it.
2. Run `composer init` and fill in the required values (package name, description, author, package type, license). You can leave "Minimum Stability" empty for now. Enter "no" when it asks about adding dependencies (`require` and `require-dev`). They cannot be added yet.
3. Run `composer config repositories.mill git https://github.com/sv-vv/sugarMill` to add the repository of the SugarMill package. It is not available on [Packagist](http://packagist.org) and `composer` needs to know where to find it on the `require` step.
4. Run `composer config bin-dir .` to let Composer link the binary exposed by SugarMill directly in the project directory.
5. Run `composer require sv-vv/sugar-mill "0.*"`. This step installs the package and prepares it for execution. It generates a shortcut named `.mill.sh` directly in the project director. This shortcut can be used to start the install of the Sugar instance. 
6. Copy `vendor/sv-vv/sugar-mill/config.sh.dist` as `./config.sh`
7. Edit `config.sh`; set/change the values to match your project and your setup (path of the customized Mango, path where to create the instance, database type/user/password/name).
8. Run `./mill.sh`

### Customization

Create the `post-install` subdirectory and write post-install action files in it.

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

Several simple examples for post-script actions are listed in the `vendor/sv-vv/sugar-mill/examples/` directory.
You can copy some of them in the `post-install/` directory and customize them to match your needs,
as a starter.



## Caveats

* It always uses the `config.sh` file present in the tool's home directory.
* It works <del>only</del> with Oracle (<ins>and MySQL since v0.4</ins>).
* The backups accumulate and continue to use disk space. You need to manually delete them from time
  to time or set a cron job to do it.


## Todo

* <del>Make it database type-agnostic. The current version works only with Oracle (it uses the sql*plus
  command line client to run the SQL files).</del> (added MySQL on v0.4)
* Create Composer scripts to create a sample `config.sh` and `post-install` scripts on installation.
* Make sure `config_override.php` already exists before appending to it. Create it otherwise. 
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
* Investigate adding examples that use `https://github.com/sugarcrmlabs/SystemData` to import teams,
  roles, users, teams membership and roles membership.
* <del>Put the configuration fixup into `config_override.php`.</del> (implemented in v0.3)


<!-- That's all, folks! -->
