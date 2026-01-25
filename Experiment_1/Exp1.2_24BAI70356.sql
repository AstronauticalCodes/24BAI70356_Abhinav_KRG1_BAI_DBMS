INSERT INTO books (id, name, author_name, count) 
VALUES (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 5);

SELECT 
    table_name, 
    privilege_type 
FROM 
    information_schema.table_privileges 
WHERE 
    grantee = 'librarian';