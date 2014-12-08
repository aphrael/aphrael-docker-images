use mysql
drop procedure if exists createUser;
delimiter $$
create procedure createUser(username varchar(50), pw varchar(50))
begin
IF (SELECT EXISTS(SELECT 1 FROM `mysql`.`user` WHERE `user` = username)) = 0 THEN
    begin
    set @sql = CONCAT('CREATE USER ', username, '@\'172.17.%.%\' IDENTIFIED BY \'', pw, '\'');
    prepare stmt from @sql;
    execute stmt;
    deallocate prepare stmt;
    end;
END IF;
end $$
delimiter ;

call createUser('__REPLACE_DATABASE_USER__', '__REPLACE_DATABASE_PASSWORD__');

CREATE DATABASE IF NOT EXISTS `__REPLACE_DATABASE_NAME__`
  DEFAULT CHARACTER SET `utf8` COLLATE `utf8_unicode_ci`;

GRANT all ON `__REPLACE_DATABASE_NAME__`.* to '__REPLACE_DATABASE_USER__'@'172.17.%.%';
