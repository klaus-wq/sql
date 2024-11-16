1. SELECT Dwarves.dwarf_id, Dwarves.name as dwarf_name,
Dwarves.age, Dwarves.profession, Dwarves.squad_id,
Squads.name as squad_name, Squads.mission
FROM Dwarves
INNER JOIN Squads ON Squads.squad_id = Dwarves.squad_id;

2. SELECT Dwarves.dwarf_id, Dwarves.name as dwarf_name,
Dwarves.age, Dwarves.profession, Dwarves.squad_id
FROM Dwarves
WHERE Dwarves.profession = 'miner' AND Dwarves.squad_id is NULL;

3. SELECT * from Tasks
WHERE Tasks.status = 'pending'
AND Tasks.priority = (SELECT MAX(Tasks.priority) FROM Tasks);

4. SELECT Dwarves.dwarf_id,
COUNT(Items.item_id) AS items_count
FROM Dwarves
INNER JOIN Items ON Dwarves.dwarf_id = Items.owner_id
GROUP BY Dwarves.dwarf_id;

5. SELECT Squads.squad_id,
COUNT(Dwarves.dwarf_id) AS dwarves_count
FROM Squads
FULL JOIN Dwarves ON Squads.squad_id = Dwarves.squad_id
WHERE Squads.squad_id is not NULL
GROUP BY Squads.squad_id;

6. SELECT Dwarves.profession,
COUNT(Tasks.task_id) as 'tasks_count'
FROM Dwarves
INNER JOIN Tasks on Dwarves.dwarf_id = Tasks.assigned_to
WHERE Tasks.status = 'pending' OR  Tasks.status = 'in_progress'
GROUP BY Dwarves.profession;

7. SELECT Items.type, AVG(Dwarves.age) as dwarf_avg_age
FROM Items
INNER JOIN Dwarves ON Items.owner_id = Dwarves.dwarf_id
GROUP BY Items.type;

8. SELECT Dwarves.dwarf_id
FROM Dwarves
FULL JOIN Items ON Dwarves.dwarf_id = Items.owner_id
WHERE Dwarves.age > (SELECT AVG(Dwarves.age) FROM Dwarves)
AND Items.owner_id is NULL;