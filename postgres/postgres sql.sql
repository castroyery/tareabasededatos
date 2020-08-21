
/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CEDULA_CLIENTE       INT4                 not null,
   NOMBRE               VARCHAR(40)          null,
   TELEFONOS            INT4                 null,
   NACIONALIDAD         VARCHAR(40)          null,
   CORREO               VARCHAR(40)          null,
   constraint PK_CLIENTE primary key (CEDULA_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Table: ESTANCIA                                              */
/*==============================================================*/
create table ESTANCIA (
   ID_ESTANCIA          INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   ID_HABITACION        INT4                 not null,
   FECH_LLEGADA         DATE                 null,
   FECH_SALIDA          DATE                 null,
   constraint PK_ESTANCIA primary key (ID_ESTANCIA)
);

/*==============================================================*/
/* Index: ESTANCIA_PK                                           */
/*==============================================================*/
create unique index ESTANCIA_PK on ESTANCIA (
ID_ESTANCIA
);

/*==============================================================*/
/* Index: CLIENTE_ESTANCIA_FK                                   */
/*==============================================================*/
create  index CLIENTE_ESTANCIA_FK on ESTANCIA (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Index: HABITACION_ESTANCIA_FK                                */
/*==============================================================*/
create  index HABITACION_ESTANCIA_FK on ESTANCIA (
ID_HABITACION
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   ID_HABITACION        INT4                 not null,
   ID_TIPO              INT4                 not null,
   PISO                 INT4                 null,
   NUM_HABITACION       INT4                 null,
   constraint PK_HABITACION primary key (ID_HABITACION)
);

/*==============================================================*/
/* Index: HABITACION_PK                                         */
/*==============================================================*/
create unique index HABITACION_PK on HABITACION (
ID_HABITACION
);

/*==============================================================*/
/* Index: TIPO_HABITACION_FK                                    */
/*==============================================================*/
create  index TIPO_HABITACION_FK on HABITACION (
ID_TIPO
);

/*==============================================================*/
/* Table: T_HABITACION                                          */
/*==============================================================*/
create table T_HABITACION (
   ID_TIPO              INT4                 not null,
   DESCRIPCION          VARCHAR(50)          null,
   PRECIO               INT4                 null,
   MAX__PERSONAS        INT4                 null,
   constraint PK_T_HABITACION primary key (ID_TIPO)
);

/*==============================================================*/
/* Index: T_HABITACION_PK                                       */
/*==============================================================*/
create unique index T_HABITACION_PK on T_HABITACION (
ID_TIPO
);

alter table ESTANCIA
   add constraint FK_ESTANCIA_CLIENTE_E_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table ESTANCIA
   add constraint FK_ESTANCIA_HABITACIO_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
      on delete restrict on update restrict;

alter table HABITACION
   add constraint FK_HABITACI_TIPO_HABI_T_HABITA foreign key (ID_TIPO)
      references T_HABITACION (ID_TIPO)
      on delete restrict on update restrict;

