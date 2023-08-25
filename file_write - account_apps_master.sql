CREATE OR REPLACE PROCEDURE FLEXCUBE3.file_write_loan_details
AS
   CURSOR c_data
   IS
      select account_number loan_number,
      amount_financed loan_amount,
      book_date,
      maturity_date,
      dr_prOd_ac customer_number
      from flexcube3.cltb_account_apps_master
      where extract(year from VALUE_DATE) = '2019'
      and product_code = 'CDCF';



   v_file   UTL_FILE.FILE_TYPE;
BEGIN
   v_file :=
      UTL_FILE.FOPEN (location       => '/u01/',
                      filename       => 'loan_details.csv',
                      open_mode      => 'w',
                      max_linesize   => 32767);

   FOR cur_rec IN c_data
   LOOP
      UTL_FILE.PUT_LINE (
         v_file,
            cur_rec.LOAN_NUMBER
         || ','
         || cur_rec.LOAN_AMOUNT
         || ','
         || cur_rec.BOOK_DATE
         || ','
         || cur_rec.MATURITY_DATE
         || ','
         || cur_rec.CUSTOMER_NUMBER);
   END LOOP;

   UTL_FILE.FCLOSE (v_file);
EXCEPTION
   WHEN OTHERS
   THEN
      UTL_FILE.FCLOSE (v_file);
      RAISE;
END;
/
