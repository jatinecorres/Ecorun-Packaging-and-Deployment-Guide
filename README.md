# Ecorun – Packaging and Deployment Guide

## Overview

This repository contains the packaged components required to deploy **Ecorun**.

The system processes documents from a staging location, performs validation and metadata processing, and uploads the processed files to the configured storage service.

The package includes:

* Web Application (`.war`)
* Background Services (`.jar`)
* Database initialization scripts
* Configuration files
* Deployment documentation

---

# Repository Structure

```
ecorun/
│
├── web-app/
│   └── ui-module.war
│
├── services/
│   ├── box-service.jar
│   └── ntfs-service.jar
│
├── database/
│   └── db_init.sql
│
├── config/
    ├── service.properties
    ├── db.properties
    └── config.json
```

---

# Component Description

## Web Application

**File**

```
ui-module.war
```

**Description**

Main Spring MVC application responsible for:

* Handling user requests
* Coordinating document processing
* Managing metadata and processing workflow

**Deployment Target**

```
Apache Tomcat
```

**Deployment Location**

```
TOMCAT_HOME/webapps/
```

---

# Background Services

**Files**

```
box-service.jar
ntfs-service.jar
```

**Description**

These services handle background processing tasks such as:

* Document Extarction
* Document Loading
* MetaData Generation
* File Validation

**Execution**

Run the services using Java.

Example:

```
java -jar box-service.jar jobname command port
```

```
java -jar ntfs-service.jar jobname command port
```

---

# Database Initialization

**File**

```
db_init.sql
```

**Description**

This script initializes the database schema required by the application.

It may include:

* Table creation
* Store Procedure and Functions creation
* Initial configuration data

**Database**

```
MySQL
```

**Execution**

```
mysql -u username -p database_name < database/db_init.sql
```

---

# Configuration

Configuration files are provided in the `config` directory.

```
service.properties
db.properties
config.json
```

These configuration files control:

* Database connection settings
* Storage service credentials
* Application environment settings

The required properties files should be placed in the appropriate directories as specified during deployment.

---

# Prerequisites

Ensure the following software is installed before deployment.

| Software      | Version      |
| ------------- | ------------ |
| Java          | 8            |
| Apache Tomcat | 9.0          |
| MySQL         | 5.7.25       |

---

# Deployment Steps

## Step 1 – Initialize Database

Run the database initialization script.

```
mysql -u username -p database_name < database/db_init.sql
```

---

## Step 2 – Configure Application

Place the required application binaries and configuration files in their respective locations before starting the system.

### Place Core and Service JARs

Copy the **startup, core, and service JAR files** to the following directory:

```

<APPLICATION_HOME>/lib/

```

Example files:

```

startup-core.jar
box-service.jar
ntfs-service.jar

```

### Place Configuration Files

Copy all required **properties and configuration files** to the configuration directory:

```

<APPLICATION_HOME>/config/

```

Example configuration files:

```

serivce.properties
db.properties
config.json

```

Ensure that all environment-specific values such as database connection details, storage credentials, and system paths are correctly configured before starting the application.
```


---

## Step 3 – Deploy Web Application

Copy the WAR file to Tomcat.

```
web-app/migration-service.war
```

Destination:

```
TOMCAT_HOME/webapps/
```

Start Tomcat.


---

# Verification

After deployment, verify that the application is accessible.

Application URL:

```
http://localhost:8080/ui-module
```

Check logs to confirm:

* Successful application startup
* Database connectivity
* Background service execution

---

# Logging

Logs can be found in the following locations.

**Tomcat Logs**

```
TOMCAT_HOME/logs
```

**Service Logs**

Service logs will be generated in the configured log directory defined in the application configuration.

---

# Version Information

```
Migration Platform Version: 1.0
Build Date: YYYY-MM-DD
```

---

# Support

For issues or questions, please raise an issue in this repository or contact the development team.
