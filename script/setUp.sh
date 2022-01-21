echo "Importimng database"
echo "Enter the database name you want to create"
read DATABASE_NAME
echo "Enter the mysql password"
read PASSWORD
echo "You want to create database - $DATABASE_NAME"
export PATH=$PATH:/usr/local/mysql/bin
source db.config
HOST=$host
USER=$user

DATABASE_CREATE=$(mysql -h $HOST -u $USER -p$PASSWORD -se "Create database $DATABASE_NAME")
if [ $? -eq "0"  ]
then

  baseline_dir=baseline
  for entry in "$baseline_dir"/*
  do
    echo "$entry"
    for subEntry in "$entry"/*.sql
    do
      echo "$subEntry"
      value=`cat "$subEntry"`
      ALTER_VALUE=$(mysql -h $HOST -u $USER -p$PASSWORD $DATABASE_NAME -se "$value")
      if [ $? -eq "0"  ]
      then
        echo "$subEntry==============Deployment Completed===============";
      else
        echo "$subEntry==============Error in script===============";
      fi
    done
    
  done
  changes_dir=changes
  for entry in "$changes_dir"/*
  do
    echo "$entry"
    value=`cat "$entry"`
    ALTER_VALUE=$(mysql -h $HOST -u $USER -p$PASSWORD $DATABASE_NAME -se "$value")
    if [ $? -eq "0"  ]
    then
      echo "$entry==============Deployment Completed===============";
    else
      echo "$entry==============Error in script===============";
    fi
    
  done
   
else
  echo "==============Error in mysql===============";
fi
 


