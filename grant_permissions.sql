/***You can grant select, delete, update permissions to different users for different different tables
For example, if you you have a dblink created, you want that user to have only select permission on table customers, you can execute following script to 
provide grant permission***/
GRANT
  SELECT
ON
  schema.table_name
TO
  username;
