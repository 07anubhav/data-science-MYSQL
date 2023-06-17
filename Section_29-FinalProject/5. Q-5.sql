/*
Retrieve a list of all employees from the ‘titles’ table who are engineers. 
Repeat the exercise, this time retrieving a list of all employees from the ‘titles’ table who are senior 
engineers.
*/
SELECT 
    *
FROM
    titles
WHERE
    title LIKE '%Engineer%';
    
SELECT 
    *
FROM
    titles
WHERE
    title like '%Senior Engineer%';