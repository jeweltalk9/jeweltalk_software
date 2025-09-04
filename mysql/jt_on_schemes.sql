SELECT * FROM goldboxdb.tb_customer;
SET SQL_MODE=(SELECT REPLACE(@@SQL_MODE,'ONLY_FULL_GROUP_BY',''));
SELECT id, customer_name, '', address, phone_number, gstin FROM goldplus.tb_customer where id > 100 group by phone_number order by id;
INSERT INTO goldboxdb.tb_customer (id,`name`, careof_name, address, phone_number, gst_number) 
SELECT id, customer_name, '', address, phone_number, gstin FROM goldplus.tb_customer where id > 100 group by phone_number order by id;

SELECT * FROM goldboxdb.tb_scheme_members;

SELECT * FROM goldplus.tb_scheme_members sm
INNER JOIN goldplus.tb_scheme_name sn ON sn.id = sm.tb_scheme_name_id
WHERE `active` = 1 ORDER BY memberID;

SELECT sm.id,`active`,sm.trans_date,memberID,0,rc,terms,0,monthly_amount,
sm.`status`,'','',sm.`on`,sm.`on`,tb_purity_id,null,1,tb_customer_id,sm.tb_user_uid,1,
sm.tb_terminal_ter_id  FROM goldplus.tb_scheme_members sm
INNER JOIN goldplus.tb_scheme_name sn ON sn.id = sm.tb_scheme_name_id
WHERE `active` = 1 ORDER BY memberID;

INSERT INTO `goldboxdb`.`tb_scheme_members` (`id`,`active`,`trans_date`,`mid`,`claim_billno`,
`plan_type`,`terms`,`paid_term`,`plan_amount`,`status`,`sm_name`,`cust_name`,`ts`,`ts_close`,
`tb_purity_id`,`tb_salebill_id`,`tb_scheme_id`,`tb_customer_id`,`tb_users_id`,`tb_branch_id`,
`tb_terminal_id`) SELECT sm.id,`active`,sm.trans_date,memberID,0,rc,terms,0,monthly_amount,
sm.`status`,'','',sm.`on`,sm.`on`,tb_purity_id,null,1,tb_customer_id,sm.tb_user_uid,1,
sm.tb_terminal_ter_id  FROM goldplus.tb_scheme_members sm
INNER JOIN goldplus.tb_scheme_name sn ON sn.id = sm.tb_scheme_name_id
WHERE `active` = 1 ORDER BY memberID;
SELECT * FROM goldplus.tb_scheme_members sm
INNER JOIN goldplus.tb_customer cu on cu.id = sm.tb_customer_id
where `active` = 1;
SELECT * FROM goldboxdb.tb_scheme_members sm
INNER JOIN goldboxdb.tb_customer cu ON cu.id = sm.tb_customer_id
INNER JOIN goldplus.tb_customer ocu on ocu.phone_number = cu.phone_number;
UPDATE goldboxdb.tb_scheme_members sm
INNER JOIN goldboxdb.tb_customer cu ON cu.id = sm.tb_customer_id
INNER JOIN goldplus.tb_customer ocu on ocu.phone_number = cu.phone_number
SET cust_name = customer_name;
SET cust_name = customer_name;
SET cust_name = customer_name;
SET cust_name = customer_name;
SET cust_name = customer_name;
SET cust_name = customer_name;
SET cust_name = customer_name;