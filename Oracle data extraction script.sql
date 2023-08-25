CREATE OR REPLACE PROCEDURE FLEXCUBE3.file_write_loan_details
AS
   CURSOR c_data
   IS
      select column1,
      column2,
      column3,
      column4,
      column5
      from table_name
      where <condition>;



   v_file   UTL_FILE.FILE_TYPE;
BEGIN
   v_file :=
      UTL_FILE.FOPEN (location       => '<location>',
                      filename       => '<file_name>',
                      open_mode      => 'w',
                      max_linesize   => 32767);

   FOR cur_rec IN c_data
   LOOP
      UTL_FILE.PUT_LINE (
         v_file,
            cur_rec.column1
         || ','
         || cur_rec.column2
         || ','
         || cur_rec.column3
         || ','
         || cur_rec.column4
         || ','
         || cur_rec.column5);
   END LOOP;

   UTL_FILE.FCLOSE (v_file);
EXCEPTION
   WHEN OTHERS
   THEN
      UTL_FILE.FCLOSE (v_file);
      RAISE;
END;
/

#compile this procedure, and execute, data fetched by query will be saved in file at mentioned location.
