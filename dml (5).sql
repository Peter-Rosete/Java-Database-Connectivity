/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_due_date` AFTER UPDATE ON `checked_out` FOR EACH ROW begin    
    DECLARE cus_id int unsigned DEFAULT 0;
    DECLARE br_id int unsigned DEFAULT 0;
    if old.date_due!=new.date_due then
		set cus_id = (select record_id from cus_record where cus_record.patron_id=patron_id and cus_record.book_isbn=book_isbn and cus_record.copy_id=copy_id and cr_date_due=old.date_due limit 1);
		set br_id = (select record_id from book_record where book_record.patron_id=patron_id and book_record.copy_id=copy_id limit 1);
		update cus_record set cr_date_due=new.date_due where cus_record.record_id=cus_id;
		update book_record set br_date_due=new.date_due where book_record.record_id=br_id;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_waitlist` AFTER UPDATE ON `checked_out` FOR EACH ROW begin    
    DECLARE cus_id int unsigned DEFAULT 0;
    DECLARE br_id int unsigned DEFAULT 0;
    if old.date_due!=new.date_due then
		set cus_id = (select record_id from cus_record where cus_record.patron_id=patron_id and cus_record.book_isbn=book_isbn and cus_record.copy_id=copy_id and cr_date_due=old.date_due limit 1);
		set br_id = (select record_id from book_record where book_record.patron_id=patron_id and book_record.copy_id=copy_id limit 1);
		update cus_record set cr_date_due=new.date_due where cus_record.record_id=cus_id;
		update book_record set br_date_due=new.date_due where book_record.record_id=br_id;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_fees_when_rtn_ovrdue` AFTER DELETE ON `overdue_book` FOR EACH ROW begin    
    DECLARE cus_id int unsigned DEFAULT 1;
    DECLARE new_fee_id int unsigned DEFAULT 1;
    DECLARE return_date date;
    DECLARE cur_fee float default 0;
	DECLARE fee_per_day float default 0.1;
    
    select record_id, cr_date_returned from cus_record where cus_record.patron_id=old.patron_id and cus_record.book_isbn=old.book_isbn and cus_record.copy_id=old.copy_id and cus_record.cr_date_due=old.date_due limit 1 into cus_id, return_date;
	set cur_fee = datediff(return_date, old.date_due)*fee_per_day;
	set new_fee_id = (select fee_id from fee where fee.patron_id=old.patron_id and fee.book_isbn=old.book_isbn and fee.copy_id=old.copy_id and fee.fee_date_due=old.date_due limit 1);
	if not(cur_fee<=>null) then
		update cus_record set cr_fees=cur_fee where cus_record.record_id=cus_id;
		update fee set fee_fees=cur_fee where fee.fee_id=new_fee_id;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkout_book`(patron_num int unsigned, isbn bigint unsigned, copy int unsigned, check_out_date date)
begin
    DECLARE due_date date DEFAULT "1900-01-01";
    DECLARE state_book varchar(50) DEFAULT "-1";
	if (select count(patron_id) from patron where patron_id=patron_num) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Patron does not exist';
		rollback;
    elseif (select count(book_isbn) from book where book_isbn=isbn) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book does not exist';
		rollback;
	elseif (select count(copy_id) from book_copies where copy_id=copy and book_isbn=isbn) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book copy does not exist';
		rollback;
    elseif (select copy_available from book_copies where book_isbn=isbn and copy_id=copy) is false then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book copy not available';
		rollback;    
	elseif (Select count(*) from hold where patron_id!=patron_num and book_isbn=isbn and copy_id=copy) != 0 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'This copy has a hold';
		rollback;
	elseif (Select count(patron_id) from checked_out where patron_id=patron_num) >= 3 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Too many books checked out';
		rollback;
	else
		if not((select br_book_state from book_record where copy_id=copy order by br_date_returned desc limit 1) <=> null) then
			set state_book = (select br_book_state from book_record where copy_id=copy order by br_date_returned desc limit 1);
		else
			set state_book = "Excellent";
		end if;
        update book_copies set copy_available = false where book_isbn=isbn and copy_id=copy;
        set due_date = date_add(check_out_date, INTERVAL 21 DAY);
        INSERT INTO `library_system`.`checked_out`
		(`patron_id`,`book_isbn`,`copy_id`,`date_checked_out`,`date_due`,`renewed_available`)
		VALUES
        (patron_num, isbn, copy, check_out_date, due_date, 1);
        INSERT INTO `library_system`.`cus_record`
		(`patron_id`,`book_isbn`,`copy_id`,`cr_date_checked_out`,`cr_date_due`, `cr_book_state`)
		VALUES
        (patron_num, isbn, copy, check_out_date, due_date, state_book);
        INSERT INTO `library_system`.`book_record`
		(`patron_id`,`copy_id`,`br_date_checked_out`,`br_date_due`,`br_book_state`)
		VALUES
		(patron_num, copy, check_out_date, due_date, state_book);
        if (Select count(*) from hold where patron_id=patron_num and book_isbn=isbn and copy_id=copy) != 0 then
			delete from hold where patron_id=patron_num and book_isbn=isbn and copy_id=copy;
		end if;
        commit;
    end if;    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hold_book`(patron_num int unsigned, isbn bigint unsigned, copy int unsigned, hold_date datetime, pickup_loc int unsigned)
begin
	call update_hold();
	if (select count(patron_id) from patron where patron_id=patron_num) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Patron does not exist';
		rollback;
    elseif (select count(book_isbn) from book where book_isbn=isbn) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book does not exist';
		rollback;
	elseif (select count(copy_id) from book_copies where copy_id=copy and book_isbn=isbn) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book copy does not exist';
		rollback;
	elseif (select count(hold_join_date) from hold where patron_id=patron_num and copy_id=copy and book_isbn=isbn) > 0 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Patron already has hold';
		rollback;
    elseif (select copy_available from book_copies where book_isbn=isbn and copy_id=copy) is false or 
    (Select count(hold_join_date) from hold where book_isbn=isbn and copy_id=copy) > 0 then
		call waitlist_book(patron_num, isbn, hold_date, pickup_loc);
	else
        INSERT INTO `library_system`.`hold`
		(`patron_id`,`book_isbn`,`copy_id`,`hold_join_date`,`hold_pickup_loc`)
		VALUES
		(patron_num, isbn, copy, hold_date, pickup_loc);
        commit;
    end if;    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pay_fees`(patron_num int unsigned, input_amount float, out money_back float)
begin
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
DECLARE cur_fee_id int unsigned;
DECLARE check_out date;
DECLARE due_date date;
DECLARE renew int;
DECLARE fee float;
DECLARE fee_per_day float default 0.1;
DECLARE cus_id int unsigned;

select count(*) from fee where patron_id=patron_num INTO n;
SET i=0;
WHILE i<n DO 
	select fee_id, fee_fees from fee where patron_id=patron_num limit 1 into cur_fee_id, fee;
    if input_amount = 0 then
		set i = n;
    elseif fee>input_amount then
		UPDATE `library_system`.`fee`
			SET
			`fee_fees` = round(fee - input_amount, 2)
			WHERE `fee_id` = cur_fee_id;
		set input_amount = 0.0;
	elseif input_amount>fee then
		delete from fee where fee_id=cur_fee_id;
        set input_amount = round(input_amount - fee, 2);
	end if;
	SET i = i + 1;
END WHILE;
set money_back = round(input_amount, 2);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `renew_book`(patron_num int unsigned, isbn bigint unsigned, copy int unsigned)
begin
    DECLARE id int unsigned DEFAULT 0;
    DECLARE renew int DEFAULT 0;
    DECLARE due_date date DEFAULT "1900-01-01";
    DECLARE prev_due_date date DEFAULT "1900-01-01";
	if (select count(patron_id) from patron where patron_id=patron_num) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Patron does not exist';
		rollback;
    elseif (select count(book_isbn) from book where book_isbn=isbn) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book does not exist';
		rollback;
	elseif (select count(copy_id) from book_copies where copy_id=copy and book_isbn=isbn) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book copy does not exist';
		rollback;
    elseif (select count(checked_out_id) from checked_out where patron_id=patron_num and book_isbn=isbn and copy_id=copy) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book copy not checked out';
		rollback;
	elseif (select renewed_available from checked_out where patron_id=patron_num and book_isbn=isbn and copy_id=copy) <= 0 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'No available renewals';
		rollback;
	else
		set id = (select checked_out_id from checked_out where patron_id=patron_num and book_isbn=isbn and copy_id=copy);
        set prev_due_date = (select date_due from checked_out where patron_id=patron_num and book_isbn=isbn and copy_id=copy);
		set due_date = date_add(prev_due_date, INTERVAL 21 DAY);
        set renew = (select (renewed_available-1) from checked_out where patron_id=patron_num and book_isbn=isbn and copy_id=copy);
		UPDATE `library_system`.`checked_out`
		SET
		`date_due` = due_date,
		`renewed_available` = renew
		WHERE `checked_out_id` = id;
        commit;
    end if;    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `return_book`(patron_num int unsigned, isbn bigint unsigned, copy int unsigned, return_date date, book_state varchar(50))
begin
    DECLARE br_id int unsigned DEFAULT 0;
    DECLARE cus_id int unsigned DEFAULT 0;
    DECLARE co_id int unsigned DEFAULT 0;
    DECLARE od_id int unsigned DEFAULT 0;
    DECLARE check_date date DEFAULT "1900-1-1";
    DECLARE due_date date DEFAULT "1900-1-1";
	if (select count(patron_id) from patron where patron_id=patron_num) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Patron does not exist';
		rollback;
    elseif (select count(book_isbn) from book where book_isbn=isbn) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book does not exist';
		rollback;
	elseif (select count(copy_id) from book_copies where copy_id=copy and book_isbn=isbn) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book copy does not exist';
		rollback;
    elseif (select count(checked_out_id) from checked_out where patron_id=patron_num and book_isbn=isbn and copy_id=copy) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book copy not checked out';
		rollback;
	else		
        update book_copies set copy_available = true where book_isbn=isbn and copy_id=copy;
		set br_id = (select record_id from book_record where patron_id=patron_num and copy_id=copy and br_date_returned<=>null limit 1);
		if return_date>(select date_due from checked_out where patron_id=patron_num and book_isbn=isbn and copy_id=copy limit 1) then
			set od_id = (select overdue_id from overdue_book where patron_id=patron_num and book_isbn=isbn and copy_id=copy limit 1);
        end if;
        UPDATE `library_system`.`book_record`
		SET
		`br_date_returned` = return_date,
        `br_book_state` = book_state
		WHERE `record_id` = br_id;
        set check_date = (select br_date_checked_out from book_record where patron_id=patron_num and copy_id=copy limit 1);
        set due_date = (select br_date_due from book_record where patron_id=patron_num and copy_id=copy limit 1);
        set cus_id = (select record_id from cus_record where patron_id=patron_num and book_isbn=isbn and copy_id=copy and br_id=record_id and cr_date_returned<=>null limit 1);
        UPDATE `library_system`.`cus_record`
		SET
		`cr_date_returned` = return_date,
		`cr_book_state` = book_state
		WHERE `record_id` = cus_id;
        set co_id = (select checked_out_id from checked_out where patron_id=patron_num and book_isbn=isbn and copy_id=copy limit 1);
        delete from checked_out where checked_out_id=co_id;
        if not(od_id<=>null) then
			delete from overdue_book where overdue_id=od_id;
		end if;
        call update_hold();
        commit;
    end if;    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_hold`()
begin
	DECLARE n INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	DECLARE patron_num int unsigned;
	DECLARE isbn bigint unsigned;
	DECLARE copy int unsigned;
	DECLARE join_date datetime;
	DECLARE pickup_loc int unsigned;
	DECLARE end_datetime datetime;
    declare group_list varchar(100);
    
    select count(datediff(now(), hold_join_date)>21) from hold into n;
	SET i=0;
	WHILE i<n DO 
		select patron_id, book_isbn, copy_id from hold where datediff(now(), hold_join_date)>21 limit 1 into patron_num, isbn, copy;
        delete from hold where patron_id=patron_num and book_isbn=isbn and copy_id=copy;
		set i = i + 1;
	end while;
    select count(book_isbn) from waitlist INTO n;
	SET i=0;
	WHILE i<n DO 
		select group_concat(copy_id) from hold where book_isbn=isbn into group_list;
        if group_list = "" then
			set group_list = null;
		end if;
		if (select count(waitlist_pickup_loc) from waitlist where book_isbn=(select book_isbn from waitlist group by book_isbn limit 1) order by waitlist_join_datetime asc limit 1) != 0 then
            select patron_id, book_isbn, waitlist_join_datetime, waitlist_pickup_loc from waitlist where book_isbn=(select book_isbn from waitlist group by book_isbn limit 1) order by waitlist_join_datetime asc limit 1 into patron_num, isbn, join_date, pickup_loc;
            if not((select copy_id from book_copies where book_isbn=isbn and copy_available=true and copy_loc=pickup_loc and copy_id not in (group_list) limit 1)<=>null) then 
				select copy_id from book_copies where book_isbn=isbn and copy_available=true and copy_loc=pickup_loc and copy_id not in (group_list) limit 1 into copy;
			elseif not((select copy_id from book_copies where book_isbn=isbn and copy_available=true and copy_id not in (group_list) limit 1)<=>null) then
                select copy_id from book_copies where book_isbn=isbn and copy_available=true and copy_id not in (group_list) limit 1 into copy;
			elseif not((select copy_id from book_copies where book_isbn=isbn and copy_available=true and copy_loc=pickup_loc and not (copy_id<=>(group_list)) limit 1)<=>null) then 
				select copy_id from book_copies where book_isbn=isbn and copy_available=true and copy_loc=pickup_loc and not (copy_id<=>(group_list)) limit 1 into copy;
            elseif not((select copy_id from book_copies where book_isbn=isbn and copy_available=true and not(copy_id<=>(group_list)) limit 1)<=>null) then
                select copy_id from book_copies where book_isbn=isbn and copy_available=true and not(copy_id<=>(group_list)) limit 1 into copy;
			end if;
			if not(copy<=>null) then
				if (select count(*) from hold where book_isbn=isbn and copy_id=copy) = 0 then
					INSERT INTO `library_system`.`hold`
					(`patron_id`,`book_isbn`,`copy_id`,`hold_join_date`,`hold_pickup_loc`)
					VALUES
					(patron_num, isbn, copy, now(), pickup_loc);
					delete from waitlist where patron_id=patron_num and book_isbn=isbn and waitlist_join_datetime=join_date;
					if (select count(book_isbn) from waitlist where book_isbn=isbn) > 0 then
						set i = i - 1;
					end if;
					commit;
				end if;
			end if;
        end if;
		SET i = i + 1;
	END WHILE;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_late_books`()
begin
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
DECLARE patron_num int unsigned;
DECLARE isbn bigint unsigned;
DECLARE copy int unsigned;
DECLARE check_out date;
DECLARE due_date date;
DECLARE renew int;
DECLARE fee float;
DECLARE fee_per_day float default 0.1;
DECLARE cus_id int unsigned;

select count(*) from checked_out where date_due<current_date() and renewed_available>0 INTO n;
SET i=0;
WHILE i<n DO 
	select patron_id, book_isbn, copy_id from checked_out where date_due<current_date() and renewed_available>0 limit 1 into patron_num, isbn, copy;
    CALL renew_book(patron_num, isbn, copy);
	SET i = i + 1;
END WHILE;
select count(*) from checked_out where date_due<current_date() and renewed_available=0 INTO n;
SET i=0;
WHILE i<n DO 
	select patron_id, book_isbn, copy_id, date_checked_out, date_due, renewed_available from checked_out where date_due<current_date() and renewed_available=0 limit i,1 into patron_num, isbn, copy, check_out, due_date, renew;
	select datediff(current_date, date_due)*fee_per_day from checked_out where date_due<current_date() and renewed_available=0 limit i,1 into fee;
    if (select overdue_id from overdue_book where patron_id=patron_num and book_isbn=isbn)<=>null then
		INSERT INTO `library_system`.`overdue_book`
		(`patron_id`,`book_isbn`,`copy_id`,`date_checked_out`,`date_due`,`renewed_available`)
		VALUES
		(patron_num, isbn, copy, check_out, due_date, renew);
        INSERT INTO `library_system`.`fee`
		(`patron_id`,`book_isbn`,`copy_id`,`fee_date_checked_out`,`fee_date_due`,`fee_fees`)
		VALUES
		(patron_num, isbn, copy, check_out, due_date, fee);
        select record_id from cus_record where patron_id=patron_num and book_isbn=isbn and copy_id=copy and cr_date_returned<=>null into cus_id;
        UPDATE `library_system`.`cus_record`
		SET
		`cr_fees` = fee
		WHERE `record_id` = cus_id;
    end if;    
	SET i = i + 1;
END WHILE;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `waitlist_book`(patron_num int unsigned, isbn bigint unsigned, hold_date datetime, pickup_loc int unsigned)
begin
	if (select count(patron_id) from patron where patron_id=patron_num) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Patron does not exist';
		rollback;
    elseif (select count(book_isbn) from book where book_isbn=isbn) != 1 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Book does not exist';
		rollback;
	elseif (select count(waitlist_join_datetime) from waitlist where patron_id=patron_num and book_isbn=isbn) != 0 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Patron already has a wait for this book';
		rollback;
	elseif (select count(copy_id) from checked_out where patron_id=patron_num and book_isbn=isbn) != 0 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Patron already has book checked out';
		rollback;
	else
        INSERT INTO `library_system`.`waitlist`
		(`patron_id`,`book_isbn`,`waitlist_join_datetime`,`waitlist_pickup_loc`)
		VALUES
		(patron_num, isbn, hold_date, pickup_loc);
        commit;
        call update_hold();
    end if;    
end ;;
DELIMITER ;

--
-- Final view structure for view `patron_checked_out`
--

/*!50001 DROP VIEW IF EXISTS `patron_checked_out`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patron_checked_out` AS select `patron`.`patron_id` AS `patron_id`,`patron`.`patron_fname` AS `patron_fname`,`patron`.`patron_lname` AS `patron_lname`,`book`.`book_title` AS `book_title`,`author`.`author_fname` AS `author_fname`,`author`.`author_lname` AS `author_lname`,`checked_out`.`book_isbn` AS `book_isbn`,`checked_out`.`copy_id` AS `copy_id`,`checked_out`.`date_checked_out` AS `date_checked_out`,`checked_out`.`date_due` AS `date_due`,`checked_out`.`renewed_available` AS `renewed_available` from (((`checked_out` join `patron` on((`checked_out`.`patron_id` = `patron`.`patron_id`))) join `book` on((`checked_out`.`book_isbn` = `book`.`book_isbn`))) join `author` on((`book`.`book_author_id` = `author`.`author_id`))) order by `checked_out`.`date_due` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patron_fees_owed`
--

/*!50001 DROP VIEW IF EXISTS `patron_fees_owed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patron_fees_owed` AS select `patron`.`patron_id` AS `patron_id`,`patron`.`patron_fname` AS `patron_fname`,`patron`.`patron_lname` AS `patron_lname`,round(sum(`fee`.`fee_fees`),2) AS `Total Fees Owed` from (`fee` join `patron` on((`fee`.`patron_id` = `patron`.`patron_id`))) group by `patron`.`patron_id` order by `patron`.`patron_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patron_fees_owed_detail`
--

/*!50001 DROP VIEW IF EXISTS `patron_fees_owed_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patron_fees_owed_detail` AS select `patron`.`patron_id` AS `patron_id`,`patron`.`patron_fname` AS `patron_fname`,`patron`.`patron_lname` AS `patron_lname`,`book`.`book_title` AS `book_title`,`author`.`author_fname` AS `author_fname`,`author`.`author_lname` AS `author_lname`,`fee`.`book_isbn` AS `book_isbn`,`fee`.`copy_id` AS `copy_id`,`fee`.`fee_date_checked_out` AS `fee_date_checked_out`,`fee`.`fee_date_due` AS `fee_date_due`,`fee`.`fee_fees` AS `fee_fees` from (((`fee` join `patron` on((`fee`.`patron_id` = `patron`.`patron_id`))) join `book` on((`fee`.`book_isbn` = `book`.`book_isbn`))) join `author` on((`book`.`book_author_id` = `author`.`author_id`))) order by `patron`.`patron_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
