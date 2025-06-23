-- Table 1: Servers 
CREATE TABLE Servers ( 
    server_id INT PRIMARY KEY, 
    server_name VARCHAR(50), 
    region VARCHAR(50) 
); 
INSERT INTO Servers VALUES 
(1, 'web-server-01', 'us-east'), 
(2, 'db-server-01', 'us-east'), 
(3, 'api-server-01', 'eu-west'), 
(4, 'cache-server-01', 'us-west'); 
-- Table 2: Alerts 
CREATE TABLE Alerts ( 
    alert_id INT PRIMARY KEY, 
    server_id INT, 
    alert_type VARCHAR(50), 
    severity VARCHAR(20) 
); 
INSERT INTO Alerts VALUES 
(101, 1, 'CPU Spike', 'High'), 
(102, 2, 'Disk Failure', 'Critical'), 
(103, 2, 'Memory Leak', 'Medium'), 
(104, 5, 'Network Latency', 'Low'); -- Invalid server_id (edge case) 
-- Table 3: AI Models 
CREATE TABLE AI_Models ( 
    model_id INT PRIMARY KEY, 
    model_name VARCHAR(50), 
    use_case VARCHAR(50) 
); 
INSERT INTO AI_Models VALUES 
(201, 'AnomalyDetector-v2', 'Alert Prediction'), 
(202, 'ResourceForecaster', 'Capacity Planning'), 
(203, 'LogParser-NLP', 'Log Analysis'); 
-- Table 4: ModelDeployments 
CREATE TABLE ModelDeployments ( 
    deployment_id INT PRIMARY KEY, 
    server_id INT, 
    model_id INT, 
    deployed_on DATE 
); 
 
INSERT INTO ModelDeployments VALUES 
(301, 1, 201, '2025-06-01'), 
(302, 2, 201, '2025-06-03'), 
(303, 2, 202, '2025-06-10'), 
(304, 3, 203, '2025-06-12');  

select * from Alerts
select * from servers
select * from ModelDeployments

select alert_type , server_name
from Alerts A, Servers S
where A.server_id = S.server_id

-- alert_type | server_name
-- CPU Spike	 web-server-01
-- Disk Failure	 db-server-01
-- Memory Leak	 db-server-01

select server_name, alert_type
from Servers S
Left join Alerts A on S.server_id = A.server_id

-- server_name    | alert_type
-- web-server-01	CPU Spike
-- db-server-01	    Disk Failure
-- db-server-01	    Memory Leak
-- api-server-01	NULL
-- cache-server-01	NULL


select alert_type, server_name
from Servers S
right join Alerts A on S.server_id = A.server_id

--alert_type      | server_name
--CPU Spike	        web-server-01
--Disk Failure	    db-server-01
--Memory Leak	    db-server-01
--Network Latency	NULL

select alert_type, server_name
from Servers S
full outer join Alerts A on S.server_id = A.server_id

-- alert_type     | server_name
-- CPU Spike		web-server-01
-- Disk Failure		db-server-01
-- Memory Leak  	db-server-01
-- NULL				api-server-01
-- NULL				cache-server-01
-- Network Latency	NULL

select model_name, server_name
from AI_Models 
cross join Servers 

-- model_name		 |  server_name
--AnomalyDetector-v2	web-server-01
--AnomalyDetector-v2	db-server-01
--AnomalyDetector-v2	api-server-01
--AnomalyDetector-v2	cache-server-01
--ResourceForecaster	web-server-01
--ResourceForecaster	db-server-01
--ResourceForecaster	api-server-01
--ResourceForecaster	cache-server-01
--LogParser-NLP			web-server-01
--LogParser-NLP			db-server-01
--LogParser-NLP			api-server-01
--LogParser-NLP			cache-ser


select alert_type, severity, server_name
from Alerts A
inner join Servers S on A.server_id = S.server_id
where A.severity = 'Critical';

-- alert_type  |  severity  |  server_name
-- Disk Failure	  Critical     db-server-01

select  server_name
from Servers S
left join ModelDeployments D on S.server_id = D.server_id
where D.model_id is null

-- server_name
-- cache-server-01

select server_name, region, model_name
from Servers S
cross join AI_Models M
where S.region = 'eu-west';

-- server_name |	region	 |   model_name
-- api-server-01	eu-west		AnomalyDetector-v2
-- api-server-01	eu-west		ResourceForecaster
-- api-server-01	eu-west		LogParser-NLP
