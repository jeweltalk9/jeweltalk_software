SELECT * FROM goldplus.tb_mainproduct;
SELECT * FROM goldboxdb.tb_mainproduct;
INSERT INTO goldboxdb.tb_mainproduct (id, mainproduct, `description`)
SELECT id, mainproduct, mainproduct FROM goldplus.tb_mainproduct;

SELECT * FROM goldplus.tb_category;
SELECT * FROM goldboxdb.tb_category;
INSERT INTO goldboxdb.tb_category (id,category, `tb_mainproduct_id`)
SELECT id, category_name, tb_mainproduct_id FROM goldplus.tb_category;

SELECT * FROM `goldplus`.`tb_model`;
SELECT * FROM `goldboxdb`.`tb_model`;
INSERT INTO `goldboxdb`.`tb_model` (id, model, `tb_mainproduct_id`)
SELECT id, model_name, tb_mainproduct_id FROM `goldplus`.`tb_model`;

SELECT * FROM `goldplus`.`tb_maincounter`;
SELECT * FROM `goldboxdb`.`tb_floor`;
INSERT INTO `goldboxdb`.`tb_maincounter` (id,maincounter, `description`)
SELECT id, floor_name, floor_name FROM `goldplus`.`tb_floor`;

SELECT * FROM `goldplus`.`tb_counter`;
SELECT * FROM `goldboxdb`.`tb_counter`;
INSERT INTO `goldboxdb`.`tb_counter` (id,counter,c_limit,sid, `tb_maincounter_id`)
SELECT id, counter_name, `limit`,secure,1 FROM `goldplus`.`tb_counter`;

SELECT * FROM `goldplus`.`tb_hsn_code`;
SELECT * FROM `goldboxdb`.`tb_hsn_code`;
INSERT INTO `goldboxdb`.`tb_hsn_code` (id, hsn_code, `description`,gst)
SELECT id, hsn_code,hsn_code, gst_per FROM `goldplus`.`tb_hsn_code`;

SELECT * FROM `goldplus`.`tb_purity`;
SELECT * FROM `goldboxdb`.`tb_purity`;
INSERT INTO `goldboxdb`.`tb_purity` (id, purity, `cal`,rate,ce,`visible`, `sort`,tb_mainproduct_id,mp_id)
SELECT id, purity,actual_purity, 6850,1,1,1,tb_mainproduct_id,tb_mainproduct_id FROM `goldplus`.`tb_purity`;

SELECT * FROM `goldplus`.`tb_product`;
SELECT * FROM `goldboxdb`.`tb_product`;
SET SQL_MODE=(SELECT REPLACE(@@SQL_MODE,'ONLY_FULL_GROUP_BY',''));
SELECT pr.id, short_name, product_name, 0,w_per,dir_w,mcpg,dir_mc,0,0,0,0,
tb_mainproduct_id,tb_category_id,pr.tb_purity_id,pr.tb_model_id,tb_counter_id,tb_hsn_code_id FROM goldplus.tb_wastages wa
INNER JOIN goldplus.tb_product pr ON pr.id = wa.tb_product_id
GROUP BY tb_product_id;
INSERT INTO `goldboxdb`.`tb_product` (id, product_code, product_name, pc,w_per,dir_w,mcpg,dir_mc,price,
discount,w_at_gwt,mc_at_gwt,tb_mainproduct_id,tb_category_id,tb_purity_id,tb_model_id,tb_counter_id,tb_hsn_code_id)
SELECT pr.id, short_name, product_name, 0,w_per,dir_w,mcpg,dir_mc,0,0,0,0,
tb_mainproduct_id,tb_category_id,pr.tb_purity_id,pr.tb_model_id,tb_counter_id,tb_hsn_code_id FROM goldplus.tb_wastages wa
INNER JOIN goldplus.tb_product pr ON pr.id = wa.tb_product_id
GROUP BY tb_product_id;

SELECT * FROM `goldplus`.`tb_dealer`;
SELECT * FROM `goldboxdb`.`tb_dealer`;
INSERT INTO `goldboxdb`.`tb_dealer` (`id`, `dealer_code`, `dealer_name`, `phone_number`, `company_name`, `address`,`gst_number`,`pan_number`) 
SELECT id,shortname,dealer_name,'','','','','' FROM `goldplus`.`tb_dealer`;

SELECT * FROM `goldplus`.`tb_terminal`;
SELECT * FROM `goldboxdb`.`tb_terminal`;
INSERT INTO `goldplus`.`tb_terminal` (`id`, `system_name`, `ts`, `branch_id`) 
VALUES (3, 'DESKTOP-N2F2AKP', now(), 1);

SELECT * FROM `goldboxdb`.`tb_stock_data`;
SELECT * FROM `goldplus`.`tb_tag_datails` where `active` = 1 and is_tray = 0;
SELECT * FROM `goldplus`.`tb_tag_datails` where `active` = 1 and is_tray = 0 and tb_dealer_id is null;
UPDATE `goldplus`.`tb_tag_datails` SET tb_dealer_id = 1 where `active` = 1 and is_tray = 0 and tb_dealer_id is null;

INSERT INTO `goldboxdb`.`tb_stock_data` (tag_id, pr_tag_id, `active`,is_pc,trans_date,qty,pcs,gwt,swt,dia,nwt,
w_per,dir_w,tot_w,mcpg,dir_mc,tot_mc,tounch,st_amount,pr_rate,pr_disc,pr_amount,pr_gst,pr_net_amount,huid1,huid2,
style_name,`description`,size,sid,sc,es,`status`,ts_i,ts_m,nwt2,w_per2,dir_w2,tot_w2,mcpg2,dir_mc2,tot_mc2,trans_date_less,
orderno,tb_mp_id2,tb_pu_id2,tb_lotno_id,img,tb_product_id,tb_mainproduct_id,tb_purity_id,tb_model_id,tb_counter_id,tb_dealer_id,
tb_hsn_code_id,tb_users_id,tb_terminal_id,tb_branch_id)

SELECT tag_id, 0, `active`,fixed_uom,trans_date,1,pcs,gwt,swt,0,nwt,w_per,dir_w,tot_w,mcpg,dir_mc,tot_mc,touch,stone_amount,
fixed_rate,0,fixed_total_amount,0,fixed_nettotal,'','',style,`description`,size,secure,0,0,`status`,created_on,
created_on,0,0,0,0,0,0,0,trans_date,0,0,0,0,null,tb_product_id,1,tb_purity_id,1,tb_counter_id,tb_dealer_id,
1,tb_user_uid,tb_terminal_ter_id,tb_branch_brid FROM `goldplus`.`tb_tag_datails` where `active` = 1 and is_tray = 0;

SELECT * FROM `goldplus`.`tb_stone_info`;
SELECT * FROM `goldboxdb`.`tb_stones`;
INSERT INTO `goldboxdb`.`tb_stones` (id,stone_code,stone_name,carets_rate, grams_rate,pcs_rate,cents_rate,dia)
SELECT id, stone_code, stone_name,cts_rate,gms_rate,pcs_rate,cent_rate,0 FROM `goldplus`.`tb_stone_info`;

SELECT * FROM `goldplus`.`tb_tag_stone_details`;
SELECT * FROM `goldboxdb`.`tb_stock_stone_data`;
SELECT * FROM `goldplus`.`tb_tag_stone_details` st
INNER JOIN goldplus.tb_tag_datails tag ON tag.id = st.tb_tag_datails_id
INNER JOIN goldplus.tb_stone_info inf ON inf.stone_code = st.stone_code
where `active`=1  and is_tray = 0;

INSERT INTO `goldboxdb`.`tb_stock_stone_data` (id, uom, `weight`,dia_ct, carets,grams,pcs,rate,amount,tb_stones_id,tag_id)
SELECT st.id,uom,st_wt,0,cts,gms,st_pcs,rate,amount,inf.id,tag_id FROM `goldplus`.`tb_tag_stone_details` st
INNER JOIN goldplus.tb_tag_datails tag ON tag.id = st.tb_tag_datails_id
INNER JOIN goldplus.tb_stone_info inf ON inf.stone_code = st.stone_code
where `active`= 1  and is_tray = 0;

UPDATE `goldboxdb`.`tb_stock_stone_data`  SET `uom` = 'Carets' WHERE `uom` = 'CTS';
UPDATE `goldboxdb`.`tb_stock_stone_data` SET `uom` = 'Grams' WHERE `uom` = 'GMS';
UPDATE `goldboxdb`.`tb_stock_stone_data`  SET `uom` = 'Pcs' WHERE `uom` = 'PCS';
UPDATE goldboxdb.tb_stock_data sd
INNER JOIN goldboxdb.tb_product pr ON pr.id = sd.tb_product_id
SET sd.tb_mainproduct_id = pr.tb_mainproduct_id, sd.tb_hsn_code_id = pr.tb_hsn_code_id;


