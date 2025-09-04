
SELECT * FROM goldboxdb.tb_scheme_collection where  term != 12 and bonus != 0;
UPDATE goldboxdb.tb_scheme_collection set bonus = 0 where  term != 12 and bonus != 0;

SELECT * FROM goldboxdb.tb_scheme_collection where amount != cash+card+advance+bonus+`online` and term = 12;
UPDATE goldboxdb.tb_scheme_collection set bonus = amount where amount != cash+card+advance+bonus+`online` and term = 12;

SELECT * FROM goldboxdb.tb_scheme_collection where amount != cash+card+advance+bonus+`online` and term != 12;
UPDATE goldboxdb.tb_scheme_collection set cash = amount where amount != cash+card+advance+bonus+`online` and term != 12;

SELECT * FROM goldboxdb.tb_scheme_payments where tb_scheme_collection_id = 3784;

SELECT * FROM goldboxdb.tb_scheme_collection sc
INNER JOIN goldboxdb.tb_scheme_payments sp ON sc.id = sp.tb_scheme_collection_id
where amount != cash+card+advance+bonus+`online` and term != 12;

UPDATE goldboxdb.tb_scheme_collection sc
JOIN goldboxdb.tb_scheme_payments sp ON sc.id = sp.tb_scheme_collection_id
SET 
  sc.cash = CASE WHEN sp.payment_mode = 'CASH' THEN sc.amount ELSE sc.cash END,
  sc.card = CASE WHEN sp.payment_mode = 'CARD' THEN sc.amount ELSE sc.card END,
  sc.`online` = CASE WHEN sp.payment_mode = 'UPI' THEN sc.amount ELSE sc.`online` END
where amount != cash+card+advance+bonus+`online` and term != 12;