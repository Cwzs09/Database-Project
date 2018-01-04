select smoke_deg_as_gest.smoke_deg_desc ,smoke_number.smoke_number_id, smoke_number.from , smoke_number.to
from smoke_deg_as_gest join smoke_number on(smoke_deg_as_gest.smoke_number_id = smoke_number.smoke_number_id)
order by smoke_deg_as_gest.smoke_deg_desc;