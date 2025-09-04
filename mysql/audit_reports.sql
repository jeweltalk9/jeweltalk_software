-- Calculate total net amount per bill
WITH BillTotals AS (
    SELECT sr.tb_salebill_id,SUM(sr.net_amount) AS total_net_amount
    FROM ssj.tb_salebill_records sr
    GROUP BY sr.tb_salebill_id
),
-- Allocate payments to each item proportionally
ItemPayments AS (
    SELECT sr.trans_date,sr.tb_salebill_id,sb.billno,mp.mainproduct,sr.pcs,sr.net_amount,
        sb.cash * (sr.net_amount / bt.total_net_amount) AS allocated_cash,
        sb.card * (sr.net_amount / bt.total_net_amount) AS allocated_card
    FROM ssj.tb_salebill_records sr
    INNER JOIN ssj.tb_mainproduct mp ON mp.id = sr.tb_mainproduct_id
    INNER JOIN ssj.tb_salebill sb ON sb.id = sr.tb_salebill_id
    INNER JOIN BillTotals bt ON bt.tb_salebill_id = sr.tb_salebill_id
)

-- Final query to get the desired result
SELECT trans_date,tb_salebill_id,billno,mainproduct,pcs,net_amount,
    ROUND(allocated_cash, 2) AS cash,ROUND(allocated_card, 2) AS card
FROM ItemPayments WHERE tb_salebill_id BETWEEN 115 AND 119
ORDER BY tb_salebill_id;
