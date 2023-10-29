<cfquery name="get_food">
  SELECT id, name from food;
</cfquery>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lucee App</title>
  </head>
  <body>
    Hello from Lucee server at <cfoutput>#cgi.server_name#</cfoutput>!
    <cfoutput>#now()#</cfoutput>
    <cfdump var="#get_food#" />
  </body>
</html>
