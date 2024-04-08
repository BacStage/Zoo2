--CREATE VIEW Gehege_Tieranzahl AS
--SELECT g.Bezeichnung, COUNT(t.Tier_ID) AS Anzahl
--FROM Gehege g, Tiere t
--WHERE g.Gehege_ID=t.Gehege_Nr
--GROUP BY g.Bezeichnung;

--CREATE VIEW Tierart_Tieranzahl AS
--SELECT ta.Bezeichnung, COUNT(t.Tier_ID) AS Anzahl_Tiere
--FROM Tiere t, Tierart ta
--WHERE ta.Bezeichnung=t.Name
--GROUP BY ta.Bezeichnung;

--CREATE VIEW Tierklasse_Tieranzahl AS
--SELECT tk.Bezeichnung, COUNT(t.Tier_ID) as Anzahl
--FROM Tiere t, Tierart ta, Tiergattung tg, Tierklasse tk
--WHERE tg.Tierklasse_Nr=tk.Tierklasse_ID
--AND ta.Tiergattung_Nr=tg.Tiergattung_ID
--AND t.Tierart_Nr=ta.Tierart_ID
--GROUP BY tk.Bezeichnung;

--CREATE VIEW Abteilung_Mitarbeiteranzahl AS
--SELECT a.Bezeichnung, COUNT(*) AS Anzahl
--FROM Mitarbeiter m
--JOIN Tätigkeit t ON t.Tätigkeit_ID = m.Tätigkeit_Nr
--JOIN Abteilung a ON a.Abt_ID = t.Abteilung_Nr
--GROUP BY a.Bezeichnung;

--CREATE VIEW Tätigkeit_Mitarbeiteranzahl AS
--SELECT t.Bezeichnung, COUNT(*) AS Anzahl
--FROM Mitarbeiter m
--JOIN Tätigkeit t ON t.Tätigkeit_ID = m.Tätigkeit_Nr
--GROUP BY t.Bezeichnung;

--CREATE VIEW Gehegebetreuung_Mitarbeiteranzahl AS
--SELECT g.Bezeichnung, COUNT(m.Mitarbeiter_ID) AS Anzahl
--FROM Gehege g, Gehegebetreuung gb, Mitarbeiter m
--WHERE g.Gehege_ID=gb.Gehege_Nr
--AND m.Mitarbeiter_ID=gb.Mitarbeiter_Nr
--GROUP BY g.Bezeichnung;

--CREATE VIEW Wohnort_Mitarbeiteranzahl AS
--SELECT m.Ort, COUNT (*) AS Anzahl
--FROM Mitarbeiter m
--GROUP BY m.Ort

--CREATE VIEW Futterpläne AS
--SELECT t.Tier_ID, t.Name, ta.Bezeichnung, f.Futter_Name, fm.Menge, fr.Häufigkeit
--FROM Futter f, Futtermenge fm, Futterration fr, Tiere t, Tierart ta
--WHERE f.Futter_ID=fm.Futter_Nr
--AND fr.Rations_ID=fm.Rations_Nr
--AND t.Tier_ID=fr.Tier_Nr
--AND ta.Tierart_ID=t.Tier_ID;

--CREATE VIEW Futtertyp_Einkauf AS
--SELECT f.Futter_Name, SUM(e.Menge) AS Menge
--FROM Futter f, Einkauf e
--WHERE f.Futter_ID=e.Futter_Nr
--GROUP BY f.Futter_Name;

--CREATE VIEW Objektart_Anzahl AS
--SELECT oa.Bezeichnung, COUNT(o.Objekt_ID) AS Anzahl
--FROM Objekte o, Objektart oa
--WHERE o.Objektart_Nr = oa.Objektart_ID
--GROUP BY oa.Bezeichnung;

--CREATE VIEW Gehege_Objekt_Anzahl AS
--SELECT o.Bezeichnung, COUNT(g.Gehege_ID) AS Anzahl
--FROM Objekte o, Gehege g
--WHERE o.Objekt_ID = g.Objekt_Nr
--GROUP BY o.Bezeichnung;