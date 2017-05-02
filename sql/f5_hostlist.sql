-- Selects the FQDN of all juniper devices for archival
--
-- LONG_DESC: 
--	Selects all the juniper devices from the database.  Used to
-- 	get a list of devices to run the cfg_archive script on.
--      It will not return hosts that have the disable_cfg_archive
--	custom attribute set to Y
--
-- USAGE:
--	you should run with header=no so its just the list of names
--
--

select concat(a.name,".",b.name) fqdn
from dns a, domains b, hosts h
where a.domain_id = b.id
and h.primary_dns_id = a.id
and      h.device_id in (
                select id from devices where device_type_id in (
                        select id from device_types where model_id in (
                                select id from models where manufacturer_id in (
                                        select id from manufacturers where name = "f5"
                                )
                        )
                )
        )

and h.id not in (
      SELECT table_id_ref
      FROM custom_attributes
      WHERE table_name_ref = 'hosts'
      AND value = 'Y'
      AND custom_attribute_type_id = (
              SELECT id
              FROM custom_attribute_types
              WHERE name LIKE 'disable_cfg_archive' )
)
order by fqdn
