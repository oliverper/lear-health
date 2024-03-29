-- ---
-- Globals
-- ---

DROP DATABASE IF EXISTS `Ilera`;

CREATE DATABASE `Ilera`;

USE Ilera;



-- ---
-- Table 'patient'
--
-- ---

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `first` VARCHAR(30) NULL DEFAULT NULL,
  `last` VARCHAR(30) NULL DEFAULT NULL,
  `email` VARCHAR(30) NOT NULL,
  `password` VARCHAR(300) NULL DEFAULT NULL,
  `pin` INTEGER(4) NULL DEFAULT NULL,
  `date_of_birth` DATE NULL DEFAULT NULL,
  `address` VARCHAR(60) NULL DEFAULT NULL,
  `city` VARCHAR(60) NULL DEFAULT NULL,
  `state` VARCHAR(2) NULL DEFAULT NULL,
  `zip` VARCHAR(10) NULL DEFAULT NULL,
  `phone_number` VARCHAR(20) NULL DEFAULT NULL,
  `weight` INTEGER NULL DEFAULT NULL,
  `height` INTEGER NULL DEFAULT NULL,
  `blood_type` VARCHAR(3) NULL DEFAULT NULL,
  `photo_path` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'physician'
--
-- ---

DROP TABLE IF EXISTS `physician`;

CREATE TABLE `physician` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `first` VARCHAR(30) NULL,
  `last` VARCHAR(30) NULL,
  `email` VARCHAR(30) NULL,
  `phone_number` VARCHAR(20) NULL,
  `password` VARCHAR(300) NULL,
  `photo_path` VARCHAR(300) NULL,
  `specialty` VARCHAR(500) NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'appointment'
--
-- ---

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `date` DATE NULL DEFAULT NULL,
  `time` TIME NULL DEFAULT NULL,
  `notes` VARCHAR(10000) NULL DEFAULT NULL,
  `id_physician` INTEGER DEFAULT NULL,
  `id_patient` INTEGER DEFAULT NULL,
  `id_institution` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Patient_Form'
--
-- ---

DROP TABLE IF EXISTS `Patient_Form`;

CREATE TABLE `Patient_Form` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `doctor_notes` VARCHAR(5000) NULL DEFAULT NULL,
  `id_physician` INTEGER DEFAULT NULL,
  `id_patient` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'medication'
--
-- ---

DROP TABLE IF EXISTS `medication`;

CREATE TABLE `medication` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `drug_name` VARCHAR(100) NULL DEFAULT NULL,
  `details` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'institution'
--
-- ---

DROP TABLE IF EXISTS `institution`;

CREATE TABLE `institution` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `inst_name` VARCHAR(30) NULL DEFAULT NULL,
  `type` VARCHAR(25) NULL DEFAULT NULL,
  `description` VARCHAR(300) NULL DEFAULT NULL,
  `rating` INTEGER(5) NULL DEFAULT NULL,
  `phone_number` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(300) NULL,
  `city` VARCHAR(50) NULL,
  `state` VARCHAR(3) NULL,
  `zip` VARCHAR(10) NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'payment'
-- this is to store the bill of each visit the patient makes to the doctor
-- ---

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `copay` INTEGER NULL DEFAULT NULL,
  `bill` INTEGER NULL DEFAULT NULL,
  `bill_statement` VARCHAR(300) NULL,
  `due_date` DATE DEFAULT NULL,
  `id_physician` INTEGER DEFAULT NULL,
  `id_patient` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'health_log'
-- this is a way for the doctor to assign a health/workout regimen
-- --- and for the patient to log their health as they follow the regimen

DROP TABLE IF EXISTS `health_log`;

CREATE TABLE `health_log` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `physician_date` DATE NULL DEFAULT NULL,
  `physician_notes` VARCHAR(10000) NULL DEFAULT NULL,
  `physician_photo_path` VARCHAR(300) NULL,
  `patient_date` DATE NULL DEFAULT NULL,
  `patient_note` VARCHAR(10000) NULL DEFAULT NULL,
  `patient_photo_path` VARCHAR(300) NULL,
  `id_physician` INTEGER DEFAULT NULL,
  `id_patient` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'appointment_document'
-- this is for the seperate documents that may be required for patients to fill out before each visit
-- ---

DROP TABLE IF EXISTS `appointment_document`;

CREATE TABLE `appointment_document` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `document` BLOB(400) NULL DEFAULT NULL,
  `id_appointment` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'insurance_company_professional'
-- this is for the insurance professionals to have a user profile to monitor customer bills and such
-- ---

DROP TABLE IF EXISTS `insurance_company_professional`;

CREATE TABLE `insurance_company_professional` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(30) NULL DEFAULT NULL,
  `username` VARCHAR(40) NULL DEFAULT NULL,
  `password` VARCHAR(30) NULL DEFAULT NULL,
  `id_Insurance_company` INTEGER NULL DEFAULT NULL,
  `phone_number` VARCHAR(30) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL,
  `photo_path` VARCHAR(300) NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'insurance_plan'
-- these are the individual plans the insurance companies offer patients
-- --- one to one relation for each patients to each plan

DROP TABLE IF EXISTS `insurance_plan`;

CREATE TABLE `insurance_plan` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `plan` VARCHAR(100) NULL,
  `policy_number` VARCHAR(100) NULL DEFAULT NULL,
  `member_id` VARCHAR(30) NULL,
  `payer_id` VARCHAR(20) NULL,
  `id_patient` INTEGER DEFAULT NULL,
  `id_Insurance_company` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'administration'
--
-- ---

DROP TABLE IF EXISTS `administration`;

CREATE TABLE `administration` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(25) NULL DEFAULT NULL,
  `password` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'emergency_contact'
--
-- ---

DROP TABLE IF EXISTS `emergency_contact`;

CREATE TABLE `emergency_contact` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `first` VARCHAR(30) NULL DEFAULT NULL,
  `last` VARCHAR(30) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(30) NULL DEFAULT NULL,
  `relationship` VARCHAR(30) NULL DEFAULT NULL,
  `id_patient` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'patient_medication'
-- the mediacation inforrmation of each patient is stored
-- ---

DROP TABLE IF EXISTS `patient_medication`;

CREATE TABLE `patient_medication` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `drug_name` VARCHAR(100) NULL DEFAULT NULL,
  `dosage` VARCHAR(100) NULL DEFAULT NULL,
  `id_medication` INTEGER DEFAULT NULL,
  `id_physician` INTEGER DEFAULT NULL,
  `id_patient` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'physician_institution'
-- for establishing relation between patient and physician
-- --- many to many relation

DROP TABLE IF EXISTS `physician_institution`;

CREATE TABLE `physician_institution` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_institution` INTEGER DEFAULT NULL,
  `id_physician` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'messages'
--
-- ---

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `direct_message` VARCHAR(10000) NULL DEFAULT NULL,
  `date` TIMESTAMP NULL DEFAULT NULL,
  `sender_id` INTEGER NULL,
  `receiver_id` INTEGER NULL,
  `sender_type` VARCHAR(300) NULL,
  `receiver_type` VARCHAR(300) NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'patient_physician'
--
-- ---

DROP TABLE IF EXISTS `patient_physician`;

CREATE TABLE `patient_physician` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_physician` INTEGER DEFAULT NULL,
  `id_patient` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Insurance_company'
--
-- ---

DROP TABLE IF EXISTS `Insurance_company`;

CREATE TABLE `Insurance_company` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(100) NULL,
  `phone_number_for_patients` VARCHAR(20) NULL,
  `phone_number_for_institutions` VARCHAR(20) NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'company_insurance_plan_types'
--
-- ---

DROP TABLE IF EXISTS `company_insurance_plan_types`;

CREATE TABLE `company_insurance_plan_types` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_insurance` INTEGER DEFAULT NULL,
  `id_Insurance_company` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'staff'
--
-- ---

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `first` VARCHAR(50) NULL,
  `last` VARCHAR(50) NULL,
  `email` VARCHAR(100) NULL,
  `phone_number` VARCHAR(25) NULL,
  `password` VARCHAR(200) NULL,
  `photo_path` VARCHAR(300) NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'institution_staff'
--
-- ---

DROP TABLE IF EXISTS `institution_staff`;

CREATE TABLE `institution_staff` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_staff` INTEGER DEFAULT NULL,
  `id_institution` INTEGER DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- --- grouped by REFERENCES

ALTER TABLE `appointment_document` ADD FOREIGN KEY (id_appointment) REFERENCES `appointment` (`id`);

ALTER TABLE `appointment` ADD FOREIGN KEY (id_physician) REFERENCES `physician` (`id`);
ALTER TABLE `Patient_Form` ADD FOREIGN KEY (id_physician) REFERENCES `physician` (`id`);
ALTER TABLE `payment` ADD FOREIGN KEY (id_physician) REFERENCES `physician` (`id`);
ALTER TABLE `health_log` ADD FOREIGN KEY (id_physician) REFERENCES `physician` (`id`);
ALTER TABLE `patient_medication` ADD FOREIGN KEY (id_physician) REFERENCES `physician` (`id`);
ALTER TABLE `physician_institution` ADD FOREIGN KEY (id_physician) REFERENCES `physician` (`id`);
ALTER TABLE `patient_physician` ADD FOREIGN KEY (id_physician) REFERENCES `physician` (`id`);

ALTER TABLE `patient_medication` ADD FOREIGN KEY (id_medication) REFERENCES `medication` (`id`);

ALTER TABLE `appointment` ADD FOREIGN KEY (id_patient) REFERENCES `patient` (`id`);
ALTER TABLE `Patient_Form` ADD FOREIGN KEY (id_patient) REFERENCES `patient` (`id`);
ALTER TABLE `payment` ADD FOREIGN KEY (id_patient) REFERENCES `patient` (`id`);
ALTER TABLE `health_log` ADD FOREIGN KEY (id_patient) REFERENCES `patient` (`id`);
ALTER TABLE `insurance_plan` ADD FOREIGN KEY (id_patient) REFERENCES `patient` (`id`);
ALTER TABLE `patient_physician` ADD FOREIGN KEY (id_patient) REFERENCES `patient` (`id`);
ALTER TABLE `patient_medication` ADD FOREIGN KEY (id_patient) REFERENCES `patient` (`id`);
ALTER TABLE `emergency_contact` ADD FOREIGN KEY (id_patient) REFERENCES `patient` (`id`);

ALTER TABLE `appointment` ADD FOREIGN KEY (id_institution) REFERENCES `institution` (`id`);
ALTER TABLE `institution_staff` ADD FOREIGN KEY (id_institution) REFERENCES `institution` (`id`);
ALTER TABLE `physician_institution` ADD FOREIGN KEY (id_institution) REFERENCES `institution` (`id`);

ALTER TABLE `institution_staff` ADD FOREIGN KEY (id_staff) REFERENCES `staff` (`id`);

ALTER TABLE `insurance_company_professional` ADD FOREIGN KEY (id_Insurance_company) REFERENCES `Insurance_company` (`id`);
ALTER TABLE `company_insurance_plan_types` ADD FOREIGN KEY (id_Insurance_company) REFERENCES `Insurance_company` (`id`);
ALTER TABLE `insurance_plan` ADD FOREIGN KEY (id_Insurance_company) REFERENCES `Insurance_company` (`id`);

ALTER TABLE `company_insurance_plan_types` ADD FOREIGN KEY (id_insurance) REFERENCES `insurance_plan` (`id`);


-- ---
-- Data For Testing Purposes
-- ---

-- INSERT INTO `physician` (`id`,`first`,`last`,`email`,`phone_number`,`password`,`photo_path`,`specialty`) VALUES
-- ('','','','','','','','');
INSERT INTO `physician` (`first`,`last`,`email`,`phone_number`,`password`,`photo_path`,`specialty`) VALUES ('neekon','nee','nee','34214321','nee','nee','nee');

INSERT INTO `physician` (`first`,`last`,`email`,`phone_number`,`password`,`photo_path`,`specialty`) VALUES ('yolo','bee','bee','34321235','bee','bee','bee');
-- INSERT INTO `patient` (`id`,`first`,`last`,`email`,`password`,`pin`,`date_of_birth`,`address`,`city`,`state`,`zip`,`phone_number`,`weight`,`height`,`blood_type`,`photo_path`) VALUES
-- ('','','','','','','','','','','','','','','','');
INSERT INTO `patient` (`first`,`last`,`email`,`password`,`pin`,`address`,`city`,`state`,`zip`,`phone_number`,`weight`,`height`,`blood_type`,`photo_path`) VALUES ('bal','bon','afsjon','2345rew','14','mya','at','ca','43522','2435','1231','123','4','a');
INSERT INTO `patient` (`first`,`last`,`email`,`password`,`pin`,`address`,`city`,`state`,`zip`,`phone_number`,`weight`,`height`,`blood_type`,`photo_path`) VALUES ('abn','bon','jon','2345rew','14','mj','sarat','ca','43522','2435','1231','123','4','a');


-- INSERT INTO `patient_physician` (`id`,`id_physician`,`id_patient`) VALUES
-- ('','','');
INSERT INTO `patient_physician` (`id_physician`,`id_patient`) VALUES ('1','1');
INSERT INTO `patient_physician` (`id_physician`,`id_patient`) VALUES ('1','2');
INSERT INTO `patient_physician` (`id_physician`,`id_patient`) VALUES ('2','2');
INSERT INTO `patient_physician` (`id_physician`,`id_patient`) VALUES ('2','1');


-- INSERT INTO `institution` (`id`,`inst_name`,`type`,`description`,`rating`,`phone_number`,`address`,`city`,`state`,`zip`,`email`) VALUES
-- ('','','','','','','','','','','');
INSERT INTO `institution` (`inst_name`,`type`,`description`,`rating`,`phone_number`,`address`,`city`,`state`,`zip`,`email`) VALUES ('wu tang','36chambers','fixer','12','1423','2413','sanjose','ca','4231','wu@gmail');
INSERT INTO `institution` (`inst_name`,`type`,`description`,`rating`,`phone_number`,`address`,`city`,`state`,`zip`,`email`) VALUES ('gza','chamberlane','tester','54','3542','4123','frisco','va','4231','wafsdu@gmail');

-- INSERT INTO `physician_institution` (`id`,`id_institution`,`id_physician`) VALUES
-- ('','','');
INSERT INTO `physician_institution` (`id_institution`,`id_physician`) VALUES ('1','1');
INSERT INTO `physician_institution` (`id_institution`,`id_physician`) VALUES ('1','2');


-- INSERT INTO `health_log` (`id`,`physician_date`,`physician_notes`,`physician_photo_path`,`patient_date`,`patient_note`,`patient_photo_path`,`id_physician`,`id_patient`) VALUES
-- ('','','','','','','','','');
INSERT INTO `health_log` (`physician_notes`,`physician_photo_path`,`patient_note`,`patient_photo_path`,`id_physician`,`id_patient`) VALUES ('he needs to shape up','upyours','doctor sucks','yolo','1','1');
INSERT INTO `health_log` (`physician_notes`,`physician_photo_path`,`patient_note`,`patient_photo_path`,`id_physician`,`id_patient`) VALUES ('he make big moves','upyours and hers','doctor sucks at life','yolo is my name o','1','2');
INSERT INTO `health_log` (`physician_notes`,`physician_photo_path`,`patient_note`,`patient_photo_path`,`id_physician`,`id_patient`) VALUES ('he make big moves all day erry day','up this','doctor sucks at life and more','yolo is my name o bro','2','2');

-- INSERT INTO `messages` (`id`,`direct_message`,`date`,`sender_id`,`receiver_id`) VALUES
-- ('','','','','');
INSERT INTO `messages` (`direct_message`,`sender_id`,`receiver_id`,`sender_type`, `receiver_type`) VALUES ('what up','1','2','physician','patient');
INSERT INTO `messages` (`direct_message`,`sender_id`,`receiver_id`,`sender_type`, `receiver_type`) VALUES ('hello bernard livelars','1','2','physician','patient');
INSERT INTO `messages` (`direct_message`,`sender_id`,`receiver_id`,`sender_type`, `receiver_type`) VALUES ('yolo','2','1','patient','physician');
INSERT INTO `messages` (`direct_message`,`sender_id`,`receiver_id`,`sender_type`, `receiver_type`) VALUES ('howdy','2','1','patient','physician');

-- INSERT INTO `emergency_contact` (`id`,`first`,`last`,`phone`,`email`,`relationship`,`id_patient`) VALUES
-- ('','','','','','','');
INSERT INTO `emergency_contact` (`first`,`last`,`phone`,`email`,`relationship`,`id_patient`) VALUES ('helen','yara','1234','yolomail','momma','1');

-- INSERT INTO `medication` (`id`,`drug_name`,`details`) VALUES
-- ('','','');
INSERT INTO `medication` (`drug_name`,`details`) VALUES ('kush','thr stickiest of the ickiest');

INSERT INTO `patient_medication` (`drug_name`,`dosage`,`id_medication`,`id_physician`,`id_patient`) VALUES ('kush','enough','1','1','1');
INSERT INTO `appointment` (`date`,`time`,`notes`,`id_physician`,`id_patient`,`id_institution`) VALUES ('2016-10-20','230','needs to protect his kneck','1','1','1');

INSERT INTO `appointment_document` (`document`,`id_appointment`) VALUES ('yolo','1');


-- INSERT INTO `administration` (`id`,`login`,`password`) VALUES
-- ('','','');

-- INSERT INTO `company_insurance_plan_types` (`id`,`id_insurance`,`id_Insurance_company`) VALUES
-- ('','','');


-- INSERT INTO `Patient_Form` (`id`,`doctor_notes`,`id_physician`,`id_patient`) VALUES
-- ('','','','');


-- INSERT INTO `payment` (`id`,`copay`,`bill`,`bill_statement`,`due_date`,`id_physician`,`id_patient`) VALUES
-- ('','','','','','','');

-- INSERT INTO `Insurance_company` (`id`,`company_name`,`phone_number_for_patients`,`phone_number_for_institutions`) VALUES
-- ('','','','');

-- INSERT INTO `insurance_company_professional` (`id`,`company_name`,`username`,`password`,`id_Insurance_company`,`photo_path`) VALUES
-- ('','','','','','');

-- INSERT INTO `insurance_plan` (`id`,`plan`,`policy_number`,`member_id`,`payer_id`,`id_patient`,`id_Insurance_company`) VALUES
-- ('','','','','','','');


-- INSERT INTO `institution_staff` (`id`,`id_staff`,`id_institution`) VALUES
-- ('','','');
-- INSERT INTO `staff` (`id`,`first`,`last`,`email`,`phone_number`,`password`,`photo_path`) VALUES
-- ('','','','','','','');
