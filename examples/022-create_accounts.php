<?php
/**
 * Sample post-install PHP script that creates complex objects that cannot be easily created by running simple SQL queries.
 *
 * This example creates several Accounts for a specific project but it can be easily modified to match any project.
 */

if (! defined('sugarEntry')) {
    define('sugarEntry', TRUE);
}
if (! defined('ENTRY_POINT_TYPE')) {
    define('ENTRY_POINT_TYPE', 'api');
}

// This file is copied in the root directory of the instance and executed from there
/** @noinspection UntrustedInclusionInspection */
require_once 'include/entryPoint.php';

// Run as Administrator
global $current_user;
$current_user->getSystemUser();


# Sample data
$accountsInfo = array(
    // Fields: name, account_type, industry, aliases_c, ibd_rel_c, f_p_c, kam_c, scale_c
    array('n' => 'Vasea', 'at' => '', 'i' => 'J31', 'a' => '', 'ibd' => '', 'fp' => '', 'kam' => '', 's' => '1'),
    array('n' => 'Vasile', 'at' => 'Investor', 'i' => 'J27', 'a' => 'vasilică', 'ibd' => 'B', 'fp' => 'P', 'kam' => 'Y', 's' => '3'),
    array('n' => 'Gheorghe', 'at' => 'Competitor', 'i' => 'J56', 'a' => 'gigi', 'ibd' => NULL, 'fp' => 'F', 'kam' => NULL, 's' => '2'),
    array('n' => 'Costel', 'at' => '', 'i' => '', 'a' => 'costică', 'ibd' => 'A', 'fp' => NULL, 'kam' => NULL, 's' => NULL),
    array('n' => 'Marcel', 'at' => 'Other', 'i' => 'J80', 'a' => '', 'ibd' => 'R', 'fp' => NULL, 'kam' => NULL, 's' => NULL),
    array('n' => 'Ion', 'at' => 'Prospect', 'i' => 'K26', 'a' => '', 'ibd' => 'T', 'fp' => NULL, 'kam' => NULL, 's' => NULL),
);

# Put the data into the database
foreach ($accountsInfo as $info) {
    printf("Create client '%s'", $info['n']); flush();

    /** @var User $account */
    $account               = BeanFactory::newBean('Accounts');
    $account->name         = $info['n'];
    $account->account_type = $info['at'];
    $account->industry     = $info['i'];
    # Custom fields specific to the project
    $account->aliases_c    = $info['a'];
    $account->ibd_rel_c    = $info['ibd'];
    $account->f_p_c        = $info['fp'];
    $account->kam_c        = $info['kam'];
    $account->scale_c      = $info['s'];

    $account->save();
    echo("... Done.\n"); flush();
}

# Make the changes persistent
DBManagerFactory::getInstance()->commit();


// This is the end of file; no closing PHP tag
