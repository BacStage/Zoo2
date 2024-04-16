-- Erzeugung Logins mit Passwort
CREATE LOGIN personalabteilung WITH PASSWORD='abc123', CHECK_POLICY = OFF;
CREATE LOGIN pfleger WITH PASSWORD='abc123', CHECK_POLICY = OFF;
CREATE LOGIN tierarzt WITH PASSWORD='arzt123', CHECK_POLICY = OFF;
CREATE LOGIN handwerker WITH PASSWORD='abc123', CHECK_POLICY = OFF;
CREATE LOGIN verwaltung WITH PASSWORD='abc123', CHECK_POLICY = OFF;

-- Erzeugung Benutzer mit Verknüpfung zum Login und Schema
--CREATE USER personalabteilungUser FOR LOGIN personalabteilung WITH DEFAULT_SCHEMA = dbo;
--CREATE USER pflegerUser FOR LOGIN pfleger WITH DEFAULT_SCHEMA = dbo;
--CREATE USER tierarztUser FOR LOGIN tierarzt WITH DEFAULT_SCHEMA = dbo;
--CREATE USER handwerkerUser FOR LOGIN handwerker WITH DEFAULT_SCHEMA = dbo;
--CREATE USER verwaltungUser FOR LOGIN verwaltung WITH DEFAULT_SCHEMA = dbo;

-- Erzegung Benutzerrollen
--CREATE ROLE personalerRole;
--CREATE ROLE pflegerRole;
--CREATE ROLE arztRole;
--CREATE ROLE handwerkerRole;
--CREATE ROLE verwalterRole;

-- Zuweisung Mitgliedschaft von Benutzern zu Benutzerrollen; Definieren von Zugriffsrechten für Benutzerrollen
ALTER ROLE personalerRole ADD MEMBER personalabteilungUser;
GRANT SELECT ON SCHEMA :: hr TO personalerRole;
GRANT SELECT, UPDATE, INSERT ON dbo.Mitarbeiter TO personalerRole;
GRANT SELECT ON dbo.Tätigkeit TO personalerRole;

ALTER ROLE pflegerRole ADD MEMBER pflegerUser;
GRANT SELECT ON SCHEMA :: tierpflege TO pflegerRole;
GRANT EXECUTE ON SCHEMA :: tierpflege TO pflegerRole;

ALTER ROLE arztRole ADD MEMBER tierarztUser;
GRANT SELECT, UPDATE, DELETE, INSERT ON dbo.MedizinischeUntersuchung TO arztRole;

ALTER ROLE handwerkerRole ADD MEMBER handwerkerUser;
GRANT SELECT ON SCHEMA :: verwaltung TO verwalterRole;


