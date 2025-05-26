use employee;


create table tdepartment(
DNumber varchar(255) primary key,
DName varchar(255)
);

create table trank(
RNumber varchar(255) primary key,
RName varchar(255)
);

create table temployee(
ENumber varchar(255) primary key,
DNumber varchar(255),
RNumber varchar(255),
EName varchar(255),
ERRN varchar(255),
EAddr varchar(255),
StartDate datetime,
ResignationDate datetime,
foreign key(DNumber) references tdepartment(DNumber),
foreign key(RNumber) references trank(RNumber)
);

create table titem(
INumber varchar(255) primary key,
IName varchar(255),
Price int,
RegisterDate datetime
);

create table tproduction(
PNumber varchar(255) primary key,
ENumber varchar(255),
INumber varchar(255),
PCount int,
PDate datetime,
foreign key(ENumber) references temployee(ENumber),
foreign key(INumber) references titem(INumber)
);

create table tcustomer(
CNumber varchar(255) primary key,
CName varchar(255),
CAddr varchar(255),
ContractDate datetime
);

create table torder(
ONumber varchar(255) primary key,
CNumber varchar(255),
PNumber varchar(255),
ODate datetime,
foreign key(CNumber) references tcustomer(CNumber),
foreign key(PNumber) references tproduction(PNumber)
);

create table treturnreason(
RRNumber varchar(255) primary key,
RReason varchar(255)
);

create table treturn(
RNumber varchar(255) primary key,
ONumber varchar(255),
RCount int,
RRNumber varchar(255),
RDate datetime,
foreign key(RRNumber) references treturnreason(RRNumber),
foreign key(ONumber) references torder(ONumber)
);

DROP TABLE IF EXISTS tDepartment CASCADE;
DROP TABLE IF EXISTS tRank CASCADE;
DROP TABLE IF EXISTS tReturnReason CASCADE;
DROP TABLE IF EXISTS tItem CASCADE;
DROP TABLE IF EXISTS tCustomer CASCADE;
DROP TABLE IF EXISTS tEmployee CASCADE;
DROP TABLE IF EXISTS tProduction CASCADE;
DROP TABLE IF EXISTS tOrder CASCADE;
DROP TABLE IF EXISTS tReturn CASCADE;


CREATE TABLE tDepartment
(
   DNumber varchar(5) not null
   , DName varchar(10) not null
);


CREATE TABLE tRank
(
   RNumber varchar(5) not null
   , RName varchar(2) not null
);


CREATE TABLE tReturnReason
(
   RRNumber varchar(6) not null
   , RReason varchar(4) not null
);


CREATE TABLE tItem
(
   INumber varchar(5) not null
   , IName varchar(20) not null
   , Price integer not null
   , RegisterDate TIMESTAMP not null
);


CREATE TABLE tCustomer
(
   CNumber varchar(5) not null
   , CName varchar(20) not null
   , CAddr varchar(10) not null
   , ContractDate TIMESTAMP not null
);


CREATE TABLE tEmployee
(
   ENumber varchar(5) not null
   , DNumber varchar(5) null
   , RNumber varchar(5) not null
   , EName varchar(5) not null
   , ERRN varchar(14) not null
   , EAddr varchar(10) not null
   ,  StartDate TIMESTAMP not null
   , ResignationDate TIMESTAMP null
);


CREATE TABLE tProduction
(
   PNumber varchar(5) not null
   , ENumber varchar(5) not null
   , INumber varchar(5) not null
   , PCount integer not null
   , PDate TIMESTAMP not null
);


CREATE TABLE tOrder
(
   ONumber varchar(5) not null
   , CNumber varchar(5) not null
   , PNumber varchar(5) not null
   , ODate TIMESTAMP  not null
);


CREATE TABLE tReturn
(
   RNumber varchar(5) not null
   , ONumber varchar(5) not null
   , RCount integer not null
   , RRNumber varchar(6) not null
   , RDate TIMESTAMP not null
);


ALTER TABLE tDepartment ADD CONSTRAINT PK_tDepartment_DNumber PRIMARY KEY (DNumber);
ALTER TABLE tRank ADD CONSTRAINT PK_tRank_RNumber PRIMARY KEY (RNumber);
ALTER TABLE tReturnReason ADD CONSTRAINT PK_tReturnReason_RRNumber PRIMARY KEY (RRNumber);
ALTER TABLE tItem ADD CONSTRAINT PK_tItem_INumber PRIMARY KEY (INumber);
ALTER TABLE tCustomer ADD CONSTRAINT PK_tCustomer_CNumber PRIMARY KEY (CNumber);
ALTER TABLE tEmployee ADD CONSTRAINT PK_tEmployee_ENumber PRIMARY KEY (ENumber);
ALTER TABLE tProduction ADD CONSTRAINT PK_tProduction_PNumber PRIMARY KEY (PNumber);
ALTER TABLE tOrder ADD CONSTRAINT PK_tOrder_ONumber PRIMARY KEY (ONumber);
ALTER TABLE tReturn ADD CONSTRAINT PK_tReturn_RNumber PRIMARY KEY (RNumber);


ALTER TABLE tEmployee ADD CONSTRAINT FK_tEmployee_DNumber FOREIGN KEY (DNumber) REFERENCES tDepartment (DNumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tEmployee ADD CONSTRAINT FK_tEmployee_RNumber
   FOREIGN KEY (RNumber) REFERENCES tRank (RNumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tProduction ADD CONSTRAINT FK_tProduction_ENumber
   FOREIGN KEY (ENumber) REFERENCES tEmployee (ENumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tProduction ADD CONSTRAINT FK_tProduction_INumber
   FOREIGN KEY (INumber) REFERENCES tItem (INumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tOrder ADD CONSTRAINT FK_tOrder_CNumber
   FOREIGN KEY (CNumber) REFERENCES tCustomer (CNumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tOrder ADD CONSTRAINT FK_tOrder_PNumber
   FOREIGN KEY (PNumber) REFERENCES tProduction (PNumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tReturn ADD CONSTRAINT FK_tReturn_ONumber
   FOREIGN KEY (ONumber) REFERENCES tOrder (ONumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tReturn ADD CONSTRAINT FK_tReturn_RRNumber
   FOREIGN KEY (RRNumber) REFERENCES tReturnReason (RRNumber) ON DELETE No Action ON UPDATE No Action;