echo "Connecting database"
echo "Enter the target version you want to deploy"
read TARGET_VERSION
echo "You want to deploy upto $TARGET_VERSION"
export PATH=$PATH:/usr/local/mysql/bin
source db.config
HOST=$host
USER=$user
CURRENT_DEVIATION=$(mysql -h $HOST -u $USER -p ApplyData -se "select version from ApplyData.DbHistory order by updated desc LIMIT 1")
if [ $? -eq "0"  ]
then

  search_dir=changes
  for entry in "$search_dir"/*.sql
  do
    #echo "$entry"
    #echo "${entry%.*}" | cut -d'/' -f 2
    
    FILE=${entry#*/} 
    FILE_VERSION=${FILE%.*}
    #echo "$FILE"
    #echo "$FILE_VERSION"
   #echo "$CURRENT_DEVIATION"
    
      if [ "$FILE_VERSION" -gt "$CURRENT_DEVIATION" ]
      then
       
        if [ "$FILE_VERSION" -gt "$TARGET_VERSION" ]
        then
          echo "$TARGET_VERSION is deployed ";
          break
        else
          echo "$FILE_VERSION==============Deployment Started===============";
          value=`cat $entry`
          ALTER_VALUE=$(mysql -h $HOST -u $USER -p ApplyData -se "$value")
          if [ $? -eq "0"  ]
          then
            echo $(mysql -h $HOST -u $USER -p ApplyData -se "Insert into ApplyData.DbHistory (version) values($FILE_VERSION)")
            echo "$FILE_VERSION==============Deployment Completed===============";
          else
            echo "$FILE_VERSION==============Error in changes command===============";
          fi
        fi
      else
        echo "$FILE_VERSION is already deployed";
      fi
    
    
  done
else
  echo "==============Error in mysql===============";
fi
 


