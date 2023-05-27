
INSERT INTO turno(tur_codigo, pac_codigo, tur_fecha)
VALUE(1, 1, '2023-04-15');

INSERT INTO turno(tur_codigo, pac_codigo, tur_fecha)
VALUE(2, 2, '2023-04-16');

INSERT INTO turno(tur_codigo, pac_codigo, tur_fecha)
VALUE(3, 3, '2023-04-23');

INSERT INTO turno(tur_codigo, pac_codigo, tur_fecha)
VALUE(4, 4, '2023-05-03');


INSERT INTO paciente(pac_codigo ,pac_nombre, pac_apellido, pac_dni, obr_codigo, pac_cud, pac_cud_img, pac_telefono, pac_direccion )
VALUE(1, 'Jose', 'Perez', 35574583, 1, 'hipoacusia neurosensorial bilateral', 'C:\Users\Anabella\Desktop\SQL CODERHOUSE\Desafio coder Tale', '351578384', 'Sucre 64);

INSERT INTO paciente(pac_codigo ,pac_nombre, pac_apellido, pac_dni, obr_codigo, pac_cud, pac_cud_img, pac_telefono, pac_direccion )
VALUE(2, 'Maria', 'Juarez', 35574583, 1, 'transtorno generalizado del desarrollo', 'C:\Users\Anabella\Desktop\SQL CODERHOUSE\Desafio coder Tale', '351575473', 'Santa rosa 2000');

INSERT INTO paciente(pac_codigo ,pac_nombre, pac_apellido, pac_dni, obr_codigo, pac_cud, pac_cud_img, pac_telefono, pac_direccion )
VALUE(3, 'Valentin', 'Riquelme', 35705923, 2, 'tartamudez', 'C:\Users\Anabella\Desktop\SQL CODERHOUSE\Desafio coder Tale', '3516923430', 'Colon 182 6B');

INSERT INTO paciente(pac_codigo ,pac_nombre, pac_apellido, pac_dni, obr_codigo, pac_cud, pac_cud_img, pac_telefono, pac_direccion )
VALUE(4, 'Nicolas', 'Pinillos', 34960966, 2, 'transtorno del desarrollo del habla y del leguaje', 'C:\Users\Anabella\Desktop\SQL CODERHOUSE\Desafio coder Tale', '3512912611', 'Arturo.M.Bas 315 6B');


INSERT INTO pacienteHC(phc_codigo, pac_codigo, his_codigo)
VALUES(1, 1, 1);

INSERT INTO pacienteHC(phc_codigo, pac_codigo, his_codigo)
VALUES(2, 2, 2);

INSERT INTO pacienteHC(phc_codigo, pac_codigo, his_codigo)
VALUES(3, 3, 3);

INSERT INTO pacienteHC(phc_codigo, pac_codigo, his_codigo)
VALUES(4, 4, 4);


INSERT INTO obrasocial(obr_codigo, obr_denom) VALUES(1,'APROSS');

INSERT INTO obrasocial(obr_codigo, obr_denom) VALUES(2,'DASPU');

INSERT INTO obrasocial(obr_codigo, obr_denom) VALUES(3,'MEDIFE');

INSERT INTO obrasocial(obr_codigo, obr_denom) VALUES(4,'OSDE');



INSERT INTO profesionales(pro_codigo, pro_matricula, pro_dni, pro_nombre, pro_apellido, pro_telefono, pro_direccion, esp_codigo, pro_cabecera)
VALUES(1, 8524, 35584323, 'Daniela', 'Barbuyan', '0351-155734594', 'Sucre 196 9A', 1, 0);

INSERT INTO profesionales(pro_codigo, pro_matricula, pro_dni, pro_nombre, pro_apellido, pro_telefono, pro_direccion, esp_codigo, pro_cabecera)
VALUES(2, 5612, 31960964, 'Angel', 'Aguero', '0351-155842318', 'Tucuman 32 1C', 2, 0);

INSERT INTO profesionales(pro_codigo, pro_matricula, pro_dni, pro_nombre, pro_apellido, pro_telefono, pro_direccion, esp_codigo, pro_cabecera)
VALUES(3, 3576, 33685825, 'Cecilia', 'Carranza', '0351-155963273', 'Sarmiento 254 PB', 3, 0);

INSERT INTO profesionales(pro_codigo, pro_matricula, pro_dni, pro_nombre, pro_apellido, pro_telefono, pro_direccion, esp_codigo, pro_cabecera)
VALUES(4, 3443, 32153642, 'Milton', 'Herrera', '0351-155112243', 'Mariano Moreno 996', 4, 0);

INSERT INTO profesionales(pro_codigo, pro_matricula, pro_dni, pro_nombre, pro_apellido, pro_telefono, pro_direccion, esp_codigo, pro_cabecera)
VALUES(5, 96482, 30740244, 'Barbara', 'Cristal', '0351-155453897', 'Jujuy 525, 5, 0);


INSERT INTO especialidad (esp_codigo, esp_denom)
VALUES(1,'kinesiologia');

INSERT INTO especialidad (esp_codigo, esp_denom)
VALUES(2,'psicomotricidad');

INSERT INTO especialidad (esp_codigo, esp_denom)
VALUES(3,'psicologia');

INSERT INTO especialidad (esp_codigo, esp_denom)
VALUES(4,'psiquiatria');

INSERT INTO especialidad (esp_codigo, esp_denom)
VALUES(5,'neurologia');

INSERT INTO especialidad (esp_codigo, esp_denom)
VALUES(6,'fonoaudiologia');


INSERT INTO consulta (con_codigo, pro_codigo, pac_codigo, con_fecha_date, con_observacion)
VALUES(1, 5, 1, '2023-03-29', 'Entrevista');

INSERT INTO consulta (con_codigo, pro_codigo, pac_codigo, con_fecha_date, con_observacion)
VALUES(2, 2, 1, '2023-03-29', 'Valoracion');

INSERT INTO consulta (con_codigo, pro_codigo, pac_codigo, con_fecha_date, con_observacion)
VALUES(3, 2, 2, '2023-03-29', 'Consulta ambulatoria');

INSERT INTO consulta (con_codigo, pro_codigo, pac_codigo, con_fecha_date, con_observacion)
VALUES(4, 3, 3, '2023-03-29', 'Anamnesis');

INSERT INTO consulta (con_codigo, pro_codigo, pac_codigo, con_fecha_date, con_observacion)
VALUES(5, 4, 4, '2023-03-29', 'Interconsulta');

INSERT INTO consulta (con_codigo, pro_codigo, pac_codigo, con_fecha_date, con_observacion)
VALUES(6, 5, 4, '2023-03-29', 'Tratamiento');



INSERT INTO historiaClinica(his_codigo, pac_codigo, pro_codigo, his_fecha_ingreso, his_observacion)
VALUES(1,1,5,'2023-03-29','primera entrevista' );

INSERT INTO historiaClinica(his_codigo, pac_codigo, pro_codigo, his_fecha_ingreso, his_observacion)
VALUES(2,2,2,'2023-03-29','valoracion' );

INSERT INTO historiaClinica(his_codigo, pac_codigo, pro_codigo, his_fecha_ingreso, his_observacion)
VALUES(3,3,4,'2023-04-02','Anamnesis' );

INSERT INTO historiaClinica(his_codigo, pac_codigo, pro_codigo, his_fecha_ingreso, his_observacion)
VALUES(4,4,4,'2023-04-02','Derivacion' );


INSERT INTO historiaClinicaDet(his_det_codigo, his_codigo, pro_codigo, his_det_fecha, his_det_observacion)
VALUES(1,1, 5, '2023-03-29', 'Pedido de Valoracion');

INSERT INTO historiaClinicaDet(his_det_codigo, his_codigo, pro_codigo, his_det_fecha, his_det_observacion)
VALUES(1,2, 2, '2023-03-29', 'Entrevista, valoracion');

INSERT INTO historiaClinicaDet(his_det_codigo, his_codigo, pro_codigo, his_det_fecha, his_det_observacion)
VALUES(1,3, 5, '2023-04-02', 'Pedido de informe');

INSERT INTO historiaClinicaDet(his_det_codigo, his_codigo, pro_codigo, his_det_fecha, his_det_observacion)
VALUES(1,4,3, '2023-04-06', 'valoracion neurocognitiva');

INSERT INTO historiaClinicaDet(his_det_codigo, his_codigo, pro_codigo, his_det_fecha, his_det_observacion)
VALUES(1,1, 4, '2023-04-07', 'Valoracion de pares creaneales');

INSERT INTO historiaClinicaDet(his_det_codigo, his_codigo, pro_codigo, his_det_fecha, his_det_observacion)
VALUES(1,2, 4, '2023-04-13', 'Ejercicios de motricidad fina y orientacion espacial');

INSERT INTO historiaClinicaDet(his_det_codigo, his_codigo, pro_codigo, his_det_fecha, his_det_observacion)
VALUES(1,3, 5, '2023-04-18', 'Cambio de medicacion');

INSERT INTO historiaClinicaDet(his_det_codigo, his_codigo, pro_codigo, his_det_fecha, his_det_observacion)
VALUES(1,1, 3, '2023-04-19', 'Implementacion de medios alternativos de comunicacion');

COMMIT;