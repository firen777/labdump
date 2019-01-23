SHOW DATABASES;

USE `database_name`;

/*
JOIN function, from Reddit memes:
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