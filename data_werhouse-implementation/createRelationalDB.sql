CREATE database test
GO

use test

create table t_date(
	ID_date date Primary Key,
)

create table t_fact(
	ID_date date Foreign Key references t_date,
)

INSERT INTO t_date values ('10-10-13')
INSERT INTO t_fact values ('10-10-13')


USE bookstoreDW
GO
sp_changedbowner 'LAPTOP-46GI6A46\User'