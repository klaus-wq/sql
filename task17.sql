1. SELECT * FROM Squads
WHERE leader_id IS NULL;

2. SELECT * FROM Dwarves
WHERE age > 150 AND profession = 'Warrior';

3. SELECT * FROM Dwarves
INNER JOIN Items ON Dwarves.dwarf_id = Items.owner_id
WHERE Items.type = 'weapon';

4. SELECT Dwarves.dwarf_id, Dwarves.name, Tasks.status, COUNT(Tasks.task_id) AS tasks_count
FROM Dwarves
INNER JOIN Tasks ON Dwarves.dwarf_id = Tasks.assigned_to
GROUP BY Dwarves.dwarf_id, Tasks.status, Dwarves.name;

5. SELECT Dwarves.dwarf_id, Dwarves.name, Tasks.task_id
FROM Tasks
INNER JOIN Dwarves ON Tasks.assigned_to = Dwarves.dwarf_id
INNER JOIN Squads ON Dwarves.squad_id = Squads.squad_id
WHERE Squads.name = 'Guardians';

6. SELECT Dwarves.dwarf_id, Dwarves.name, Relationships.related_to, Dwarves.name, Relationships.relationship
FROM Relationships
INNER JOIN Dwarves ON Relationships.related_to = Dwarves.dwarf_id;

1-верно
2-верно
3-не использовала DISTINCT
4-можно убрать INNER
5-верно
6-неверно, нужно добавить еще один INNER JOIN