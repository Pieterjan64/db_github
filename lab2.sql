CREATE TABLE `trainings` (
    `training_id` INT NOT NULL,
    `subject` VARCHAR(50) DEFAULT NULL,
    `duration` INT(5) NOT NULL,
    PRIMARY KEY (`training_id`)
);

CREATE TABLE `lab_members` (
    `members_id` INT NOT NULL,
    `firstname` VARCHAR(50) DEFAULT NULL,
    `lastname` VARCHAR(50) DEFAULT NULL,
    `birth_date` DATE DEFAULT NULL,
    PRIMARY KEY (`members_id`)
);

CREATE TABLE `members_in_training` (
    `mit_id` INT NOT NULL,
    `training_id` INT NOT NULL,
    `members_id` INT NOT NULL,
    FOREIGN KEY (`training_id`)
        REFERENCES trainings (`training_id`),
    FOREIGN KEY (`members_id`)
        REFERENCES lab_members (`members_id`)
);

CREATE TABLE `equipment` (
    `equipment_id` INT NOT NULL,
    `eq_name` VARCHAR(50) DEFAULT NULL,
    `manfacturer` VARCHAR(50) DEFAULT NULL,
    `purchase_date` DATE DEFAULT NULL,
    PRIMARY KEY (`equipment_id`)
);

CREATE TABLE `experiment` (
    `experiment_id` INT NOT NULL,
    `ex_name` VARCHAR(50) DEFAULT NULL,
    `performed_by` INT NOT NULL,
    `equipment_id` INT NOT NULL,
    `date` DATE DEFAULT NULL,
    PRIMARY KEY (`experiment_id`),
    FOREIGN KEY (`equipment_id`)
        REFERENCES equipment (`equipment_id`),
    FOREIGN KEY (`performed_by`)
        REFERENCES lab_members (`members_id`)
);

CREATE TABLE `results` (
    `results_id` INT NOT NULL,
    `directory` VARCHAR(100) DEFAULT NULL,
    `experiment` INT NOT NULL,
    `status` ENUM('FAILED','PROGRESS','COMPLETED') DEFAULT NULL,
    PRIMARY KEY (`results_id`),
    FOREIGN KEY (`experiment`)
        REFERENCES experiment (`experiment_id`)
);


-- INSERT SOME DATA 

INSERT INTO trainings VALUES (1, 'titreren', '2'),(2, 'afwegen', 5);
INSERT INTO trainings VALUES (3,'microscopy',7), (4,'cleaning',6), (5,'waste',5);
INSERT INTO trainings VALUES (6,'pipetteren',15),(7,'microscopie',14),(8,'bloedprikken',21),(9,'enten',5),(10,'WASP-toestel',28);

INSERT INTO lab_members VALUES ('1','Niels','Vanneste','1992-11-26'),('2','Piet','Verkest','1989-04-23'),(3, 'Jos', 'Vermeulen', '1970-04-12');
INSERT INTO lab_members VALUES (4,'Pieterjan','De Coninck','1995-04-12'), (5,'John','Doe','1991-10-02'), (6,'Mel','Trotter','1991-04-11'), (7,'Bill','Schuette','1970-12-01');
INSERT INTO lab_members VALUES (8,'Dries','Demeester','1993-02-27'),(9,'Bert','Demeester','1995-03-02'),(10,'Thijs','Demeester','1998-10-27'),(11,'Johan','Demeester','1960-04-08'),(12,'Myriam','Degezelle','1956-11-10');

INSERT INTO members_in_training VALUES (1, 1, 1),(2,2,2),(3,1,3);
INSERT INTO members_in_training VALUES (3,3,4), (4,4,7);
INSERT INTO members_in_training VALUES (5,1,1),(6,1,3),(7,1,5),(8,2,4),(9,2,1),(10,3,4),(11,3,3),(12,3,2),(13,3,1),(14,4,5),(15,5,3),(16,5,2);

INSERT INTO equipment VALUES ('1', 'buret','duran', '2016-11-20'),(2,'erlenmeyer','pyrex','2016-10-23');
INSERT INTO equipment VALUES (3,'microscope','Bio-Rad','2015-03-02'), (4,'pipet','Roche','2016-08-24');
INSERT INTO equipment VALUES (5,'WASP','Bio-Rad','2016-05-08'),(6,'entnaalden','Roche','2016-11-16');

INSERT INTO experiment VALUES (1, 'titratie', 1, 1, '2016-12-14'),(2,'wegen', 2, 2,'2016-11-03'),(3, 'titratie', 3, 1, '2010-05-12');
INSERT INTO experiment VALUES (4,'Salmonella',4,3,'2016-09-15'), (5,'Quality',7,4,'2013-12-03');
INSERT INTO experiment VALUES (6,'kwaliteitscontrole',4,6,'2016-11-20'),(7,'WASP_validatie',1,5,'2016-05-09'),(8,'microscoop_onderhoud',2,3,'2016-12-14'),(9,'pipetcontrole',5,4,'2015-12-28'),(10,'pipetteervaardigheid',3,4,'2014-02-15');

INSERT INTO results VALUES (1, 'home/results/titratie',1,'COMPLETED'),(2,'home/resulsts/balans', 2, 'PROGRESS'), (3, 'home/results/titratie', 1, 'FAILED');
INSERT INTO results VALUES (4,'Bacteria',4,'COMPLETED'), (5,'QC',5,'FAILED');
INSERT INTO results VALUES (6,'bacteriologie',1,'COMPLETED'),(7,'onderhoud',3,'PROGRESS'),(8,'controles',4,'COMPLETED'),(9,'testen',5,'COMPLETED'),(10,'validaties',2,'COMPLETED');

