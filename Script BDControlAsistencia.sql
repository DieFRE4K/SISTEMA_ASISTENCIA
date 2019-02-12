--------------------------------------------------------------------------
---- CREACION DE LA BASE DE DATOS
--------------------------------------------------------------------------
use master
go
if exists (select * from sysdatabases where name = 'BDControlAsistencia')
	drop database BDControlAsistencia
go
create database BDControlAsistencia
go
--------------------------------------------------------------------------
-- CREACION DE LAS TABLAS
--------------------------------------------------------------------------
use BDControlAsistencia
go
-- Tabla para libros
create table TAlumno
(	-- lista de atributos
	CodAlumno varchar (8) not null,
	DNI varchar (8) not null,
	Nombre varchar (20) not null,
	Direccion varchar (50),
	Telefono varchar (10),
	--Grado varchar (10) not null,
	--Seccion varchar (10),

	-- definicion de la clave foranea
	primary key (CodAlumno)
)
go
--create table TTipoDocente
--(
--	-- Lista de atributos
--	CodTipoDocente varchar(8) not null,
--	TipoDocente varchar(20)not null,

--	primary key (CodTipoDocente)
--)

create table TDocente
(	-- lista de atributos
	CodDocente varchar (8) not null,
	Contraseña varchar(20) not null, 
	DNI varchar (8) not null,
	Nombre varchar (50) not null,
	Direccion varchar (50),
	Telefono varchar (10),
	TipoDocente varchar(20) not null,

	-- definicion de la clave foranea
	primary key (CodDocente),

	--foreign key (CodTipoDocente) references TTipoDocente(CodTipoDocente),
)
go
create table TGrado
(
	-- Lista atributos
	CodGrado varchar(8) not null,
	Grado varchar(2) not null,
	Seccion varchar (20) not null,
	Nivel varchar(8)

	primary key (CodGrado)
)
go
--create table TCargo
--(
--	-- Lista atributos
--	CodCargo varchar(8) not null,
--	CodDocente varchar(8) not null,
--	CodGrado varchar(8) not null,
--	CodSeccion varchar(8),
--	Fecha DateTime,

--	primary key (CodCargo),
--	foreign key (CodDocente) references TDocente(CodDocente),
--	foreign key (CodGrado, CodSeccion) references TGrado(CodGrado,CodSeccion),
--)
--go

--create table TRegistrarAsistenciaDocente
--(
--	-- Lista de atributos
--	CodRegistroAsistenciaDocente varchar(8) not null,
--	CodDocente varchar(8) not null,

--	Fecha DateTime,
--	Observacion varchar(50) not null,

--	primary key (CodRegistroAsistenciaDocente),
--	foreign key (CodDocente) references TDocente(CodDocente),
--)
--go

create table TMatricula
(
	AñoCurricular varchar(8) not null,
	CodAlumno varchar(8) not null,
	CodGrado varchar(8) not null,
	Seccion varchar(20) not null,
	Nivel varchar(8) not null,
	CodDocente varchar(8) not null,

	primary key (AñoCurricular,CodAlumno),

	foreign key (CodAlumno) references TAlumno(CodAlumno),
	foreign key (CodGrado) references TGrado(CodGrado),
	foreign key (CodDocente) references TDocente(CodDocente),
	

)

create table TAsistenciaAlumno
(
	-- lista de atributos
	CodAsistenciaAlumno varchar (50) not null,
	
	AñoCurricular varchar(8) not null,
	CodAlumno varchar(8) not null,

	Fecha DateTime,
	Estado varchar(8),
	Observacion varchar (50) not null,

	primary key (CodAsistenciaAlumno),

	foreign key (AñoCurricular,CodAlumno) references TMatricula(AñoCurricular,CodAlumno),
	--foreign key (CodCargo) references TCargo(CodCargo),
	--foreign key (CodAlumno) references TAlumno(CodAlumno),
)
go

--============================================= ALUMNO ====================================================
insert into TAlumno values('A0001','91758846','Jaimito','Av. Los chistes Cuadra 3','')
insert into TAlumno values('A0002','34251217','Jaime','Av. Loritos Cuadra 1','')
--=========================================== TIPO DOCENTE ====================================================
--insert into TTipoDocente values('SE','Docente Secundaria')

--============================================= DOCENTE ====================================================
insert into TDocente values('D001','1234','24943726','El profesor de Jaimito','Urb. Michi','984758836','SE')

--============================================= GRADO ====================================================
insert into TGrado values('G01','1','A','P')

--============================================= MATRICULA ====================================================
insert into TMatricula values('2016','A0001','1','A','P','D001')
insert into TMatricula values('2016','A0002','1','A','P','D001')

--============================================= ASISTENCIA ====================================================
insert into TAsistenciaAlumno values('01/10/2016','2016','A0001','01/10/2016','P','El alumno se comportó mal')


