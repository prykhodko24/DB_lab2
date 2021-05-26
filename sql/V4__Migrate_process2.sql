INSERT INTO "Pupil" ("pupId", "birthdate", "sex", "reg" , "area", "territory", "regiontype","classprof","classlang","school")
SELECT DISTINCT ON ("outid") "outid", "birth", "sextypename", "regname", "areaname", "tername", "regtypename", "classprofilename", "classlangname", "eoname"
FROM zno;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "coef", "school")
SELECT DISTINCT "ukrtest", "outid", "ukrteststatus", "ukrball100", "ukrball12", "ukrball", "ukradaptscale", "eoname"
FROM zno
WHERE "ukrtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "histtest", "outid", "histteststatus", "histball100", "histball12", "histball12", "eoname"
FROM zno
WHERE "histtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "mathtest", "outid", "mathteststatus", "mathball100", "mathball12", "mathball12", "eoname"
FROM zno
WHERE "mathtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "phystest", "outid", "physteststatus", "physball100", "physball12", "physball12", "eoname"
FROM zno
WHERE "phystest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "chemtest", "outid", "chemteststatus", "chemball100", "chemball12", "chemball12", "eoname"
FROM zno
WHERE "chemtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "biotest", "outid", "bioteststatus", "bioball100", "bioball12", "bioball12", "eoname"
FROM zno
WHERE "biotest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "geotest", "outid", "geoteststatus", "geoball100", "geoball12", "geoball12", "eoname"
FROM zno
WHERE "geotest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "engtest", "outid", "engteststatus", "engball100", "engball12", "engball12", "eoname"
FROM zno
WHERE "engtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "fratest", "outid", "frateststatus", "fraball100", "fraball12", "fraball12", "eoname"
FROM zno
WHERE "fratest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "deutest", "outid", "deuteststatus", "deuball100", "deuball12", "deuball12", "eoname"
FROM zno
WHERE "deutest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "spatest", "outid", "spateststatus", "spaball100", "spaball12", "spaball12", "eoname"
FROM zno
WHERE "spatest" IS NOT NULL;