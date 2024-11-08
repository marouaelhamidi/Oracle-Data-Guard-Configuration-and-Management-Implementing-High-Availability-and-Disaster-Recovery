edit database orap set property 'LogXptMode'='sync';
edit database oras set property 'LogXptMode'='sync';
edit configuration set protection mode as maxavailability;
enable  configuration;
enable fast_start failover;
show configuration;
show fast_start failover;
