USE `cephia`; /*Should be put at the beginning of every code*/
SELECT * 
FROM cephia_assay_results AS res
LEFT JOIN cephia_assay AS assay ON res.assay_id = assay.id
LEFT JOIN cephia_specimens AS spec ON res.specimen_id = spec.id
LEFT JOIN cephia_visits AS vis ON spec.visit_id = vis.id
LEFT JOIN cephia_subjects AS sub ON vis.subject_id = sub.id
LEFT JOIN cephia_visit_eddi AS eddi ON eddi.id = vis.visit_eddi_id
LEFT JOIN cephia_subject_eddi AS seddi ON seddi.id = sub.subject_eddi_id

WHERE assay.name = 'ArchitectUnmodified'
;

SELECT * 
FROM cephia_visits AS vis
LEFT JOIN cephia_subjects AS sub ON vis.subject_id = sub.id
LEFT JOIN cephia_visit_eddi AS eddi ON eddi.id = vis.visit_eddi_id
LEFT JOIN cephia_subject_eddi AS seddi ON seddi.id = sub.subject_eddi_id
WHERE on_treatment IS TRUE AND vl_detectable IS TRUE
;

SELECT * from cephia_visits
WHERE subject_id = 5867;
SELECT * from cephia_visits;
SELECT * from cephia_specimens;
SELECT * 
from cephia.cephia_assay_results as res
left join cephia.cephia_visits as visit on visit.id = res.id
where visit.subject_id = 5867;
select *
from cephia.cephia_visits as vis
where vis.on_treatment = 1;


select 
vis.*,
sub.*
FROM cephia_visits AS vis
LEFT JOIN cephia_subjects AS sub ON vis.subject_id = sub.id
WHERE vis.subject_id IN (select distinct subject_id
from cephia.cephia_visits as vis
where vis.on_treatment = 1 and vis.vl_detectable = 1) 
ORDER BY vis.subject_id, vis.visit_date;
/*For those with viral blips while on antiretroviravl therapy*/
SELECT 
vis.*,
sub.*,
spec.*,
assay.*,
eddi.*,
seddi.*
FROM cephia_assay_results AS res
LEFT JOIN cephia_assay AS assay ON res.assay_id = assay.id
LEFT JOIN cephia_specimens AS spec ON res.specimen_id = spec.id
LEFT JOIN cephia_visits AS vis ON spec.visit_id = vis.id
LEFT JOIN cephia_subjects AS sub ON vis.subject_id = sub.id
LEFT JOIN cephia_visit_eddi AS eddi ON eddi.id = vis.visit_eddi_id
LEFT JOIN cephia_subject_eddi AS seddi ON seddi.id = sub.subject_eddi_id

/*WHERE assay.name = 'ArchitectUnmodified'*/
WHERE vis.subject_id IN (select distinct subject_id
from cephia.cephia_visits as vis
where vis.on_treatment = 1 and vis.vl_detectable = 1) 
ORDER BY vis.subject_id, vis.visit_date;

/*For all those on antiretroviravl therapy*/
SELECT 
vis.*,
sub.*,
spec.*,
assay.*,
eddi.*,
seddi.*
FROM cephia_assay_results AS res
LEFT JOIN cephia_assay AS assay ON res.assay_id = assay.id
LEFT JOIN cephia_specimens AS spec ON res.specimen_id = spec.id
LEFT JOIN cephia_visits AS vis ON spec.visit_id = vis.id
LEFT JOIN cephia_subjects AS sub ON vis.subject_id = sub.id
LEFT JOIN cephia_visit_eddi AS eddi ON eddi.id = vis.visit_eddi_id
LEFT JOIN cephia_subject_eddi AS seddi ON seddi.id = sub.subject_eddi_id

/*WHERE assay.name = 'ArchitectUnmodified'*/
WHERE vis.subject_id IN (select distinct subject_id
from cephia.cephia_visits as vis
where vis.on_treatment = 1 /*and vis.vl_detectable = 1*/) 
ORDER BY vis.subject_id, vis.visit_date;

select count(sub.subject_label) from cephia_subjects as sub;
select count(distinct subject_id)
from cephia.cephia_visits as vis
where vis.on_treatment = 1;

SELECT 
count(vis.subject_id)
FROM cephia_assay_results AS res
LEFT JOIN cephia_assay AS assay ON res.assay_id = assay.id
LEFT JOIN cephia_specimens AS spec ON res.specimen_id = spec.id
LEFT JOIN cephia_visits AS vis ON spec.visit_id = vis.id
LEFT JOIN cephia_subjects AS sub ON vis.subject_id = sub.id
LEFT JOIN cephia_visit_eddi AS eddi ON eddi.id = vis.visit_eddi_id
LEFT JOIN cephia_subject_eddi AS seddi ON seddi.id = sub.subject_eddi_id

/*WHERE assay.name = 'ArchitectUnmodified'*/
WHERE vis.subject_id IN (select distinct subject_id
from cephia.cephia_visits as vis
where vis.on_treatment = 1 /*and vis.vl_detectable = 1*/) 
ORDER BY vis.subject_id, vis.visit_date;

select 
vis.*,
sub.*,
spa.*,
asre.*
FROM cephia_visits AS vis
LEFT JOIN cephia_subjects AS sub ON vis.subject_id = sub.id
left join cephia_specimens as spa on vis.visit_id = spa.visit_id
left join cephia_assay_results as asre on vis.visit_id = asre.visit_id
WHERE vis.subject_id IN (select distinct subject_id
from cephia.cephia_visits as vis
where vis.on_treatment = 1 and vis.vl_detectable = 1) 
ORDER BY vis.subject_id, vis.visit_date;



select *
from cephia.cephia_visits as vis
where vis.id = (select  distinct id
from cephia.cephia_visits as vis
where vis.on_treatment = 1 and vis.vl_detectable = 1);