<?php
$admin_queries = $queries = [
    [
        'q' => 'INSERT INTO department(name) VALUES(CONCAT("Sales Department ",(SELECT MAX(id) FROM department AS t) + 1));',
        't' => "Insert Department",
        'hr' => false
    ],
    [
        'q' => 'SELECT * FROM department;',
        't' => "List Departments",
        'hr' => true
    ],
    [
        'q' => 'DELETE FROM department WHERE id NOT IN (SELECT * FROM (
                    SELECT MAX(id)
                    FROM department
                ) AS t);',
        't' => "Delete Departments(except last one)",
        'hr' => false
    ],

    [
        'q' => 'INSERT INTO employee(name,address,contact_no,status,reg_no,termination_date,hire_date,department) VALUES("John Wick","1234 Continental Street, New York, NY","","f","JW123456",NULL,"2014-01-15",(
                    SELECT MAX(id)
                    FROM department
                ));',
        't' => "Insert Employee",
        'hr' => false
    ],
    [
        'q' => 'UPDATE employee set reg_no=UUID(), name="Johnny Wick" WHERE id IN (SELECT * FROM (
                    SELECT MAX(id)
                    FROM employee
                ) AS t);',
        't' => "Update last employee",
        'hr' => false
    ],
    [
        'q' => 'SELECT * FROM employee;',
        't' => "List Employees",
        'hr' => true
    ],
    [
        'q' => 'DELETE FROM employee;',
        't' => "Delete All Employees",
        'hr' => false
    ]
];

$store_manager_queries = [
    [
        'q' => 'INSERT INTO medication_category(name) VALUES("Test Category");',
        't' => "Insert Medication Category",
        'hr' => false
    ],
    [
        'q' => 'SELECT * FROM medication_category;',
        't' => "List Medication Categories",
        'hr' => true
    ],
];

$sales_associate_queries = [];
$pharmacist_queries = [];
