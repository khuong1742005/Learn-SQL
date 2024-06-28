-- Các khái niệm
/*
I. Input:
	1. Input from
		insert into (table_name) 
		values 	(values...)
	2. Input from another table
		insert into (table_name)(columns) 
		select 	(columns_from_another_table )
		from 	(another_table_name) 
		where 	/condition/ 
II. Output:
	Select (.) from (table)
	1. (.) = * : All table
	2. (.) = (column_name),... : Columns
III. Creat new table
	1. New table clearly
		create table (table_name)
		{
			/code/
		}
	2. New table from another table
		create table (table_name) 
		as select (.) 
		from 	(another_table_name)
IV. Alter table
	1. Add column
		alter table (table_name) 
		add column 	(new_column_name) (datatype) 
		// const / default + (values)
	2. Change datatype
		alter table (table_name) 
		alter column (column_name) type (datatype)
	3. Rename column
		alter table (table_name) 
		rename (column_name) to (new_name)
	4. Add constraint
		alter table (table_name) 
		add constraint 
			(constraint_name) (constraint_definition)
	5. Set NULL
		alter table (table_name) 
		alter column set (type)
V. Constraint
	1. Unique
		alter table (table_name) 
		add constraint 
			unique_(column) unique((column))	
	2. Primary Key
		alter table (table_name) 	
		add constraint 
			(column)_pk primary key((column))
	3. Foreign Key
		- create table child_table_name(
    			c1 datatype ,
    			c2 datatype references adult_table_name(p2),
			);
		- alter table child_table_name
		  	add constraint 
				(child_table_name)_fkey 
				foreign key(adult_table_name.id) 
				references adult_table_name(id)
	4. Check
		- create table (table_name)
			(
				column_name datatype check (condition)
			);
		- alter table (table_name) 
			add constraint 
				(column1)_(column2)_.._check
				check(condition)
	5. Drop Constraint
		alter table (table_name)		
		drop constraint (constraint_name)
VI. Update
	1. Update in current table
		update 	(table_name)
		set column1 = values1,	
			column2 = values2
		where 	(condition)
	2. Update from values/column from another table
		update 	(table1_name)
		set column_need_update = (table2_name).column_update
		from 	(table2_name)
		where 	(addition)
	3. Drop column
		- alter table (table_name) 
			drop column (column_name)
	-> if exists : if exists column then return detele, else return nothing
	-> cascade : delete any relation of this column in current table
		-> alter table (table_name) 
				drop column if exists (column_name) cascade
	4. Drop table
		drop table if exists (table_name)
VII. Delete
	1. Clear table
		- delete from (table_name)
		- truncate table 
			(table1_name), (table2_name),.. // can be add cascade to remove foreign key
		-> truncate is faster
	2. Delete on codition 
		delete from (table_name) 
		where (condition)
		- exp for condition: not in (sth) -> delete all values diff sth	
VIII. Data normalization (chuẩn hóa dữ liệu)
	- Data Redundancy : dư thừa dữ liệu
	- Insertion anomalies : chèn dị thường
	- Updation anomaly : cập nhật dị thường
	- Deletion anomaly : xóa dị thường

	1. 1NF (1st normal form) : Values must be atomic, which means the value cannot be divided into smaller units.
	2. 2NF (2nd normal form) : Achieves the 1NF and non-key columns depend only on the PRIMARY KEY of the table.
		- Often use foreign key to creat a new table
	3. 3NF (3rd normal form) : Achieves the 2NF. Must not exists transitive dependency in a table, means 
		non-key columns depend only on the PRIMARY KEY of the table.
		- Transitive Dependency (phụ thuộc bắc cầu) : is some realtion in the table at least 3 column that have X, Y, Z
		Values Y will be determined if values X is determined, Z and Y is the same and Z depend on X but not a relation.
IX. Select Statement
	1. Name alias
		- For column: select (column_name) as (name_alias) 
						from (table_name)
		- For table: select (list_column) 
						from (table_name) as (name_alias)
			exp: select t.column_name from very_long_name_table t
	2. Cast Operator
		expression :: data_type
	3. Round
		round (values, n)
	4. Order by
		- order by (column_name) : crease
		- order by (column_name) desc : decrease
	5. Select Distinct : unique values
		- select distinct (column_name) 
					from (table_name) order by (column_name)
		- can choose many column and compare values of these column
X. Filter the data
	1. Filter data
		select * from (table_name) 
		where (condition)
		- in (values_input) : compare values in table and values_input
	2. Like and Not Like and Similar to and ilike
		- where 
			(column_name) like/not like '(...)'
			(...) : % (string) / _ (char)
			exp: Khuong -> 'K%' / '%uon%' / '%ng'...
		- where (column_name) 
			similar to '%(values1|values2|...)%'
			(...) : many values need compare
		- where 
			((column_name) like (compare1) or 
			(column_name) like (compare2)) : compare in many condition
		- where 
			(column_name) ilike '(...)' : ilike no distinction uppercase and lowercase letter
	3. Between and not between
		select * from (table_name) 
		where (column_name) 
			between (lower_value) and (higher_value)
	4. Limit
		select * from (table_name) 
		order by (column_name) limit (n)
		- will return (n) rows
	5. Offset
		select * from (table_name) 
			order by (table_name) limit (n) offset (m)
		- pass m rows
	6. Is null & is not null
		values is null / is not null
XI. Group
	1. Inner join (select values from 2 table)
		select A.(Column_name),..., (Column_name_of_B),... 
		from A inner join B 
		on (addition)
	2. Left join
		select A.pka, A.c1, B.pkb, B.c2 
		from A left join B 
		on (addition)
	#COMPARE inner join and left join
		-> Inner join:
			- You only want to get data in both tables.
			- Remove values not equal from both tables.
		-> Left join:
			- You want to get all the data from the left table, along with matching data from the right table.
	3. Using
		using allows you to reference another table
	4. Self-join
		select (list_column_name) 
		from A a1 inner join A a2 
		on (addition)
	5. Coalesce
		coalesce(values1, values2,...) = null if all values is null, = values if meet first values diff null
			- exp: select coalesce((column1_name), 'Unknown') as (column1_name) 
	6. Group by
# FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> DISTINCT -> ORDER BY -> LIMIT
		select 	(column1_name),
				(column2_name),
					....	  ,
				aggregate_function(column_3)
		from (table_name)
		group by 
				(column1_name),
				(column2_name),
XII. Math (rename later)
	1. Case
		Case 	when (addition1) then (return_value1), 
				when (addition2) then (return_value2), 
				... 
				end 
		- select (column_name), 
			case when (addition) then (return_value) 
			ELSE (return_value) 
			end 
			as (name_alias) 
			from (table_name)
		- update (table_name) 
			set (column_name) = case when....
	2. Max/Min
		select max/min((column_name)) as (name_alias) 
		from (
			select (column_name) from (table_name) 
			group by (column_name) 
			having (addition) )	
	3. AVG
		avg((column_name))

*/
