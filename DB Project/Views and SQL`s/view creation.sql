create view smoke_deg_as_gest as
select smoke_deg_desc , gestation.smoke_number_id
from smoke join gestation on (gestation.smoke_deg_id = smoke.smoke_deg_id)
where gestation_id in (select gestation_id
from gestation join smoke_number on (gestation.smoke_number_id = smoke_number.smoke_number_id));