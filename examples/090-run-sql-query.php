<?php
/**
 * Run a SQL query
 */
defined('sugarEntry') or define('sugarEntry', TRUE);
defined('ENTRY_POINT_TYPE') or define('ENTRY_POINT_TYPE', 'api');

require_once 'include/entryPoint.php';

$DB = DBManagerFactory::getInstance();

// Write your query below
$DB->query(<<< E
    SELECT CURTIME() FROM dual
E
);

$DB->commit();


// This is the end of file; no closing PHP tag
