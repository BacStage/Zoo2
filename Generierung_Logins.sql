-- Erzeugung Logins und Berechtigungen
CREATE LOGIN personalabteilung WITH PASSWORD='abc123';
CREATE LOGIN pfleger1 WITH PASSWORD='abc123';
CREATE LOGIN drdschuettele WITH PASSWORD='arzt123';
CREATE LOGIN drmkrug WITH PASSWORD='arzt123';
CREATE LOGIN handwerker WITH PASSWORD='abc123';
CREATE LOGIN verwaltung WITH PASSWORD='abc123';

CREATE USER personalabteilungUser;
CREATE USER pflegerUser;
CREATE USER tierarztUser;
CREATE USER handwerkerUser;
CREATE USER verwaltungUser;

CREATE ROLE personalerRole;
CREATE ROLE pflegerRole;
CREATE ROLE arztRole;
CREATE ROLE handwerkerRole;
CREATE ROLE verwalterRole;

ALTER ROLE personaler ADD MEMBER personalabteilung;
GRANT SELECT ON SCHEMA :: hr TO personalerRole;
GRANT SELECT, UPDATE, INSERT ON dbo.Mitarbeiter TO personalerRole;

ALTER ROLE pflegerRole ADD MEMBER pflegerUser;
GRANT SELECT ON SCHEMA :: tierpflege TO pflegerRole;
GRANT EXECUTE ON SCHEMA :: tierpflege TO pflegerRole;

ALTER ROLE arztRole ADD MEMBER arztUser;
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.MedizinischeUntersuchung :: hr TO arztRole;


ALTER ROLE handwerkerRole ADD MEMBER handwerkerUser;


-- Schema ändern von vorhandenen DB-Objekten (Beispiel)
ALTER SCHEMA hr TRANSFER dbo.Tätigkeit_Mitarbeiteranzahl;
ALTER SCHEMA hr TRANSFER dbo.Wohnort_Mitarbeiteranzahl;



