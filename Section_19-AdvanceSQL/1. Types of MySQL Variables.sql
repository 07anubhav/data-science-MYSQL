/*
Scope: The block of a computer program where a variable is considered valid
Session: A series of info exchange interactions or a dialogue between computer and a user. A session begins a certain point of time and later 
	terminates at another point of time.
	Ex: A dialogue between the MySQL server and a client application like MySQL workbench
Types of MySQL variables:
1. Local	: A varibale that is only visible in the BEGIN-END block in which it was created. Ex: variables in user-defined functions 
			 (DECLARE is used to declare a local variable)
2. Session	: A variable that exists only for the session in which you are operating
			 (SET is used to declare a session variable)
3. Global	: A variable that apply to all connections related to a specific server.
			 (SET GLOBAL or SET @@global.var_name is used to declare a session variable)
             A specific group of pre-defined variables in MySQL is suitable for this job, they are called system variables.
             EX:
			a) .max_connections()	: indicates the maximum number of connections to a server that can be established at a certain point in time.
									  Ex: SET @@global.max_connections = 1;
            b) .max_join_size()		: sets the maximum memory space allocated for the joins created by a certain connection.
*/