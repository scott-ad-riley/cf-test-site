component displayname="Application" output="false" hint="Handle the application" {
  /**
	* Returns the given environment variable value; or, the fallback if the variable is
	* either UNDEFINED or EMPTY.
  * source: https://www.bennadel.com/blog/4140-reading-environment-env-variables-from-the-server-scope-in-lucee-cfml-5-3-7-47.htm
	*/
	public string function env(
		required string name,
		string fallbackValue = ""
		) {
		// In Lucee CFML, we can access the environment variables directly from the
		// SERVER SCOPE.
		var value = ( server.system.environment[ name ] ?: "" );
		// For the sake of the demo, we're treating an EMPTY value and a NON-EXISTENT
		// value as the same thing, using the given value only if it is populated.
		return( value.len() ? value : fallbackValue );
	}

  private string function dbConnectionStr() {
    return env("DB_URL");
  }

  this.datasources["mydatabase"] = {
    'class': "org.postgresql.Driver",
    'bundleName': "org.postgresql.jdbc",
    'bundleVersion': "42.6.0",
    'connectionString': "jdbc:#dbConnectionStr()#",
    'username': env("DB_USER"),
    'password': env("DB_PASSWORD"),

    // optional settings
    'connectionLimit':-1, // default:-1
    'liveTimeout':15, // default: -1; unit: minutes
    'validate':false, // default: false
  };
  this.defaultdatasource = "mydatabase";
}
