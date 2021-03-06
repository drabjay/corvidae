# Corvidae

An implementation of a web application using the thick database paradigm;
using [Flyway](http://flywaydb.org/) to manage migrations.

## Requirements

* [Oracle 11g XE](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html) instance
* Installation of [Flyway](http://flywaydb.org/) command-line tool
* [Oracle Database 11g Release 2 JDBC Drivers](http://www.oracle.com/technetwork/database/enterprise-edition/jdbc-112010-090769.html) placed in [Flyway](http://flywaydb.org/)'s drivers directory
* **Optionally**: [ruby-plsql-spec](https://github.com/rsim/ruby-plsql-spec) to run unit tests

## Installation

* Set the appropriate values in the [Flyway](http://flywaydb.org/) configuration files
* Run `./deploy.sh`

## Testing

* Set the appropriate values in the plsql-spec `spec/database.yml` file
* Run `plsql-spec run` to run unit tests
