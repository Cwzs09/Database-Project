SELECT avg(income_id)
from gestation
where meducation_id = 5 and deducation_id = 5 ;

################################
create view 5more_pregnancy as
select count(gestation_id) as var1
from gestation 
where parity >= 5 and gestation_length < 252;

create view 5less_pregnancy as
select count(gestation_id) as var2
from gestation
where parity <= 5 and gestation_length < 252;

select 5more_pregnancy.var1 / 5less_pregnancy.var2
from 5more_pregnancy join 5less_pregnancy ;
#################################
select smoke_deg_id , birth_weight
from gestation 
where smoke_deg_id = 2 
order by birth_weight desc
limit 10;
#################################
select income.income_id , deducation_id, income.from ,income.to
from gestation join income on (gestation.income_id=income.income_id)
order by gestation.income_id desc
limit 10;
#################################
select mweight , birth_weight
from gestation
order by birth_weight desc
limit 10;
#################################

create view smoking_mother_gestation as
select count(smoke_deg_id) as var1
from gestation 
where smoke_deg_id=2 and gestation_length < 252;

create view not_smoking_mother_gestation as
select count(smoke_deg_id) as var2
from gestation 
where smoke_deg_id !=2 and gestation_length < 252;

select smoking_mother_gestation.var1/not_smoking_mother_gestation.var2
from smoking_mother_gestation join not_smoking_mother_gestation;

#################################
create view not_married as
select count(marital_id) as var1
from gestation
where marital_id=2 ;

create view total_mother as
select count(marital_id) as var2 
from gestation ;

select not_married.var1 / total_mother.var2
from not_married join total_mother;

#################################
select *
from
    (select birth_weight , gestation_length
    from gestation
    order by gestation_length desc
    limit 10
    ) as sort
order by birth_weight desc ;
#################################

create view interracial_couples as
select count(gestation_id) as var1
from gestation
where mrace_id != drace_id ;

create view couples as
select count(gestation_id) as var2
from gestation;

select interracial_couples.var1/ couples.var2
from interracial_couples join couples ;

#################################
create view smoke_deg_as_gest as
select smoke_deg_desc , gestation.smoke_number_id
from smoke join gestation on (gestation.smoke_deg_id = smoke.smoke_deg_id)
where gestation_id in (select gestation_id
from gestation join smoke_number on (gestation.smoke_number_id = smoke_number.smoke_number_id));
#################################
select count(gestation.smoke_deg_id) as count_of_mom,smoke.smoke_deg_id, smoke_deg_desc
from gestation join smoke on (gestation.smoke_deg_id=smoke.smoke_deg_id)
group by gestation.smoke_deg_id 
order by gestation.smoke_deg_id;