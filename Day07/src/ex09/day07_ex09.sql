SELECT address,
	ROUND(MAX(age)-(1.0*MIN(age)/MAX(age)),2) AS formula,
       ROUND(AVG(age),2) AS average,
       MAX(age)-(1.0*MIN(age)/MAX(age)) > AVG(age) AS comparison
FROM person
GROUP BY address
ORDER BY 1;
