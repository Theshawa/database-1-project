<?php
$admin_queries = $queries = [
    [
        'q' => 'INSERT INTO department(name) VALUES(CONCAT("Sales Department ",(SELECT MAX(id) FROM department ) + 1));',
        't' => "Insert Department",
    ],
    [
        'q' => 'SELECT * FROM department;',
        't' => "List Departments",
    ],
    [
        'q' => 'DELETE FROM department WHERE id NOT IN (SELECT * FROM (
                    SELECT MAX(id)
                    FROM department
                ) );',
        't' => "Delete Departments(except last one)",
    ],

    [
        'q' => 'INSERT INTO employee(name,address,contact_no,status,reg_no,termination_date,hire_date,department) VALUES("John Wick","1234 Continental Street, New York, NY","","f","JW123456",NULL,"2014-01-15",(
                    SELECT MAX(id)
                    FROM department
                ));',
        't' => "Insert Employee",
    ],
    [
        'q' => 'UPDATE employee set reg_no=UUID(), name="Johnny Wick" WHERE id IN (SELECT * FROM (
                    SELECT MAX(id)
                    FROM employee
                ) AS t);',
        't' => "Update last employee",
    ],
    [
        'q' => 'SELECT * FROM employee;',
        't' => "List Employees",
    ],
    [
        'q' => 'DELETE FROM employee;',
        't' => "Delete All Employees",
    ]
];

$store_manager_queries = [
    [
        'q' => 'INSERT INTO medication_category(name) VALUES("Test Category");',
        't' => "Insert Medication Category",
    ],
    [
        'q' => 'SELECT * FROM medication_category;',
        't' => "List Medication Categories",
    ],
    [
        'q' => 'INSERT INTO shelf(location) VALUES("No.24");',
        't' => "Insert Shelf",
    ],
    [
        'q' => 'SELECT * FROM shelf;',
        't' => 'List all shelves',
    ],
    [
        'q' => 'INSERT INTO medication(name, category, shelf) VALUES("PTSS2002", (SELECT MAX(id) FROM medication_category), (SELECT MAX(id) FROM shelf));',
        't' => 'Insert medication',
    ],
    [
        'q' => 'SELECT * FROM medication;',
        't' => 'List all medications',
    ],
    [
        'q' => 'DELETE FROM medication;',
        't' => 'Delete medications',
    ],
    [
        'q' => 'INSERT INTO supplier(name, address, contact_no, reg_no) VALUES("ASTRON_LTD", "11A, Mile_Post_Avenue, Colombo_3", "011-2635860", "B102");',
        't' => 'Insert supplier',
    ],
    [
        'q' => 'SELECT * FROM supplier;',
        't' => 'List all suppliers',
    ],
    [
        'q' => 'DELETE FROM supplier WHERE name LIKE "%ASTRON_LTD%";',
        't' => 'Delete supplier',
    ],
];

$sales_associate_queries = [
    [
        'q' => 'INSERT INTO dispense(medication,patient,qty,date_time) VALUES((SELECT MAX(id) FROM medication),(SELECT MAX(id) FROM patient),5,"2021-05-09");',
        't' => 'Insert new data to dispense',
    ],
    [
        'q' => 'SELECT * FROM dispense;',
        't' => 'List dispense',
    ],
    [
        'q' => 'SELECT patient FROM dispense;',
        't' => 'list all patient from dispense',
    ],
    [
        'q' => 'UPDATE dispense SET qty=4 WHERE qty>5;',
        't' => 'Update dispense',
    ],
    [
        'q' => 'DELETE FROM dispense;',
        't' => 'DELETE all data from dispense',
    ],
    [
        'q' => 'INSERT INTO direct_purchase(patient,date_time,total_cost) VALUES((SELECT MAX(ID) FROM patient ),NOW(),1250.45);',
        't' => 'Insert new data to direct_purchase',
    ],
    [
        'q' => 'SELECT * FROM direct_purchase;',
        't' => 'List direct_purchase',
    ],
    [
        'q' => 'SELECT patient,total_cost FROM direct_purchase;',
        't' => 'List patient and total_cost FROM direct_purchase',
    ],
    [
        'q' => 'DELETE FROM direct_purchase WHERE total_cost>1000;',
        't' => 'DELETE all data from direct_purchase',
    ],
    [
        'q' => 'INSERT INTO delivery(patient,date_time,address) VALUES((SELECT MAX(ID) FROM patient ),NOW(),"9792 St Paul St.Pittsburg, CA 94565,California");',
        't' => 'Insert new data to delivery',
    ],
    [
        'q' => 'SELECT * FROM delivery;',
        't' => 'list delivery',
    ],
    [
        'q' => 'SELECT patient,address FROM delivery;',
        't' => 'List patient and address from delivery',
    ],
    [
        'q' => 'UPDATE delivery SET address="9792 St Paul St.Pittsburg, CA 94565, New York" WHERE address LIKE "%California%";',
        't' => 'Update delivery',
    ],
    [
        'q' => 'DELETE FROM delivery;',
        't' => 'Delete all data from delivery',
    ],
    [
        'q' => 'SELECT id,name,email FROM patient;',
        't' => 'list id,name and email from patient',
    ],

];

$pharmacist_queries = [
    [
        'q' => 'INSERT INTO patient(name,dob,email) VALUES("Theshawa Dasun","2002-09-05","mrclocktd@gmail.com");',
        't' => "Insert Patient",
    ],
    [
        'q' => 'SELECT * FROM patient;',
        't' => 'list all patients',
    ],
];
