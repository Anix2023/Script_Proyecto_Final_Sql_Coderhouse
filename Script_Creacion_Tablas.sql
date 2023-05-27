/*Creo la base de datos*/
CREATE DATABASE CentroRehabilitacion;

/*Le digo al DBMS que use la base de datos creada*/
USE CentroRehabilitacion;

/*Creo las tablas*/
CREATE TABLE turno (
	tur_codigo INT NOT NULL,
    pac_codigo INT NOT NULL,
    tur_fecha DATE NOT NULL,
    CONSTRAINT PK_turno PRIMARY KEY (tur_codigo)
);

CREATE TABLE paciente (
	pac_codigo INT NOT NULL,
    pac_nombre VARCHAR(70) NOT NULL,
    pac_apellido VARCHAR(70)NOT NULL,
    pac_dni VARCHAR(30) NOT NULL,
    obr_codigo INT NOT NULL,
    pac_cud VARCHAR(254) NOT NULL,
    pac_cud_img LONGTEXT NOT NULL,
    pac_telefono varchar(100) NOT NULL,
    pac_direccion varchar(254) NOT NULL,
    CONSTRAINT PK_paciente PRIMARY KEY (pac_codigo)
);
    
CREATE TABLE pacienteHC(
	phc_codigo INT NOT NULL,
    pac_codigo INT NOT NULL,
    his_codigo INT NOT NULL,
    CONSTRAINT PK_pacienteHC PRIMARY KEY (phc_codigo)
);

CREATE TABLE obraSocial (
obr_codigo int NOT NULL,
obr_denom VARCHAR(50) NOT NULL,
CONSTRAINT PK_obra_social PRIMARY KEY (obr_codigo)
);

CREATE TABLE profesionales (
pro_codigo int NOT NULL,
pro_matricula VARCHAR(15) NOT NULL,
pro_dni VARCHAR(15) NOT NULL,
pro_nombre VARCHAR(30) NOT NULL,
pro_apellido VARCHAR(70) NOT NULL,
pro_telefono VARCHAR(100) NOT NULL,
pro_direccion VARCHAR(254) NOT NULL,
esp_codigo INT NOT NULL,
pro_cabecera INT NOT NULL default 0,
CONSTRAINT PK_profesionales PRIMARY KEY (pro_codigo)
);

CREATE TABLE especialidad (
esp_codigo int NOT null,
esp_denom VARCHAR(15) NOT NULL,
CONSTRAINT PK_especialidad PRIMARY KEY (esp_codigo)
);

CREATE TABLE consulta (
con_codigo int NOT NULL,
pro_codigo int NOT NULL,
pac_codigo int NOT NULL,
con_fecha_date date NOT NULL,
con_observacion VARCHAR(254) NULL,
CONSTRAINT PK_consulta PRIMARY KEY (con_codigo)
);
    
CREATE TABLE historiaClinica (
his_codigo int NOT NULL,
pac_codigo int NOT NULL,
pro_codigo int NOT NULL,
his_fecha_ingreso date NOT NULL,
his_fecha_alta date NULL,
his_observacion LONGTEXT NOT NULL,
CONSTRAINT PK_historia_clinica PRIMARY KEY (his_codigo)
);

CREATE TABLE historiaClinicaDet (
his_det_codigo int NOT NULL,
his_codigo int NOT NULL,
pro_codigo int NOT NULL,
his_det_fecha date NOT NULL,
his_det_observacion LONGTEXT NOT NULL,
CONSTRAINT PK_historiaClinicaDet PRIMARY KEY (his_det_codigo)
);

/*Foreing Key*/
ALTER TABLE turno ADD CONSTRAINT FK_turno_paciente FOREIGN KEY FK_turno_paciente (pac_codigo)
    REFERENCES paciente (pac_codigo);
    
ALTER TABLE paciente ADD CONSTRAINT FK_paciente_obrasocial FOREIGN KEY FK_paciente_obrasocial (obr_codigo)
    REFERENCES obraSocial (obr_codigo);

ALTER TABLE pacienteHC ADD CONSTRAINT FK_pacienteHC_paciente FOREIGN KEY FK_pacienteHC_paciente (pac_codigo)
    REFERENCES paciente (pac_codigo);
    
ALTER TABLE pacienteHC ADD CONSTRAINT FK_pacienteHC_historiaClinica FOREIGN KEY FK_pacienteHC_historiaClinica (his_codigo)
    REFERENCES historiaClinica (his_codigo);

ALTER TABLE profesionales ADD CONSTRAINT FK_profesionales_especialidad FOREIGN KEY FK_profesionales_especialidad (esp_codigo)
    REFERENCES especialidad (esp_codigo);

ALTER TABLE consulta ADD CONSTRAINT FK_consulta_profesionales FOREIGN KEY FK_consulta_profesionales (pro_codigo)
    REFERENCES profesionales (pro_codigo);
    
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_paciente FOREIGN KEY FK_consulta_paciente (pac_codigo)
    REFERENCES paciente (pac_codigo);

ALTER TABLE historiaClinica ADD CONSTRAINT FK_historiaClinica_profesionales FOREIGN KEY FK_historiaClinica_profesionales (pro_codigo)
    REFERENCES profesionales (pro_codigo);
    
ALTER TABLE historiaClinica ADD CONSTRAINT FK_historiaClinica_paciente FOREIGN KEY FK_historiaClinica_paciente (pac_codigo)
    REFERENCES paciente (pac_codigo);
    
ALTER TABLE historiaClinicaDet ADD CONSTRAINT FK_historiaClinicaDet_historiaClinica FOREIGN KEY FK_historiaClinicaDet_historiaClinica (his_codigo)
    REFERENCES historiaClinica (his_codigo);
    
ALTER TABLE historiaClinicaDet ADD CONSTRAINT FK_historiaClinicaDet_profesionales FOREIGN KEY FK_historiaClinicaDet_profesionales (pro_codigo)
    REFERENCES profesionales (pro_codigo);
