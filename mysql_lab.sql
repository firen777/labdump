/* custom notation:
    %P means primary key
    %U means unique
    %Sec means secondary key
    %F means foreign key
    %NN means non-null
*/

SHOW DATABASES;

USE `database_name`;

/* foreign key:
    column used to reference other column (that is %P or at least %U) from other database
    !Must be same data type!
    %F, %P, %U make up constraints
*/

/* Index:
    used to increase speed to work with column.
    %P and %U is automatically indexed by DB
    but NOT %F
*/

/* one-to-one relationship
    users:
    id%P, firstname, lastname
    7, albert, chan
    8, davis, belmont
    9, johnathon, fernadez
    -----------------
    item_lists:
    id%P, user_id%U, item
    1, 7, thingy1
    2, 8, thingy2
    3, 9, thingy3
*/

/* one-to-many relationship
    users:
    id%P, firstname, lastname
    7, albert, chan
    8, davis, belmont
    9, johnathon, fernadez
    -----------------
    item_lists:
    id%P, user_id, item
    1, 7, thingy1
    2, 7, thingy2
    3, 8, thingy3
*/

/* many-to-many relationship
    ...
    ...
    ...
    keep track of multiple one-to-many tables
*/


/* Entity integrity
    NEVER CHANGE Primary/Unique Key //change means new data? or same data got changed??!!
    surrogate key: computer generated
    natural key: human input
*/

/* Referential integrity
    %F put more restriction on database. 
    Otherwise, DB don't know shit about the relationship b/w tables and there will no be check
    can be config ON DELETE, ON UPDATE
*/

/* Domain integrity
    The integrity of data such as data type (INTEGER, STRING...), data range (1~100(difficult in MySQL), ENUM...), etc.
    https://stackoverflow.com/questions/16073268/sql-integer-range-when-creating-tables

*/

/* Primary Key
    the usual... %U %NN by default
    surrogate and natural...
    
    Also: composite key
        for intermediate table (many-to-many's intermediate table)
*/

/* Foreign Key cont.
    foreign key itself is NOT %U or %NN
    relationship kinda like child table has a foreign key column that reference parent table's column
    ON DELETE and ON UPDATE
        RESTRICT (default, aka NO ACTION, may be different in other type of DB)
            Cannot even delete "parent" row, throw ERROR
        CASCADE
            Do the same to the child.
        SET NULL
*/

/* misc key words:
    attribute and constraint
*/

/* Normalization:
    Normal Form (NF)
    1st NF: 
    2nd NF:
    3rd NF:
    must be done in sequential order
*/



/* JOIN function, from Reddit memes:
=======================================================
https://www.reddit.com/r/ProgrammerHumor/comments/a0qp9x/this_ones_for_all_the_sql_developers_out_there/eajxngi/

I have a person table, which contains all of my people. Each person is identified by a PersonID. 

I have a sales table, which contains some information about all of the sales I've made. Part of this information is the person who the sale was made to, which is identified by sales.PersonID.

To find sales information and the person details for a given person we can query eg:

Select person.firstname,person.lastname, sales.timedate,sales.paymentvalue from sales inner join person on person.personid=sales.personid where person.personid='25'

Hope that makes sense.

-------------------------------------------------------
https://www.reddit.com/r/programming/comments/ad1bo5/say_no_to_venn_diagrams_when_explaining_joins/

I was taught the Puritan church model for joins. It’s a little corny and maybe hasn’t aged particularly well, but gets the job done. It goes something like this:

Imagine a Puritan church where the men sit on one side, the women on the other.

An INNER JOIN is when the married couples hold hands and leave at the end, leaving all the singles behind.

A LEFT JOIN is when the women all leave - the married ones take their husbands and the single women go alone.

A RIGHT JOIN is the same thing, except the men all leave and take the wives and leave the single women behind. It’s rude to do this, in a Puritan church and in your SQL.

A FULL OUTER JOIN is a fire drill and everyone leaves, married couples together.

And a CROSS JOIN is a swingers party and should never happen in a Puritan church nor your SQL.

~~~~~~~~~~~~~~~
Cross joins have legitimate use to create new data or relationships where there is no current relationship between two entities.  
Say you're bulk adding data, you add some users, you add some modules, 
then use a cross join to get all combinations of users and modules to then use that data to insert into a permissions table to 
dictate which users can access which modules.
~~~~~~~~~~~~~~~
They also have some legitimate uses with lateral joins. 
Instead of writing `INNER JOIN LATERAL (SELECT ...) AS subq ON true` 
it can be clearer to do write `CROSS JOIN LATERAL (SELECT ...) AS subq` 
since lateral joins often lack intersting join clauses.

*/

-----------------------------------------------------------------------------------------------------

/* Operation tutorial*/

/* On quote vs back-tick:
    https://stackoverflow.com/questions/11321491/when-to-use-single-quotes-double-quotes-and-back-ticks-in-mysql
    > Backticks are to be used for table and column identifiers, but are only necessary when the identifier is a MySQL reserved keyword, or when the identifier contains whitespace characters or characters beyond a limited set (see below)
    > Single quotes should be used for string values like in the VALUES() list
    example:
    ```
    INSERT INTO `table` (`id`, `col1`, `col2`, `date`, `updated`) 
                       VALUES (NULL, 'val1', 'val2', '2001-01-01', NOW())
    ```

*/

CREATE DATABASE `test1`;

USE `test1`;

SELECT DATABASE();
/*show currently selected DB:
    +------------+
    | DATABASE() |
    +------------+
    | test1      |
    +------------+
*/

CREATE TABLE `student`(
`first_name` VARCHAR(30) NOT NULL,
`last_name` VARCHAR(30) NOT NULL,
`email` VARCHAR(60) NULL,
`street` VARCHAR(50) NOT NULL,
`city` VARCHAR(40) NOT NULL,
`state` CHAR(2) NOT NULL DEFAULT 'PA', --fixed length
`zip` MEDIUMINT UNSIGNED NOT NULL,
`phone` VARCHAR(20) NOT NULL,
`birth_date` DATE NOT NULL,
`sex` ENUM('M', 'F') NOT NULL,
`date_entered` TIMESTAMP,
`lunch_cost` FLOAT NULL,
`student_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

SHOW TABLES;

/* Atomic Tables:
    Every table should focus on describing JUST one thing (customer, student, item etc.)
    Don't have redundant column (no property1, property2, property3 etc. (one-to-many))
    Don't have multiple val in one col
    Normalization (explain later)
*/

/* On the subject of Type:
    CHAR: fixed length char string
    VARCHAR: Vari length char string
    BLOB: 2^16 bytes data
    BIGINT: 64 bit int
    FLOAT: float 
    DOUBLE: double
    ENUM: analogy- radio fields (only accepted values are those listed, may only choose one)
    SET: analogy- checkbox fields (only accepted values are those listed, may choose multiple)
*/

DESCRIBE `student`; -- show schema

INSERT INTO `student` VALUES('Dale', 'Cooper', 'dcooper@aol.com', 
	'123 Main St', 'Yakima', 'WA', 98901, '792-223-8901', "1959-2-22",
	'M', NOW(), 3.50, NULL);