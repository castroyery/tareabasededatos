

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   CEDULA_CLIENTE       INTEGER              not null,
   NOMBRE               VARCHAR2(40),
   TELEFONOS            INTEGER,
   NACIONALIDAD         VARCHAR2(40),
   CORREO               VARCHAR2(40),
   constraint PK_CLIENTE primary key (CEDULA_CLIENTE)
);

/*==============================================================*/
/* Table: ESTANCIA                                              */
/*==============================================================*/
create table ESTANCIA 
(
   ID_ESTANCIA          INTEGER              not null,
   CEDULA_CLIENTE       INTEGER              not null,
   ID_HABITACION        INTEGER              not null,
   FECH_LLEGADA         DATE,
   FECH_SALIDA          DATE,
   constraint PK_ESTANCIA primary key (ID_ESTANCIA)
);

/*==============================================================*/
/* Index: CLIENTE_ESTANCIA_FK                                   */
/*==============================================================*/
create index CLIENTE_ESTANCIA_FK on ESTANCIA (
   CEDULA_CLIENTE ASC
);

/*==============================================================*/
/* Index: HABITACION_ESTANCIA_FK                                */
/*==============================================================*/
create index HABITACION_ESTANCIA_FK on ESTANCIA (
   ID_HABITACION ASC
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION 
(
   ID_HABITACION        INTEGER              not null,
   ID_TIPO              INTEGER              not null,
   PISO                 INTEGER,
   NUM_HABITACION       INTEGER,
   constraint PK_HABITACION primary key (ID_HABITACION)
);

/*==============================================================*/
/* Index: TIPO_HABITACION_FK                                    */
/*==============================================================*/
create index TIPO_HABITACION_FK on HABITACION (
   ID_TIPO ASC
);

/*==============================================================*/
/* Table: T_HABITACION                                          */
/*==============================================================*/
create table T_HABITACION 
(
   ID_TIPO              INTEGER              not null,
   DESCRIPCION          VARCHAR2(50),
   PRECIO               INTEGER,
   MAX__PERSONAS        INTEGER,
   constraint PK_T_HABITACION primary key (ID_TIPO)
);

alter table ESTANCIA
   add constraint FK_ESTANCIA_CLIENTE_E_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE);

alter table ESTANCIA
   add constraint FK_ESTANCIA_HABITACIO_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION);

alter table HABITACION
   add constraint FK_HABITACI_TIPO_HABI_T_HABITA foreign key (ID_TIPO)
      references T_HABITACION (ID_TIPO);

