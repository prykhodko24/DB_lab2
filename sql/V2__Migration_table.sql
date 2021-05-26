CREATE TABLE public."Pupil"
(
    "pupId" character varying(255) NOT NULL,
    birthdate numeric,
    sex character varying(255),
    reg character varying(255),
    area character varying(255),
    territory character varying(255),
    regiontype character varying(255),
    classprof character varying(255),
    classlang character varying(255),
    school character varying(255),
    PRIMARY KEY ("pupId")
);

CREATE TABLE public."Territory"
(
    reg character varying(255) NOT NULL,
    area character varying(255) NOT NULL,
    territory character varying(255) NOT NULL,
    territorytype character varying(255),
    PRIMARY KEY (area, territory, reg)
);

CREATE TABLE public."School"
(
    school character varying(255) NOT NULL,
    egov character varying(255),
    type character varying(255),
    reg character varying(255),
    area character varying(255),
    territory character varying(255),
    PRIMARY KEY (school)
);

CREATE TABLE public."ZNO"
(
    subject character varying(255) NOT NULL,
    pupil character varying(255) NOT NULL,
    stat character varying(255),
    "100p" numeric,
    "12p" numeric,
    points numeric,
    coef numeric,
    school character varying(255),
    PRIMARY KEY (subject, pupil)
);

ALTER TABLE public."Pupil"
    ADD FOREIGN KEY (school)
    REFERENCES public."School" (school)
    NOT VALID;


ALTER TABLE public."ZNO"
    ADD FOREIGN KEY (school)
    REFERENCES public."School" (school)
    NOT VALID;


ALTER TABLE public."ZNO"
    ADD FOREIGN KEY (pupil)
    REFERENCES public."Pupil" ("pupId")
    NOT VALID;


ALTER TABLE public."Pupil"
    ADD FOREIGN KEY (reg,area,territory)
    REFERENCES public."Territory" (reg,area,territory)
    NOT VALID;