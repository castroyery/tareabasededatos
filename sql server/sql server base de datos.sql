/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     20/08/2020 16:30:32                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESTANCIA') and o.name = 'FK_ESTANCIA_CLIENTE_E_CLIENTE')
alter table ESTANCIA
   drop constraint FK_ESTANCIA_CLIENTE_E_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESTANCIA') and o.name = 'FK_ESTANCIA_HABITACIO_HABITACI')
alter table ESTANCIA
   drop constraint FK_ESTANCIA_HABITACIO_HABITACI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HABITACION') and o.name = 'FK_HABITACI_TIPO_HABI_T_HABITA')
alter table HABITACION
   drop constraint FK_HABITACI_TIPO_HABI_T_HABITA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ESTANCIA')
            and   name  = 'HABITACION_ESTANCIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index ESTANCIA.HABITACION_ESTANCIA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ESTANCIA')
            and   name  = 'CLIENTE_ESTANCIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index ESTANCIA.CLIENTE_ESTANCIA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESTANCIA')
            and   type = 'U')
   drop table ESTANCIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HABITACION')
            and   name  = 'TIPO_HABITACION_FK'
            and   indid > 0
            and   indid < 255)
   drop index HABITACION.TIPO_HABITACION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HABITACION')
            and   type = 'U')
   drop table HABITACION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_HABITACION')
            and   type = 'U')
   drop table T_HABITACION
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CEDULA_CLIENTE       int                  not null,
   NOMBRE               varchar(40)          null,
   TELEFONOS            int                  null,
   NACIONALIDAD         varchar(40)          null,
   CORREO               varchar(40)          null,
   constraint PK_CLIENTE primary key  (CEDULA_CLIENTE)
)
go

/*==============================================================*/
/* Table: ESTANCIA                                              */
/*==============================================================*/
create table ESTANCIA (
   ID_ESTANCIA          int                  not null,
   CEDULA_CLIENTE       int                  not null,
   ID_HABITACION        int                  not null,
   FECH_LLEGADA         date             null,
   FECH_SALIDA          date            null,
   constraint PK_ESTANCIA primary key  (ID_ESTANCIA)
)
go

/*==============================================================*/
/* Index: CLIENTE_ESTANCIA_FK                                   */
/*==============================================================*/
create index CLIENTE_ESTANCIA_FK on ESTANCIA (
CEDULA_CLIENTE ASC
)
go

/*==============================================================*/
/* Index: HABITACION_ESTANCIA_FK                                */
/*==============================================================*/
create index HABITACION_ESTANCIA_FK on ESTANCIA (
ID_HABITACION ASC
)
go

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   ID_HABITACION        int                  not null,
   ID_TIPO              int                  not null,
   PISO                 int                  null,
   NUM_HABITACION       int                  null,
   constraint PK_HABITACION primary key  (ID_HABITACION)
)
go

/*==============================================================*/
/* Index: TIPO_HABITACION_FK                                    */
/*==============================================================*/
create index TIPO_HABITACION_FK on HABITACION (
ID_TIPO ASC
)
go

/*==============================================================*/
/* Table: T_HABITACION                                          */
/*==============================================================*/
create table T_HABITACION (
   ID_TIPO              int                  not null,
   DESCRIPCION          varchar(50)          null,
   PRECIO               int                  null,
   MAX__PERSONAS        int                  null,
   constraint PK_T_HABITACION primary key  (ID_TIPO)
)
go

alter table ESTANCIA
   add constraint FK_ESTANCIA_CLIENTE_E_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
go

alter table ESTANCIA
   add constraint FK_ESTANCIA_HABITACIO_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
go

alter table HABITACION
   add constraint FK_HABITACI_TIPO_HABI_T_HABITA foreign key (ID_TIPO)
      references T_HABITACION (ID_TIPO)
go

