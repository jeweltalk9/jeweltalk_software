-- Calculate total net amount per bill
WITH 
ItemPayments AS (
    SELECT sb.`trans_date`,`billno`,`name` as cust_name,`mainproduct`,`tagno`,`product_name`,`hsn_code`,`purity`,`huid`,`counter`,
    sb.`gst_no`,sb.`phone_no`,`pcs`,`gwt`,`swt`,`dia`,`nwt`,sr.`w_per`,sr.`mcpg`,sr.`dir_mc`,sr.`disc_per`,sr.`discount`,sr.`tax_amount`,
    sr.`gst_per`,sr.`gst_amount`,sr.`igst_amount`,sr.`net_amount`, ROUND(`cash` * (sr.`net_amount` / sb.`net_amount`),2) AS cash,
	ROUND(`card` * (sr.`net_amount` / sb.`net_amount`),2) AS card,ROUND(`online` * (sr.`net_amount` / sb.`net_amount`),2) AS transfer,
    ROUND(`cheque` * (sr.`net_amount` / sb.`net_amount`),2) AS cheque,ROUND(`due` * (sr.`net_amount` / sb.`net_amount`),2) AS due,
    ROUND(`advance` * (sr.`net_amount` / sb.`net_amount`),2) AS advance,ROUND(`scheme` * (sr.`net_amount` / sb.`net_amount`),2) AS scheme,
    ROUND(`cash_return` * (sr.`net_amount` / sb.`net_amount`),2) AS cash_return,
    ROUND(`old_sr_amount` * (sr.`net_amount` / sb.`net_amount`),2) AS metal_amount,
    CASE WHEN sb.gst_no = '' THEN phone_no ELSE sb.gst_no END AS gst_or_phone,
    CASE WHEN IF(LEFT(sb.gst_no, 2)='',LEFT(br.gstin, 2),LEFT(sb.gst_no, 2)) = LEFT(br.gstin, 2) THEN 'B2C' ELSE 'B2B' END AS bill_category
    FROM ssj.`tb_salebill_records` sr
    INNER JOIN ssj.`tb_mainproduct` mp ON mp.`id` = sr.`tb_mainproduct_id`
    INNER JOIN ssj.`tb_salebill` sb ON sb.`id` = sr.`tb_salebill_id`
    INNER JOIN ssj.`tb_product` pr ON pr.`id` = sr.`tb_product_id`
    INNER JOIN ssj.`tb_purity` pu ON pu.`id` = sr.`tb_purity_id`
    INNER JOIN ssj.`tb_hsn_code` hs ON hs.`id` = sr.`tb_hsn_code_id`
    INNER JOIN ssj.`tb_branch` br ON br.`id` = sb.`tb_branch_id`
)
-- Final query to get the desired result
SELECT trans_date,bill_category,billno,cust_name,gst_or_phone,mainproduct,tagno,
product_name,hsn_code,purity,huid,counter,pcs,gwt,swt,dia,nwt,w_per,mcpg,dir_mc,
disc_per,discount,tax_amount,gst_per,gst_amount,igst_amount,net_amount,cash,card,
transfer,cheque,due,advance,scheme,cash_return,metal_amount
FROM ItemPayments WHERE billno BETWEEN 115 AND 199
ORDER BY billno;
