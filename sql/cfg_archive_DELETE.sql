-- Used to delete old config archives - CAREFULL
--
-- Set a threshold of an older than date and a minimum config count to keep
-- You can also limit the config type or set it to '%' for all types
-- Once you have validated an accurate list of configs you must uncomment
-- the final DELETE line.
--
-- Also note, this can NOT be run from dcm.pl.  You must run via mysql directly
--   mysql -u root -p ona_default < cfg_archive_DELETE.sql

-- ---------------- START SETTINGS -----------------------
-- Set the date value for which we will delete anything OLDER than
SET @olderthan := '2017-01-01';
-- Set a minimum count of configurations to keep
SET @count := 5;
SET @ctype := 'IOS_CONFIG';
-- ----------------- END SETTINGS -----------------------



-- Set some default counters, you dont need to change these
SET @num := 0, @type := '', @host := 0;

-- Gather up the records to delete and store them in a temporary table
CREATE temporary TABLE tmptable (id INT)
select host_id, configuration_type_id, id, ctime,
        @num := if(@host = host_id, if(@type = configuration_type_id, @num + 1, 1), 1) as row_number,
        @type := configuration_type_id as dummy,
        @host := host_id as dummy2
from configurations force index(PRI)
where configuration_type_id in (select id from configuration_types where name like @ctype)
order by host_id,configuration_type_id,ctime desc;

-- Uncomment this to see ALL results
-- select * from tmptable;

-- Display our data based on our filter criteria
select * from tmptable
where ctime < @olderthan
and row_number > @count;

-- Uncomment this line to ACTUALLY delete things
-- DELETE configurations FROM configurations INNER JOIN tmptable ON configurations.id = tmptable.id WHERE row_number > @count AND tmptable.ctime < @olderthan;
