# SQL_files_forportfolio
Collection of SQL files which displays my understanding of this tool.
Hi all, 
Welcome to my Portfolio pages which displays or atleast attempts to display some of the skills which I've self-learned.This is the first project which I posted in this page. 

# Project 1: SQL_Healthcare_Database 
This is just a small attempt from my end in creating what might look like all the details of a patient in a hospital database. A hospital database should also include details like the staff members, physicians who treat the patients etc, I have not included those tables. 

My database is called the Hospital_mgmt_db which consists of 3 tables, 1 view and a stored procedure. 

Tables:
1) patient_details
2) Patients_Health_History
3) patients_blood_pressure_level
View:
1) patient_bs_bp_level
Stored Procedure
1) BMI_calculation

- It consists of data of just 20 patients. I would like to extend the number of tables in this database and also add triggers.

-'patient_details' table consists of the basic details of the patient like patient_id, patient_name, weight, height, gender, city where patient_id is the primary key.

- 'Patients_Health_History' table consists of details like patient_id, blood_sugar_level, existing_medical_condition('yes','no'), EMC_name, Surgeries_History, No_of_surgeries.

- Since I had forgotten to add the blood_pressure_level column in the 'Patients_Health_History', I created a new table called 'patients_blood_pressure_level' table. Initially, I did try to add the column using the Alter command. When I tried to insert the values in the 'Patients_Health_History' table, it got added after the existing table ended which means the blood pressure values were only added after 20 rows, leaving the first 20 rows as null. That's when I came up with the idea of presenting them as view.

- In the View 'patient_bs_bp_level', all the details including the patient_id_patient_name, gender, height, weight, blood_sugar_level, blood_pressure_level were added. 

- Finally the stored procedure 'BMI_calculation', helps us in calculating the BMI of any patient when the patient_id is given. The input parameter in this case is the patient_id. Once, the patient_id is given, the patient_name, patient_id and the BMI is calculated and displayed. 

I understand that what I've created is just a primitive level of database and I'm open to all suggestions which will help me make a better database. 

Thanks
Anusuyaa

# Update SQL_HealthCare_Database
I have removed the Stored procedure called "BMI_calculation" and put the logic of the BMI into a new procedure called 'patient_bs_bp_level'. This new procedure contains all the basic details of a patient like name, height, weight, blood pressure level, blood sugar level and BMI (Body Mass Index: This parameter shows whether the patient is underweight, normal or overweight). We just need the call the procedure by giving the specific patient id (input parameter: p_id).

- I have added the BMI logic into the existing view 'patient_bs_bp_level'.

- I have given the same name  'patient_bs_bp_level' for procedure and view tables.
