
CREATE SCHEMA sc_mmt;

ALTER SCHEMA sc_mmt OWNER TO postgres;


CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;



COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


 


CREATE TABLE sc_mmt.account (
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    nom character varying(255),
    password character varying(255),
    prenom character varying(255),
    username character varying(255)
);


ALTER TABLE sc_mmt.account OWNER TO postgres;


CREATE TABLE sc_mmt.account_role (
    account_id bigint NOT NULL,
    roles_roleid bigint NOT NULL
);


ALTER TABLE sc_mmt.account_role OWNER TO postgres;


CREATE TABLE sc_mmt.account_roles (
    account_id bigint NOT NULL,
    roles_role_id bigint NOT NULL
);


ALTER TABLE sc_mmt.account_roles OWNER TO postgres;


CREATE TABLE sc_mmt.categorie (
    id bigint NOT NULL,
    categorie character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE sc_mmt.categorie OWNER TO postgres;


CREATE TABLE sc_mmt.chauffeur (
    id bigint NOT NULL,
    adresse character varying(255),
    agreement character varying(255),
    carte_pro character varying(255),
    code_postal integer,
    commune_licence character varying(255),
    nom character varying(255),
    nom_societe character varying(255),
    nombre_de_vehicule integer,
    numero_licence character varying(255),
    permis_conduire character varying(255),
    piece_identite character varying(255),
    prenom character varying(255),
    siren character varying(255),
    siret character varying(255),
    telephone character varying(255),
    ville character varying(255),
    account_id bigint,
    id_categorie bigint,
    location_id bigint,
    disponibilite boolean,
    id_statut bigint
);


ALTER TABLE sc_mmt.chauffeur OWNER TO postgres;


CREATE TABLE sc_mmt.chauffeur_vehicule (
    date_debut timestamp without time zone NOT NULL,
    date_fin timestamp without time zone NOT NULL,
    vehicule_id bigint NOT NULL,
    chauffeur_id bigint NOT NULL
);


ALTER TABLE sc_mmt.chauffeur_vehicule OWNER TO postgres;


CREATE TABLE sc_mmt.favori (
    id bigint NOT NULL,
    id_chauffeur bigint,
    id_patient bigint
);


ALTER TABLE sc_mmt.favori OWNER TO postgres;


CREATE SEQUENCE sc_mmt.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sc_mmt.hibernate_sequence OWNER TO postgres;


CREATE TABLE sc_mmt.location (
    id bigint NOT NULL,
    latitude double precision,
    longitude double precision
);


ALTER TABLE sc_mmt.location OWNER TO postgres;


CREATE TABLE sc_mmt.patient (
    id bigint NOT NULL,
    adresse character varying(255),
    adresse_medecin character varying(255),
    ald character varying(255),
    attestation_cmu character varying(255),
    carte_vitale character varying(255),
    civilite character(1),
    code_postal integer,
    date_naissance timestamp without time zone,
    mail character varying(255),
    mutuelle character varying(255),
    nom character varying(255),
    nom_medecin character varying(255),
    numero_ss character varying(15),
    prenom character varying(255),
    telephone character varying(255),
    ville character varying(255),
    account_id bigint
);


ALTER TABLE sc_mmt.patient OWNER TO postgres;


CREATE TABLE sc_mmt.prise_en_charge (
    id bigint NOT NULL,
    adresse_depart character varying(255),
    adresse_destination character varying(255),
    bon_transport character varying(255),
    commentaire character varying(255),
    cp_depart character varying(255),
    cp_destination character varying(255),
    date timestamp without time zone NOT NULL,
    distance double precision,
    duration character varying(255),
    is_assis boolean,
    is_couche boolean,
    is_differ boolean,
    latitude double precision,
    longitude double precision,
    nom_statut character varying(255),
    id_chauffeur bigint,
    id_patient bigint,
    location_arrive bigint,
    location_depart bigint,
    id_statut bigint,
    date_debut timestamp without time zone,
    date_fin timestamp without time zone
);


ALTER TABLE sc_mmt.prise_en_charge OWNER TO postgres;


CREATE TABLE sc_mmt.privilege (
    privilegeid bigint NOT NULL,
    description character varying(255),
    name character varying(255),
    privilege_id bigint NOT NULL
);


ALTER TABLE sc_mmt.privilege OWNER TO postgres;


CREATE TABLE sc_mmt.role (
    roleid bigint NOT NULL,
    description character varying(255),
    name character varying(255),
    role_id bigint NOT NULL
);


ALTER TABLE sc_mmt.role OWNER TO postgres;


CREATE TABLE sc_mmt.role_privilege (
    role_roleid bigint NOT NULL,
    privileges_privilegeid bigint NOT NULL
);


ALTER TABLE sc_mmt.role_privilege OWNER TO postgres;


CREATE TABLE sc_mmt.role_privileges (
    role_role_id bigint NOT NULL,
    privileges_privilege_id bigint NOT NULL
);


ALTER TABLE sc_mmt.role_privileges OWNER TO postgres;


CREATE TABLE sc_mmt.statut (
    id bigint NOT NULL,
    libelle character varying(255) NOT NULL
);


ALTER TABLE sc_mmt.statut OWNER TO postgres;


CREATE TABLE sc_mmt.tenant (
    id bigint NOT NULL,
    name character varying(255),
    url character varying(255)
);


ALTER TABLE sc_mmt.tenant OWNER TO postgres;


CREATE TABLE sc_mmt.vehicule (
    id bigint NOT NULL,
    assurance character varying(255),
    carte_grise character varying(255),
    immatriculation character varying(255),
    marque character varying(255),
    model character varying(255),
    type character varying(255),
    id_chauffeur bigint
);


ALTER TABLE sc_mmt.vehicule OWNER TO postgres;


ALTER TABLE ONLY sc_mmt.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.account_role
    ADD CONSTRAINT account_role_pkey PRIMARY KEY (account_id, roles_roleid);



ALTER TABLE ONLY sc_mmt.account_roles
    ADD CONSTRAINT account_roles_pkey PRIMARY KEY (account_id, roles_role_id);



ALTER TABLE ONLY sc_mmt.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.chauffeur
    ADD CONSTRAINT chauffeur_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.chauffeur_vehicule
    ADD CONSTRAINT chauffeur_vehicule_pkey PRIMARY KEY (chauffeur_id, vehicule_id);



ALTER TABLE ONLY sc_mmt.favori
    ADD CONSTRAINT favori_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.prise_en_charge
    ADD CONSTRAINT prise_en_charge_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.privilege
    ADD CONSTRAINT privilege_pkey PRIMARY KEY (privilegeid);



ALTER TABLE ONLY sc_mmt.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (roleid);



ALTER TABLE ONLY sc_mmt.role_privilege
    ADD CONSTRAINT role_privilege_pkey PRIMARY KEY (role_roleid, privileges_privilegeid);



ALTER TABLE ONLY sc_mmt.role_privileges
    ADD CONSTRAINT role_privileges_pkey PRIMARY KEY (role_role_id, privileges_privilege_id);



ALTER TABLE ONLY sc_mmt.statut
    ADD CONSTRAINT statut_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.tenant
    ADD CONSTRAINT tenant_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.vehicule
    ADD CONSTRAINT vehicule_pkey PRIMARY KEY (id);



ALTER TABLE ONLY sc_mmt.prise_en_charge
    ADD CONSTRAINT fk23w6axnsptq2fejb84d9nr60n FOREIGN KEY (id_chauffeur) REFERENCES sc_mmt.chauffeur(id);



ALTER TABLE ONLY sc_mmt.chauffeur
    ADD CONSTRAINT fk24xhw0ys91nq9jfj5d36581ot FOREIGN KEY (account_id) REFERENCES sc_mmt.account(id);



ALTER TABLE ONLY sc_mmt.chauffeur
    ADD CONSTRAINT fk2yf8mxfp1cn0wthprdgoj85qj FOREIGN KEY (id_statut) REFERENCES sc_mmt.statut(id);



ALTER TABLE ONLY sc_mmt.favori
    ADD CONSTRAINT fk328wpoe782x4f0aftj3qgm35u FOREIGN KEY (id_chauffeur) REFERENCES sc_mmt.chauffeur(id);



ALTER TABLE ONLY sc_mmt.prise_en_charge
    ADD CONSTRAINT fk3x7bkit5gk8eccdao1rpge460 FOREIGN KEY (id_statut) REFERENCES sc_mmt.statut(id);



ALTER TABLE ONLY sc_mmt.chauffeur_vehicule
    ADD CONSTRAINT fk4gn39xefvirpih2obuxykgvmf FOREIGN KEY (chauffeur_id) REFERENCES sc_mmt.chauffeur(id);



ALTER TABLE ONLY sc_mmt.chauffeur
    ADD CONSTRAINT fk5iral7dp6fgp0qjhsvtfi8dcp FOREIGN KEY (account_id) REFERENCES sc_mmt.account(id);



ALTER TABLE ONLY sc_mmt.chauffeur
    ADD CONSTRAINT fk6vu2ghfseg1dum930g0ndpee0 FOREIGN KEY (id_categorie) REFERENCES sc_mmt.categorie(id);



ALTER TABLE ONLY sc_mmt.account_role
    ADD CONSTRAINT fk9nqi983uisqs1r3gdvb3wwcr5 FOREIGN KEY (roles_roleid) REFERENCES sc_mmt.role(roleid);



ALTER TABLE ONLY sc_mmt.prise_en_charge
    ADD CONSTRAINT fkatpcd49whtd854t9ysun4jt5m FOREIGN KEY (location_depart) REFERENCES sc_mmt.location(id);



ALTER TABLE ONLY sc_mmt.prise_en_charge
    ADD CONSTRAINT fkca88f759rroa2pn4910soop2 FOREIGN KEY (id_statut) REFERENCES sc_mmt.statut(id);



ALTER TABLE ONLY sc_mmt.chauffeur_vehicule
    ADD CONSTRAINT fkci8m1nm077w1xhcaguu4c57bb FOREIGN KEY (vehicule_id) REFERENCES sc_mmt.vehicule(id);



ALTER TABLE ONLY sc_mmt.favori
    ADD CONSTRAINT fke1s674nnsuq861g7eypkrmrxw FOREIGN KEY (id_chauffeur) REFERENCES sc_mmt.chauffeur(id);



ALTER TABLE ONLY sc_mmt.prise_en_charge
    ADD CONSTRAINT fkedbygrdpwrspi5vm5hx5gvfb4 FOREIGN KEY (location_arrive) REFERENCES sc_mmt.location(id);



ALTER TABLE ONLY sc_mmt.role_privilege
    ADD CONSTRAINT fkfenwlftmt2y9dgttmjuxuf4t4 FOREIGN KEY (role_roleid) REFERENCES sc_mmt.role(roleid);



ALTER TABLE ONLY sc_mmt.chauffeur
    ADD CONSTRAINT fkgtcs53tytyd6pekaudvmtfde FOREIGN KEY (id_statut) REFERENCES sc_mmt.statut(id);



ALTER TABLE ONLY sc_mmt.chauffeur_vehicule
    ADD CONSTRAINT fkh4fkydf7q6r4s5xjh124o1k6l FOREIGN KEY (chauffeur_id) REFERENCES sc_mmt.chauffeur(id);



ALTER TABLE ONLY sc_mmt.chauffeur
    ADD CONSTRAINT fkhb8u2jayv7ly6yjr6suol4chh FOREIGN KEY (id_categorie) REFERENCES sc_mmt.categorie(id);



ALTER TABLE ONLY sc_mmt.prise_en_charge
    ADD CONSTRAINT fkhmn7x5xias4nlg4ne78kqgh6p FOREIGN KEY (id_patient) REFERENCES sc_mmt.patient(id);



ALTER TABLE ONLY sc_mmt.account_role
    ADD CONSTRAINT fkislooavflloarb6h3c53iv2j6 FOREIGN KEY (account_id) REFERENCES sc_mmt.account(id);



ALTER TABLE ONLY sc_mmt.favori
    ADD CONSTRAINT fkl9kmilawx4xdwemjgfuq299jx FOREIGN KEY (id_patient) REFERENCES sc_mmt.patient(id);



ALTER TABLE ONLY sc_mmt.patient
    ADD CONSTRAINT fkmcmqs8nwavm2q8r830g9y33ke FOREIGN KEY (account_id) REFERENCES sc_mmt.account(id);



ALTER TABLE ONLY sc_mmt.account_roles
    ADD CONSTRAINT fkms4jj38ark7ys7uw671pofbun FOREIGN KEY (roles_role_id) REFERENCES sc_mmt.role(roleid);



ALTER TABLE ONLY sc_mmt.patient
    ADD CONSTRAINT fkn6atqtmaryxq3o213gi3or1ij FOREIGN KEY (account_id) REFERENCES sc_mmt.account(id);



ALTER TABLE ONLY sc_mmt.chauffeur_vehicule
    ADD CONSTRAINT fknkrdvo092bdy7j4kklvl0kcer FOREIGN KEY (vehicule_id) REFERENCES sc_mmt.vehicule(id);



ALTER TABLE ONLY sc_mmt.prise_en_charge
    ADD CONSTRAINT fkoaig4icr5hh2ej8g4efwlcpoh FOREIGN KEY (id_chauffeur) REFERENCES sc_mmt.chauffeur(id);



ALTER TABLE ONLY sc_mmt.role_privileges
    ADD CONSTRAINT fkqqnno52qrhe0ylsn8foubql0v FOREIGN KEY (privileges_privilege_id) REFERENCES sc_mmt.privilege(privilegeid);



ALTER TABLE ONLY sc_mmt.vehicule
    ADD CONSTRAINT fkr1st8e3eerpuu34vp6sjb2v5x FOREIGN KEY (id_chauffeur) REFERENCES sc_mmt.chauffeur(id);



ALTER TABLE ONLY sc_mmt.role_privilege
    ADD CONSTRAINT fkrbrqmn6bfwtcymu35u94r18ui FOREIGN KEY (privileges_privilegeid) REFERENCES sc_mmt.privilege(privilegeid);



ALTER TABLE ONLY sc_mmt.role_privileges
    ADD CONSTRAINT fksl2ul7uo6ph5i2nohubr51g81 FOREIGN KEY (role_role_id) REFERENCES sc_mmt.role(roleid);



ALTER TABLE ONLY sc_mmt.prise_en_charge
    ADD CONSTRAINT fksukc28p87rrrfglyvd05y6soa FOREIGN KEY (id_patient) REFERENCES sc_mmt.patient(id);



ALTER TABLE ONLY sc_mmt.favori
    ADD CONSTRAINT fktcvgxdocv3jhj6np2f2hwjvkc FOREIGN KEY (id_patient) REFERENCES sc_mmt.patient(id);



ALTER TABLE ONLY sc_mmt.chauffeur
    ADD CONSTRAINT fkthm8dy36qrp54k9dkd5d51251 FOREIGN KEY (location_id) REFERENCES sc_mmt.location(id);



ALTER TABLE ONLY sc_mmt.account_roles
    ADD CONSTRAINT fktp61eta5i06bug3w1qr6286uf FOREIGN KEY (account_id) REFERENCES sc_mmt.account(id);



