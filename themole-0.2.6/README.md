------------------------------------------------------------------------
#       The Mole v0.2.5
------------------------------------------------------------------------


-------------------------------- About ---------------------------------
The Mole is a command line interface SQL Injection exploitation tool.
This application is able to exploit both union-based and blind
boolean-based injections.

Every action The Mole can execute is triggered by a specific command.
All this application requires in order to exploit a SQL Injection is
the URL(including the parameters) and a needle(a string) that appears in
the server's response whenever the injection parameter generates a valid
query, and does not appear otherwise.

So far, The Mole supports Mysql, Mssql and Postgres, but we expect to
include other DBMSs.

-------------------------------Running----------------------------------
In order to execute The Mole, you require only python3 and python3-lxml.
Once you execute it, a shell prompt will be printed, waiting for
commands. You can additionally use some program arguments:

-u URL: Use this to set the URL which contains the vulnerability. This
is the same as using the "url" command.

-n NEEDLE: Use this to set the needle to be found in the requested page.
This is the same as using the "needle" command.

-t THREADS: Use THREADS threads while performing queries. (Can't be
changed at runtime)

------------------------------ Commands --------------------------------
This is a list of all supported commands:

- url [URL [PARAM]]: Gets/sets the URL. If PARAM is given then the
injection will be performed on that argument. This can also be provided
as an argument to the application, using the "-u" parameter.

- needle [NEEDLE]: Gets/sets the NEEDLE. This can also be provided as an
argument to the application, using the "-n" parameter.

- method (GET|POST <param_post> ) [injectable_field]: Sets the method of
the request to GET or POST. In case POST is given the param_post string
will be used as the POST parameters. If injectable_field is given then
the mole will use this parameter to inject.

- dbinfo: Fetch current user name, database name and DBMS version.

- schemas: Fetchs the schemas(databases) from the server. The results
obtained will be cached, so further calls to this command will return
the cached entries. See "fetch" command.

- tables <SCHEMA>: Fetchs the tables for the schema SCHEMA. The results
obtained will be cached, so further calls to this command will return
the cached entries. See "fetch" command.
e.g: "tables mysql"

- columns <SCHEMA> <TABLE>: Fetchs the columns for the table TABLE, in
the schema SCHEMA. The results obtained will be cached, so further calls
to this command will return the cached entries. See "fetch" command.
e.g: "columns mysql user"

- recursive (schemas|tables <SCHEMA>): Recursively fetches the structure
of all schemas or just of the SCHEMA if used with tables.

- query <SCHEMA> <TABLE> COLUMN1[,COLUMN2[,COLUMN3[...]]] [where COND]:
Perform a query to fetch every column given, using the table TABLE
located in the schema SCHEMA. A "where condition" can be given. Note
that The Mole will take care of any string conversions required on the
condition. Therefore, you can use string literals(using single quotes)
even if the server escapes them. Note that no caching is performed
when executing this command.
e.g: query mysql user User,Password where User = 'root'

- fetch <schemas|tables|columns> [args]: This command calls schemas,
tables or columns commands depending on the arguments given, forcing
them to refetch entries, even if they have already been dumped. This
is useful when, after having stopped a query in the middle of it, you
want to fetch all of the results and not just those that you were able
to dump before stopping it.
e.g: "fetch columns mysql user"

- readfile <FILE>: Read the FILE from the remote server (if possible)
and print it.

- find_tables <SCHEMA> <TABLE1> [<TABLE2>, ...]: Bruteforce to find if
the TABLES given as parameters are part of the SCHEMA. Useful for MySQL
version 4 where no information_schema available.

- find_tables_like <SCHEMA> <FILTER>: Perform a query to extract all
tables from SCHEMA that match the LIKE filter given as param FILTER.

- find_users_table <SCHEMA>: Bruteforce to find tables in SCHEMA that
match common names for tables where usernames are stored.

- cookie [COOKIE]: Gets/sets a cookie to be sent in each HTTP request's
headers.

- mode <union|blind>: Sets the SQL Injection exploitation method. By
default, union mode is used. If the injection cannot be exploited using
this mode, change it to blind using "mode blind" and try again. Nothing
else has to be configured to go from union to blind mode, as long as you
have already set the URL and needle.

- prefix [PREFIX]: Gets/sets the prefix for each request. The prefix
will be appended to the URL's vulnerable parameter on each request.

- suffix [SUFFIX]: Gets/sets the suffix for each request. The suffix
will be appended after the injection code on the URL's vulnerable
parameter.

- verbose <on|off>: Sets the verbose mode on and off. When this mode is
on, each request's parameters will be printed out.

- output <pretty|plain>: Sets the output style. When pretty output mode
is enabled(this is the default), queries result will be printed on a
tidy box, using column names and each row will be aligned. The drawback
is that this method requires the whole query to finish before printing
results, so you might want to use "plain" output if you seek immediate
results. In contrast, plain mode prints each result as soon as it is
recovered.
e.g:
Pretty output might print results like this:

+-----------------------------------------------------+
| User    | Password                                  |
+-----------------------------------------------------+
| blabla  | *2B0DDEE3597240B595689260B53D411F515B806D |
| foobar  | *641B2485F1789F7A6BEE986648B83A899D96793B |
+-----------------------------------------------------+

While plain output will print them like this:

User, Password:
blabla, *2B0DDEE3597240B595689260B53D411F515B806D
foobar, *641B2485F1789F7A6BEE986648B83A899D96793B

- delay [DELAY]: Gets/Sets the delay between requests. Use this
if the server contains some kind of IPS system that returns HTTP error
when executing lots of requests in a short amount of time. Note that
DELAY can be a floating point number, so you can set "0.5" as the
delay.

- headers <set|del> <HEADER> [VALUE]: Sets/removes the given HTTP
header. Use this to set the User-Agent, cookie, or whatever additional
header you want to send.

- qfilter <add|config|del> <FILTER> [ARGS]: Add/configure/remove query 
filters. Query filters are applied to each query before appending it to 
the vulnerable parameter. So far, these can be used to either bypass an 
IPS/IDS or to apply a filter when SQL Server requires you to change the
collation of the retrieved fields.

- htmlfilter <add|del> <FILTER> [ARGS]: Adds/removes an html filter. 
Html filters are applied to the data retrieved from the server. In some
cases, invalid HTML can make The Mole miss the injection, so you might
want to use a regular expression in order to fix it.

- export <TYPE> [<ARG1>, ...]: Exports the current mole configuration
and the dumped schema's structures for later usage.
Currently supported types and params:
    + xml <FILE>: exports the configuration to an xml file.

- import <TYPE> [<ARG1>, ...]: Imports a previously exported mole
configuration and dumped schema's structures.
Currently supported types and params:
    + xml <FILE>: imports the configuration from an xml file.

- usage <COMMAND>: Print the usage for the command COMMAND.

- exit: Exit The Mole.


------------------------------------------------------------------------
------------------------------------------------------------------------
Developed by Nasel(http://www.nasel.com.ar).
Authors:
Matías Fontanini
Santiago Alessandri
Gastón Traberg

Please visit http://sourceforge.net/projects/themole/ to download the
latest release.
