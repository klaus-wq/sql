2. SELECT
	d.dwarf_id,
	d.name,
	d.age,
	d.profession,
	JSON_OBJECT(
	   'skill_ids',(
	       SELECT JSON_ARRAYAGG(ds.skill_id)
	       FROM  dwarf_skills ds
	       WHERE d.dwarf_id = ds.dwarf_id
	   ),
	    'assignment_ids',(
	       SELECT JSON_ARRAYAGG(da.assignment_id)
	       FROM dwarf_assignments da
	       WHERE d.dwarf_id = da.dwarf_id
	   ),
	    'squad_ids',(
		   SELECT JSON_ARRAYAGG(ms.squad_id)
	       FROM military_squads ms
	       WHERE d.fortress_id = ms.fortress_id
	   ),
	   'equipment_ids',(
	       SELECT JSON_ARRAYAGG(de.equipment_id)
	       FROM dwarf_equipment de
	       WHERE d.dwarf_id = de.dwarf_id
	   )
   ) AS related_entities
FROM dwarves d;

3. SELECT
	w.workshop_id,
	w.name,
	w.type,
	w.quality,
	JSON_OBJECT(
		'craftsdwarf_ids', (
			SELECT JSON_ARRAYAGG(wc.dwarf_id)
			FROM workshop_craftsdwarves wc
			WHERE wc.workshop_id = w.workshop_id
		),
		'project_ids', (
			SELECT JSON_ARRAYAGG(p.project_id)
			FROM projects p
			WHERE p.workshop_id = w.workshop_id
		),
		'input_materials_ids', (
			SELECT JSON_ARRAYAGG(wm.material_id)
			FROM workshop_materials wm
			WHERE wm.workshop_id = w.workshop_id
		),
		'output_product_ids', (
			SELECT JSON_ARRAYAGG(wp.product_id)
			FROM workshop_products wp
			WHERE wp.workshop_id = w.workshop_id
		)
	) AS related_entities
FROM
	workshops w;

4. SELECT
	ms.squad_id,
	ms.name,
	ms.formation_type,
	ms.leader_id,
	JSON_OBJECT(
		'member_ids', (
			SELECT JSON_ARRAYAGG(sm.squad_id)
			FROM squad_members sm
			WHERE sm.squad_id = ms.squad_id
		),
		'equipment_ids', (
			SELECT JSON_ARRAYAGG(se.equipment_id)
			FROM squad_equipment se
			WHERE se.squad_id = ms.squad_id
		),
		'operation_ids', (
			SELECT JSON_ARRAYAGG(so.operation_id)
			FROM squad_operations so
			WHERE so.squad_id = ms.squad_id
		),
        'training_schedule_ids', (
			SELECT JSON_ARRAYAGG(st.schedule_id)
			FROM squad_training st
			WHERE st.squad_id = ms.squad_id
		),
		'battle_report_ids', (
			SELECT JSON_ARRAYAGG(sb.report_id)
			FROM squad_battles sb
			WHERE sb.squad_id = ms.squad_id
		)
	) AS related_entities
FROM
	military_squads ms;