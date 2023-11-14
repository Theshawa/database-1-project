DROP USER IF EXISTS 'john' @`localhost`;
DROP USER IF EXISTS 'jake' @`localhost`;
DROP USER IF EXISTS 'jessica' @`localhost`;
DROP USER IF EXISTS 'jonty' @`localhost`;
CREATE USER 'john' @`localhost` IDENTIFIED BY 'john123';
CREATE USER 'jake' @`localhost` IDENTIFIED BY 'jake123';
CREATE USER 'jessica' @`localhost` IDENTIFIED BY 'jessica123';
CREATE USER 'jonty' @`localhost` IDENTIFIED BY 'jonty123';
-- Admin Permissions
GRANT USAGE ON *.* TO `jake` @`localhost`;
GRANT ALL ON `pharmalink`.* TO `john` @`localhost`;
-- Store Manager Permissions
GRANT USAGE ON *.* TO `jake` @`localhost`;
GRANT SELECT ON `pharmalink`.`delivery` TO `jake` @`localhost`;
GRANT SELECT ON `pharmalink`.`direct_purchase` TO `jake` @`localhost`;
GRANT SELECT ON `pharmalink`.`dispense` TO `jake` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`medication_category` TO `jake` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`medication` TO `jake` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`shelf` TO `jake` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`supplier` TO `jake` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`supply` TO `jake` @`localhost`;
-- Sales Associate Permissions
GRANT USAGE ON *.* TO `jessica` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`delivery` TO `jessica` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`direct_purchase` TO `jessica` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`dispense` TO `jessica` @`localhost`;
GRANT SELECT ON `pharmalink`.`employee` TO `jessica` @`localhost`;
GRANT SELECT ON `pharmalink`.`medication_category` TO `jessica` @`localhost`;
GRANT SELECT ON `pharmalink`.`medication` TO `jessica` @`localhost`;
GRANT SELECT ON `pharmalink`.`patient` TO `jessica` @`localhost`;
GRANT SELECT ON `pharmalink`.`prescription_medication` TO `jessica` @`localhost`;
GRANT SELECT ON `pharmalink`.`prescription` TO `jessica` @`localhost`;
GRANT SELECT ON `pharmalink`.`shelf` TO `jessica` @`localhost`;
-- Pharmacist Permissions
GRANT USAGE ON *.* TO `jonty` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`condition_report` TO `jonty` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`diagnosis_report_condition` TO `jonty` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`diagnosis_report` TO `jonty` @`localhost`;
GRANT SELECT ON `pharmalink`.`medication_category` TO `jonty` @`localhost`;
GRANT SELECT ON `pharmalink`.`medication` TO `jonty` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`patient` TO `jonty` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`prescription_medication` TO `jonty` @`localhost`;
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON `pharmalink`.`prescription` TO `jonty` @`localhost`;
FLUSH PRIVILEGES;