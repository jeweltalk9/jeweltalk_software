SELECT * FROM goldplus.tb_salebill;
SELECT * FROM goldboxdb.tb_salebill;
INSERT INTO `goldboxdb`.`tb_salebill`
(`id`,`active`,`fn_year`,`trans_date`,`billno`,`qty`,`gross_wt`,`stone_wt`,`dia_ct`,`gold_wt`,`silver_wt`,`platinum_wt`,`avg_rate`,
`metal_amount`,`va_amount`,`mc_amount`,`st_amount`,`hm_amount`,`amount`,`disc_per`,`discount`,`tax_amount`,`avg_gst_per`,`gst_amount`,
`igst_amount`,`net_amount`,`anet_amount`,`cash`,`card`,`online`,`cheque`,`advance`,`due`,`scheme`,`bonus`,`cash_return`,`old_sr_amount`,
`old_gold_wt`,`old_silver_wt`,`old_platinum_wt`,`sr_gold_wt`,`sr_silver_wt`,`sr_platinum_wt`,`description`,`name`,`phone_no`,`gst_no`,
`sid`,`ts`,`status`,`sm_name`,`cust_id`,`tb_mainproduct_id`,`tb_users_id`,`tb_terminal_id`,`tb_branch_id`)
SELECT id,`active`,fn_year,trans_date,billno,tot_pcs,tot_gwt,tot_swt,0,IF(mainproduct='GOLD',tot_gwt,0),IF(mainproduct='SILVER',tot_gwt,0),0,
metal_rate,0,0,total_mc,tot_st_amt,tot_hm_price,amount,0,disc,tot_taxable,0,tot_gst,0,net_amount,net_amount,`cash`,`card`,`online`,`cheque`,
`advance`,`due`,`scheme`,`bonus`,`cash_return`,pur_gold_amt+pur_silver_amt,pur_gold_wt,pur_silver_wt,0,0,0,0,priter_details,customer_name,
customer_phone,cust_gstin,sid,ts,'Created','',1,tb_mainproduct_id,tb_user_uid,tb_terminal_ter_id,1 FROM goldplus.tb_salebill;

SELECT * FROM goldplus.tb_salebill_records where tag_number = '';
SELECT * FROM goldplus.tb_salebill_records where tb_dealer_id is null;
UPDATE goldplus.tb_salebill_records set tb_dealer_id = 1 where tb_dealer_id is null;
SELECT * FROM goldplus.tb_salebill_records;
SELECT * FROM goldboxdb.tb_salebill_records;
INSERT INTO `goldboxdb`.`tb_salebill_records`
(`id`,`active`,`trans_date`,`tagno`,`pcs`,`gwt`,`swt`,`dia`,`nwt`,`rate`,`w_per`,`dir_w`,`tot_w`,`w_amount`,`mcpg`,`dir_mc`,`tot_mc`,`st_amount`,
`nwt2`,`rate2`,`w_per2`,`dir_w2`,`tot_w2`,`w_amount2`,`mcpg2`,`dir_mc2`,`tot_mc2`,`amount`,`disc_per`,`discount`,`tax_amount`,`gst_per`,`gst_amount`,
`igst_amount`,`net_amount`,`anet_amount`,`huid`,`size`,`counter`,`style`,`description`,`mp_id2`,`pu_id2`,`sm_id`,`other_id`,`cust_id`,`sid`,`ts`,
`is_pc`,`is_tray`,`hm_amount`,`tb_model_id`,`tb_hsn_code_id`,`tb_purity_id`,`tb_product_id`,`tb_mainproduct_id`,`tb_dealer_id`,`tb_salebill_id`)
SELECT id,`active`,`trans_date`,`tag_number`,`pcs`,`gwt`,`swt`,0,`nwt`,`rate`,`w_per`,0,`tot_w`,ROUND(`tot_w`*rate,2),`mcpg`,0,`tot_mc`,`stone_amount`,
0,0,0,0,0,0,0,0,0,`pamount`,0,pamount-pfamount,pfamount,3,p_nt_famount-pfamount,0,p_nt_famount,p_nt_famount,huid,'',counter,purity,'',
0,0,sm_name,0,0,0,now(),0,0,hm_price,1,1,1,tb_product_id,1,tb_dealer_id,tb_salebill_id FROM goldplus.tb_salebill_records;

SELECT * FROM `goldboxdb`.`tb_salebill_records` sr
INNER JOIN `goldboxdb`.`tb_purity` pu ON pu.purity = sr.style;

UPDATE `goldboxdb`.`tb_salebill_records` sr
INNER JOIN `goldboxdb`.`tb_purity` pu ON pu.purity = sr.style
SET sr.tb_purity_id = pu.id;


SELECT * FROM `goldboxdb`.`tb_salebill_records` sr
INNER JOIN `goldboxdb`.`tb_product` pr ON pr.id = sr.tb_product_id;

UPDATE `goldboxdb`.`tb_salebill_records` sr
INNER JOIN `goldboxdb`.`tb_product` pr ON pr.id = sr.tb_product_id
SET sr.tb_mainproduct_id = pr.tb_mainproduct_id, sr.tb_hsn_code_id = pr.tb_hsn_code_id;