CREATE PROCEDURE `sp_show_products_orderby` (IN field CHAR(20), IN orderby CHAR(1))
BEGIN
	IF field <> '' THEN
		IF orderby = 0 THEN
			SET @products_order = concat('ORDER BY ', field, ' ASC');
		ELSEIF orderby = 1 THEN
			SET @products_order = concat('ORDER BY ', field, ' DESC');
		ELSE
			SET @products_order = '';
		END IF;
	ELSE
		SET @products_order = '';
	END IF;
    SET @consulta = concat('SELECT * FROM products ', products_order);
    PREPARE runSQL FROM @consulta;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;    
END


CREATE PROCEDURE `sp_log_loggin` (IN username CHAR(20), IN date_ocurred TIMESTAMP)
BEGIN
	IF username <> '' THEN
		INSERT INTO logs(action,`values`,date)VALUES('loggin', username,date_ocurred);
	END IF;
END
