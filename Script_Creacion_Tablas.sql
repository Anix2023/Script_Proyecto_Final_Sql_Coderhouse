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

   --FUNCIONES--
    
    DELIMITER //
CREATE FUNCTION concatenar_nombre_apellido(nombre VARCHAR(255), apellido VARCHAR(255))
RETURNS VARCHAR(510)
BEGIN
    DECLARE nombre_apellido VARCHAR(510);
    SET nombre_apellido = CONCAT(nombre, ' ', apellido);
    RETURN nombre_apellido;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION concatenar_diagnosticos(dia_denom1 VARCHAR(255), dia_denom2 VARCHAR(255)  , dia_denom3 VARCHAR(255) , dia_denom4 VARCHAR(255) , dia_denom5 VARCHAR(255) , dia_denom6 VARCHAR(255) )
RETURNS VARCHAR(2048)
BEGIN
    DECLARE resultado VARCHAR(2048);
    SET resultado = '';
    IF dia_denom1 IS NOT NULL THEN
        SET resultado = CONCAT(resultado, ' ', dia_denom1);
    END IF;
    IF dia_denom2 IS NOT NULL THEN
        SET resultado = CONCAT(resultado, ' ', dia_denom2);
    END IF;
    IF dia_denom3 IS NOT NULL THEN
        SET resultado = CONCAT(resultado, ' ', dia_denom3);
    END IF;
    IF dia_denom4 IS NOT NULL THEN
        SET resultado = CONCAT(resultado, ' ', dia_denom4);
    END IF;
    IF dia_denom5 IS NOT NULL THEN
        SET resultado = CONCAT(resultado, ' ', dia_denom5);
    END IF;
    IF dia_denom6 IS NOT NULL THEN
        SET resultado = CONCAT(resultado, ' ', dia_denom6);
    END IF;
    RETURN TRIM(resultado);
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_actualizar_paciente(IN p_codigo INT,
										IN p_nombre VARCHAR(70),
										IN p_apellido VARCHAR(70), 
                                        IN p_dni VARCHAR(30), 
                                        IN p_cud VARCHAR(254),
                                        IN p_cud_img VARCHAR(254),
                                        IN p_telefono VARCHAR(100),
                                        IN p_direccion VARCHAR(254) )
BEGIN
    UPDATE paciente SET pac_nombre = p_nombre, 
                        pac_apellido = p_apellido, 
                        pac_dni = p_dni, 
                        pac_cud = p_cud, 
                        pac_cud_img = p_cud_img, 
                        pac_telefono = p_telefono, 
                        pac_direccion = p_direccion
				  WHERE pac_codigo = p_codigo;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE ordenamiento_paciente (IN p_campo_a_ordenar varchar (200),IN orden BOOLEAN)
BEGIN
	IF p_campo_a_ordenar <> "" AND orden = 1 THEN
		SET @ordenar = concat("ORDER BY", p_campo_a_ordenar);
	ELSEIF p_campo_a_ordenar <> "" AND orden = 0 THEN
		SET @ordenar = contact ("ORDER BY" , p_campo_a_ordenar, 'DESC');
	ELSE
		SET @ordenar = " "; 
	END IF;
	SET @clausula_select = concat ( " SELECT * FROM PACIENTES " , @ordenar);
    
	PREPARE ejecucion FROM @clausula_select;
	EXECUTE ejecution;
	DEALLOCATE PREPARE ejecucion;
END //
DELIMITER ;



-- Crear tabla historiaClinica_log
CREATE TABLE IF NOT EXISTS historiaClinica_log (
    hcl_id INT AUTO_INCREMENT PRIMARY KEY,
    hc_id INT,
    hc_fecha_modificacion TIMESTAMP,
    hc_campo_modificado VARCHAR(255),
    hc_valor_anterior VARCHAR(255),
    hc_valor_nuevo VARCHAR(255)
);

-- Crear trigger para guardar registros en historiaClinica_log
DELIMITER //
CREATE TRIGGER tr_historiaClinica_modificacion
AFTER UPDATE
ON historiaClinica FOR EACH ROW
BEGIN
    -- Insertar en tabla historiaClinica_log
    INSERT INTO historiaClinica_log (hc_id, hc_fecha_modificacion, hc_campo_modificado, hc_valor_anterior, hc_valor_nuevo)
    VALUES (OLD.id, CURRENT_TIMESTAMP(), 'campo_modificado', OLD.campo_modificado, NEW.campo_modificado);
END;
//
DELIMITER ;

-- Este trigger sirve para guardar registro de modificacion de la tabla HistoriaClinica
