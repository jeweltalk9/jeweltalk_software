SELECT * FROM goldboxdb.tb_customer;
SELECT * FROM suraram.tb_customer where id in(247,292,317,655,1006,1014,1016,1083,1252,1334,1411);
SELECT * FROM goldboxdb.tb_customer where phone_number in(8897770192,127,9652501803,200,9912187242,316,9177626439,584,
9912745695,938,9908570012,93,8309949989,830,9618231815,405,9000541138,409,9908340435,390,7386433390,497);
SELECT * FROM suraram.tb_customer GROUP BY phone_number;

INSERT INTO goldboxdb.tb_customer (id,`name`,careof_name,address,phone_number,gst_number)
SELECT id,customer_name,'','',phone_number,gstin FROM suraram.tb_customer GROUP BY phone_number;

INSERT INTO goldboxdb.tb_fn_year
SELECT * FROM suraram.tb_fn_year;

SELECT * FROM goldboxdb.tb_salebill_dues;
INSERT INTO goldboxdb.tb_salebill_dues (`active`,fn_year,trans_date,vno,billno,`description`,due_amount,
payment_amount,sid,pay_mode,`status`,ts,tb_salebill_id,tb_customer_id,tb_users_id,tb_branch_id,tb_terminal_id)
SELECT true,'2023-24',due_date,0,0,'DUE CREATED',`balance`,0,0,'','CREATED',now(),tb_salebill_id,tb_customer_id,
1,1,1 FROM suraram.tb_bill_wise_due due
LEFT JOIN goldboxdb.tb_customer cu ON cu.id = due.tb_customer_id
where balance > 0 order by tb_customer_id;