-- Série 4 : (Jointure)
USE hr;
-- 1. Ecrivez une requête pour afficher le nom, le numéro de département et le département de
-- tous les employés.
SELECT e.last_name, department_id, d.department_name
FROM employees e JOIN departments d
USING (department_id);
-- 2. Créez une liste unique de tous les postes du département 30.
SELECT DISTINCT jobs.job_title
FROM employees JOIN jobs
USING (job_id)
WHERE department_id = 30;
-- 3. Ecrivez une requête pour afficher le nom, le département et la localisation de tous les
-- employés qui touchent une commission.
SELECT CONCAT(e.last_name, ' ', e.first_name) Employee, d.department_name, CONCAT(l.city, ', ', c.country_name) Location
FROM employees e
JOIN departments d
ON d.department_id = e.department_id
JOIN locations l
ON l.location_id = d.location_id
JOIN countries c
ON c.country_id = l.country_id
WHERE commission_pct IS NOT NULL;
-- 4. Affichez le nom et le nom du département pour tous les employés dont le nom contient la
-- lettre A.
SELECT CONCAT(e.last_name, ' ', e.first_name) Employee, d.department_name
FROM employees e NATURAL JOIN departments d
WHERE last_name LIKE '%a%';
-- 5. Ecrivez une requête pour afficher le nom, le poste, le numéro de département et le
-- département de tous les employés basés à Seattle.
SELECT CONCAT(e.last_name, ' ', e.first_name) Employee, j.job_title, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Seattle';
-- Petite vérif
SELECT COUNT(*) "Nb employés Seattle" FROM employees WHERE department_id IN (10, 30) OR department_id >= 90;
-- 6. Affichez le nom et le matricule des employés et de leur manager. Nommez les colonnes
-- Employee, Emp#, Manager, et Mgr#, respectivement.
SELECT CONCAT(e.last_name, ' ', e.first_name) Employee, e.employee_id "Emp#",
	CONCAT(m.last_name, ' ', m.first_name) Manager, m.employee_id "Mgr#"
FROM employees e
JOIN employees m
ON (e.manager_id = m.employee_id);
-- 7. Modifiez la requête précédent[SA1]e pour afficher tous les employés, y compris King n'ayant
-- pas de manager.
SELECT CONCAT(e.last_name, ' ', e.first_name) Employee, e.employee_id "Emp#",
	CONCAT(m.last_name, ' ', m.first_name) Manager, m.employee_id "Mgr#"
FROM employees e
LEFT OUTER JOIN employees m
ON (e.manager_id = m.employee_id);
-- 8. Créez une requête pour afficher le numéro de département et le nom de tous les employés
-- qui travaillent dans le même département qu'un autre employé. Donnez à chaque colonne
-- un nom approprié.
-- 9. Affichez la structure de la table JOBS. Créez une requête pour afficher le nom, le poste, le
-- département, le salaire et l’intervalle associé de tous les employés.
-- 10. Créez une requête pour afficher le nom et la date d'embauche de tous les employés arrivés
-- après l'employé dont le mail est « JKING ».
-- 11. Affichez les noms et date d'embauche des employés et de leur manager, pour tous les
-- employés ayant été embauchés avant leur manager. Nommez les colonnes Employee, Emp
-- #Hiredate, Manager et Mgr Hiredate.
