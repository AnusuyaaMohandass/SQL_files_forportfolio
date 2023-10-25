
CREATE DATABASE Hospital_mgmt_db;
CREATE TABLE IF NOT EXISTS Hospital_mgmt_db.patient_details
(
	patient_id int primary key not null,
	patient_name varchar(50),
	age int,
    gender enum('M', 'F'),
	weight decimal(10,2),
	height decimal(10,2),
	city varchar(50)
);

DROP TABLE IF EXISTS Hospital_mgmt_db.patient_details;
CREATE TABLE Hospital_mgmt_db.Staff
(
	hospital_id int primary key not null,
    first_name varchar(50),
    last_name varchar(50),
    age int,
    designation varchar(50),
    join_date date,
    last_date date,
    contact_ext int
    );
    
CREATE TABLE Hospital_mgmt_db.Patients_Health_History
(
	patient_id int,
    blood_sugar_level decimal(10,2),
    Existing_Medical_Conditions enum('yes', 'no'),
    EMC_name varchar(50),
    Surgeries_History enum('yes', 'no'),
    No_of_Surgeries int
    );


INSERT INTO Hospital_mgmt_db.patient_details
(
	patient_id,
	patient_name,
	age,
    gender,
	weight,
	height,
	city
)
VALUES(201001, 'Madhavan Kutty', 59, 'M', 60, 170, 'Chennai'),
(201002, 'Madhavan Paresh', 46, 'M', 70, 170, 'Chennai'),
(201003, 'Mariamma George', 52, 'F', 65, 160, 'Chennai'),
(201004, 'Mohammed Rafi', 32, 'M', 70, 170, 'Chennai'),
(201005, 'Paresh Rawal', 45, 'M', 72, 175, 'Delhi'),
(201006, 'Manish Parul', 36, 'M', 70, 170, 'Mumbai'),
(201007, 'Karishma Paresh', 29, 'F', 70, 160, 'Chennai'),
(201008, 'Karishma Kapoor', 30, 'F', 70, 160, 'Pune'),
(201009, 'Rutuja Paresh', 35, 'F', 70, 160, 'Indore'),
(201010, 'Karishma Paresh', 29, 'F', 70, 160, 'Chennai'),
(201011, 'Alia Kapoor', 34, 'F', 52, 160, 'Jaipur'),
(201012, 'Priyamani Gupta', 37, 'F', 70, 160, 'Chennai'),
(201013, 'Nana Patekar', 65, 'M', 70, 160, 'Delhi'),
(201014, 'Sunny Deol', 64, 'M', 70, 160, 'Manali'),
(201015, 'Abhay Singh', 29, 'M', 70, 160, 'Lucknow'),
(201016, 'Happy Singh', 26, 'M', 70, 180, 'Mohali'),
(201017, 'Diya Sharma', 19, 'F', 85, 160, 'Lucknow'),
(201018, 'Harpreet Kaur', 26, 'F', 70, 180, 'Mohali'),
(201019, 'Rani Singh', 30, 'F', 70, 180, 'Mohali'),
(201020, 'Mann Singh', 26, 'M', 70, 180, 'Lucknow');

Select * from Hospital_mgmt_db.Patients_Health_History;
INSERT INTO Hospital_mgmt_db.Patients_Health_History
VALUES(201001, 100.56, 'yes', 'diabetes', 'no', '0'), 
(201002, 91.86, 'no', 'nil', 'no', '0'), 
(201003, 75.74, 'yes', 'diabetes', 'no', '0'), 
(201004, 150.65, 'no', 'nil', 'no', '0'), 
(201005, 170.76, 'yes', 'diabetes', 'yes', '1'), 
(201006, 95.86, 'no', 'nil', 'no', '0'), 
(201007, 200.00, 'yes', 'diabetes', 'yes', '1'), 
(201008, 100.56, 'yes', 'diabetes', 'no', '0'), 
(201009, 91.86, 'no', 'nil', 'no', '0'), 
(201010, 75.74, 'yes', 'hypertension', 'yes', '1'), 
(201011, 150.65, 'yes', 'diabetes', 'no', '0'), 
(201012, 170.76, 'yes', 'diabetes', 'yes', '2'), 
(201013, 95.86, 'yes', 'hypertension', 'no', '0'), 
(201014, 100.56, 'yes', 'diabetes', 'yes', '1'), 
(201015, 91.86, 'no', 'nil', 'no', '0'), 
(201016, 75.74, 'yes', 'hypertension', 'no', '0'), 
(201017, 150.65, 'yes', 'diabetes', 'yes', '2'), 
(201018, 170.76, 'yes', 'diabetes', 'no', '0'), 
(201019, 95.86, 'no', 'nil', 'no', '0'), 
(201020, 200.00, 'yes', 'diabetes', 'yes', '1');

CREATE TABLE Hospital_mgmt_db.patients_blood_pressure_level
(
patient_id int primary key,
blood_pressure_level varchar(50)
);

INSERT INTO Hospital_mgmt_db.patients_blood_pressure_level
VALUES(201001, '120_90'),
(201002, '135_80'),
(201003, '119_81'),
(201004, '120_80'),
(201005, '135_80'),
(201006, '130_80'),
(201007, '130_80'),
(201008, '130_80'),
(201009, '130_80'),
(201010, '130_80'),
(201011, '130_80'),
(201012, '120_80'),
(201013, '130_80'),
(201014, '125_80'),
(201015, '130_80'),
(201016, '130_80'),
(201017, '130_80'),
(201018, '130_80'),
(201019, '130_80'),
(201020, '120_80');


/*Displaying the basic details of patient like blood_pressure, blood_sugar, weight, height, gender, BMI*/
CREATE OR REPLACE VIEW patient_bs_bp_level AS
    SELECT 
        ph.patient_id, pd.patient_name, pd.height, pd.weight, pd.gender, ph.blood_sugar_level, bp.blood_pressure_level, cast(ROUND(pd.weight / POWER(pd.height/100, 2), 3) as decimal(10,2)) as BMI
    FROM
        Hospital_mgmt_db.Patients_Health_History ph
            JOIN
        Hospital_mgmt_db.patients_blood_pressure_level bp ON ph.patient_id = bp.patient_id
			join
		Hospital_mgmt_db.patient_details pd on ph.patient_id = pd.patient_id;
        
SELECt * from patient_bs_bp_level;


/*Displaying the basic details of a specific patient like blood_pressure, blood_sugar, weight, height, gender through procedure with the help pf their patient_id*/
DELIMITER $$
USE Hospital_mgmt_db $$
CREATE procedure patient_bs_bp_level (IN p_id INT)
BEGIN
SELECT 
        ph.patient_id, pd.patient_name, pd.height, pd.weight, pd.gender, ph.blood_sugar_level, bp.blood_pressure_level, cast(ROUND(pd.weight / POWER(pd.height/100, 2), 3) as decimal(10,2)) as BMI
    FROM
        Hospital_mgmt_db.Patients_Health_History ph
            JOIN
        Hospital_mgmt_db.patients_blood_pressure_level bp ON ph.patient_id = bp.patient_id
			join
		Hospital_mgmt_db.patient_details pd on ph.patient_id = pd.patient_id
	WHERE p_id = ph.patient_id;
END $$
DELIMITER ;
