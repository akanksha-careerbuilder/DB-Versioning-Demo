# DB-Versioning-Demo
Demo repo for db versioning


## Folder Structure :-

Baseline folder contain all the current/latest database objects such as tables, procedure, functions, etc. So this represents the latest state of database.

Changes folder contain alter scripts for the changes made to database.

So any change made to database schema, will have to add an alter script for the corresponding change in changes folder.

The filename of alter scripts will have the verison number.

db.config file contain username and hostname of database and it will be stored on s3.

## How To Make Changes :-

Any developer making chnages to database will have to checkin an alter script for the corresponding change in changes folder.


## How To Deploy :

To deply run this command-
script/script.sh

## How To setUp database on localhost :

script/setUp.sh

## How To create file for an alter script :

script/createFile.sh


## How It works :

When we run deploy command, it will ask for target version upto which version we want to deploy. Then it will fetch last deployed version from DbHistory table (DbHistory table schema is in baseline/table folder) and then run all alter script from changes folder whose version greater than last deployed version to target version.