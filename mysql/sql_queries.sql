INSERT INTO `jtdb`.`tb_tagid_gen` (`id`, `active`, `description`, `changeable`, `next_tag_id`) VALUES (1, 1, 'GENRAL TAG', 0, '1');
INSERT INTO `jtdb`.`tb_tagid_gen` (`id`, `active`, `description`, `changeable`, `next_tag_id`) VALUES (2, 0, 'REPEAT TAG', 0, 1);
INSERT INTO `jtdb`.`tb_tagid_gen` (`id`, `active`, `description`, `changeable`, `next_tag_id`) VALUES (3, 0, 'DATE TAG', 0, '240401001');
INSERT INTO `jtdb`.`tb_tagid_gen` (`id`, `active`, `description`, `changeable`, `next_tag_id`) VALUES (4, 0, 'YEAR TAG', 0, '202409891');

UPDATE goldboxdb.tb_stock_data s
JOIN (SELECT tag_id, SUM(amount) AS total_amount 
FROM goldboxdb.tb_stock_stone_data GROUP BY tag_id) t 
ON s.tag_id = t.tag_id
SET s.st_amount = t.total_amount;