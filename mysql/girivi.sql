SELECT * FROM goldboxdb.tb_lenders;
INSERT INTO goldboxdb.tb_lenders (id, sno, lender_name, `description`)
SELECT id,id,bank_name,bank_name FROM aditya.tb_banks;
SELECT * FROM aditya.tb_fn_year;
SELECT * FROM goldboxdb.tb_fn_year;
INSERT INTO goldboxdb.tb_fn_year
SELECT * FROM aditya.tb_fn_year order by id desc;
SELECT * FROM aditya.tb_customer;
SELECT * FROM goldboxdb.tb_customer;
SET SQL_MODE=(SELECT REPLACE(@@SQL_MODE,'ONLY_FULL_GROUP_BY',''));
INSERT INTO goldboxdb.tb_customer (id,`name`,careof_name,address,phone_number,gst_number)
SELECT id,customer_name,'',address,phone_number,gstin FROM aditya.tb_customer group by phone_number;
SELECT * FROM aditya.tb_customer group by phone_number;


SELECT gi.id,`active`,fn_year,trans_date,vno,remarks,pcs,gwt,dwt,nwt,0,fwt,rate,amount,ts,
false,`status`,customer_name,cu.phone_number,cu.address,'',`reference`,co.id,tb_mainproduct_id
FROM aditya.tb_girivi gi
INNER JOIN aditya.tb_customer cu ON cu.id = gi.tb_customer_id
INNER JOIN goldboxdb.tb_customer co ON co.phone_number = cu.phone_number
order by gi.id;

INSERT INTO goldboxdb.`tb_girivi` (`id`,`active`,`fn_year`,`trans_date`,`billno`,`item_description`,
`pcs`,`gwt`,`dwt`,`nwt`,`tounch`,`fwt`,`rate`,`amount`,`ts`,`sid`,`status`,`customer_name`,
`phone_number`,`address`,`care_of`,`village`,`tb_customer_id`,`tb_mainproduct_id`)
SELECT gi.id,`active`,fn_year,trans_date,vno,remarks,pcs,gwt,dwt,nwt,0,fwt,rate,amount,ts,
false,`status`,customer_name,cu.phone_number,cu.address,'',`reference`,co.id,tb_mainproduct_id
FROM aditya.tb_girivi gi
INNER JOIN aditya.tb_customer cu ON cu.id = gi.tb_customer_id
INNER JOIN goldboxdb.tb_customer co ON co.phone_number = cu.phone_number
order by gi.id;