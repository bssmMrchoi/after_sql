use employee;

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


ALTER TABLE tEmployee ADD CONSTRAINT FK_tEmployee_DNumber
   FOREIGN KEY (DNumber) REFERENCES tDepartment (DNumber) ON DELETE No Action ON UPDATE No Action;
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


