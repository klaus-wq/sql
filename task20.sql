SELECT
	exp.expedition_id,
	exp.destination,
	exp.status,
		(
			SELECT COUNT(em.survived = 1) / COUNT(em.dwarf_id) * 100
			FROM expedition_members em
			WHERE em.expedition_id = exp.expedition_id
		) AS survival_rate,
		(
			SELECT COUNT(ea.value)
			FROM expedition_artifacts ea
			WHERE ea.expedition_id = exp.expedition_id
		) AS artifacts_value,
		(
			SELECT COUNT(es.site_id)
			FROM expedition_sites es
			WHERE es.expedition_id = exp.expedition_id
		) AS discovered_sites,
		(
			SELECT COUNT(CASE WHEN ec.outcome = 'Success' THEN 1 END) / 
 			COUNT(CASE WHEN ec.outcome = 'Fail' THEN 1 END) * 100
			FROM expedition_creatures ec
 			WHERE ec.expedition_id = exp.expedition_id
		) AS encounter_success_rate,
		(
			DATEDIFF(exp.return_date, exp.departure_date)
		) AS expedition_duration,
		JSON_OBJECT(
			'member_ids',(
				SELECT JSON_ARRAYAGG(em.dwarf_id)
				FROM expedition_members em
				WHERE em.expedition_id = exp.expedition_id
			),
			'artifact_ids',(
				SELECT JSON_ARRAYAGG(ea.artifact_id)
				FROM expedition_artifacts ea
				WHERE ea.expedition_id = exp.expedition_id
			),
			'site_ids',(
				SELECT JSON_ARRAYAGG(es.site_id)
				FROM expedition_sites es
				WHERE es.expedition_id = exp.expedition_id
			)
	) AS related_entities
FROM expeditions exp
WHERE exp.status = "Completed";