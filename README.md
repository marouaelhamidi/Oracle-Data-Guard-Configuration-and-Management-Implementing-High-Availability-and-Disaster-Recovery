# Oracle-Data-Guard-Configuration-and-Management-Implementing-High-Availability-and-Disaster-Recovery
This project focuses on configuring Oracle Data Guard on two Windows machines (db1 and db2) using Oracle 19c. The goal is to ensure high availability, data redundancy, and disaster recovery by setting up the primary and standby databases, enabling the managed recovery process (MRP), and performing failover and switchover operations.

---

# # **Data Guard Release 2 Administration**

## ## **I. Theoretical Part**

### ### **My Configuration**
- **Oracle 19c**
- **Oracle Windows 10**
- **2 Windows Boxes** - db1 and db2

Ensure that the servers/machines can communicate with each other. There should be no firewall blocking between the two machines/servers.

### ### **1. Involved Steps and Overview**
1. Create a primary database
2. Create a standby database from the primary
3. Enable the Managed Recovery Process (MRP)
4. Test Data Guard Log Shipping
5. Enable the Data Guard Broker
6. Enable the Fast-Start Failover
7. Add a third standby
8. Test the standby database with a dummy database.

---

## ## **Part 1: Data Guard Configuration**

### ### **On the Primary Database:**
1. Create the primary database
2. Configure the primary database in ARCHIVELOG mode
3. Enable FORCE LOGGING
4. Enable FLASHBACK ON
5. Set DB_UNIQUE_NAME
6. Create the PFILE
7. Configure listener.ora
8. Configure tnsnames.ora

### ### **On the Standby Database:**
1. Copy the PFILE to the Standby and edit its parameters
2. Start the Standby in NOMOUNT mode
3. Perform RMAN ACTIVE DUPLICATION
   a) The primary database must be connected as TARGET  
   b) The standby database must be connected as AUXILLARY  
   c) Use the RMAN DUPLICATE TARGET DATABASE FOR STANDBY command
4. Create the standby control file

### ### **On the Primary Database - Set Data Guard Parameters:**
1. Configure LOG_ARCHIVE_DEST_1 for local archiving
2. Configure LOG_ARCHIVE_DEST_2 for shipping to the standby service
3. Set LOG_ARCHIVE_CONFIG to include the unique names of the primary and standby databases
4. Set FAL_CLIENT to the local service name
5. Set FAL_SERVER to the remote service name
6. Configure STANDBY_FILE_MANAGEMENT to AUTO
7. Set up the Standby Redo Log (SRL) files

---

## ## **Part 2a: Data Guard Broker Configuration**

1. Set DG_BROKER_START to TRUE on the primary database.
2. Set DG_BROKER_START to TRUE on the standby database.
3. Configure DG_BROKER_CONFIG_FILE
4. Create the Data Guard configuration and add the primary database
5. Add the standby database to the Data Guard configuration
6. Set the Data Guard StaticConnectIdentifier property with the connection identifier that the DGMGRL client will use when starting the database instances
7. Enable the configuration
8. Perform a switchover using the Data Guard broker

---

## ## **Part 2b: Enable Fast-Start Failover**

1. Set 'LogXptMode'='sync' for the primary database.
2. Set 'LogXptMode'='sync' for the standby.
3. Set the protection mode to maxavailability
4. Enable the configuration
5. Enable the Fast-Start Failover feature
6. Enable the Observer.

---

## ## **Part 3: Add a Third Standby**

1. Copy the PFILE to the Standby and edit its parameters
2. Start the Standby in NOMOUNT mode
3. Perform RMAN ACTIVE DUPLICATION
   a) The primary database must be connected as TARGET  
   b) The standby database must be connected as AUXILLARY  
   c) Use the RMAN DUPLICATE TARGET DATABASE FOR STANDBY command
4. Create the standby control file
5. Set the Data Guard parameters (same as the primary)
6. Start the MRP
7. Set DG_BROKER_START to TRUE on the third standby.
8. Add the standby to the Data Guard broker configuration.
9. Set 'LogXptMode'='sync' for the third standby
10. Set the Data Guard StaticConnectIdentifier property with the connection identifier that the DGMGRL client will use when starting the database instances.
11. Enable the configuration
12. Display the configuration

---

### ### **Test the Standby Database with a Dummy Database.**

**Software Used:**
- **Oracle Database 19c**
- **Windows Server 2019**

**Important Note:**  
Ensure that the two servers/machines can communicate with each other. There should be no firewall blocking between these two machines/servers.

---

### ### **High-Level Steps:**
1. Create a listener on both the Primary and the Standby
2. Create the primary database
3. Convert the primary database to ARCHIVELOG mode
4. Set specific configuration parameters for the primary database
5. Enable archive log shipping on the primary database
6. Set up connectivity between the primary and standby databases (tnsnames.ora)
7. Duplicate the primary database onto the standby
8. Set specific configuration parameters for the standby database
9. Start MRP on the standby

---

### ### **Important Data Guard Configuration Parameters:**
- **FAL_CLIENT**  
  Specifies the FAL (fetch archive log) client used by the FAL service.

- **FAL_SERVER**  
  Specifies the FAL server for a standby database.

- **LOG_ARCHIVE_CONFIG**  
  Enables or disables archive log shipping to remote destinations.

- **DG_CONFIG**  
  Specifies a list of unique database names for all the databases in the Data Guard configuration.

- **STANDBY_FILE_MANAGEMENT**  
  Enables or disables automatic management of standby files.

---

