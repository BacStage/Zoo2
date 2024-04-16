// Mitarbeiter - Tätigkeit - Abteilung
SELECT m.Mitarbeiter_ID, m.Name, m.Vorname, m.Strasse, m.PLZ, m.Ort, t.Bezeichnung AS Tätigkeit, a.Bezeichnung AS Abteilung
FROM Mitarbeiter m
JOIN Tätigkeit t ON t.Tätigkeit_ID = m.Tätigkeit_Nr
JOIN Abteilung a ON a.Abt_ID = t.Abteilung_Nr

