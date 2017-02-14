<?php
/**
 * Sample post-install PHP script that creates complex objects that cannot be easily created by running simple SQL queries.
 *
 * It creates some Users for a specific project (see the custom UserHelper class) but it can be easily modified to match any project.
 */

use Sugarcrm\Sugarcrm\custom\modules\Users\UserHelper;

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
$email = 'a@b.cd';
$pass  = 'asdf';
define('ROLE_RCG', 'RCG');
define('ROLE_CLIENT_ID_COMPLIANCE', 'Client ID Compliance');
define('ROLE_APPROVING_BANKER', 'Approving Banker');
define('ROLE_REQUESTING_BANKER', 'Requesting Banker');
define('TEAM_CONFLICTS_DATA', '869129ee-28ff-5943-4ac7-5732ea19276d');
define('TEAM_RCG_AMERICAS', '40f11d22-a763-11e6-821c-56847afe9799');
define('TEAM_CID_COMPLIANCE', '4aa16480-a763-11e6-a96f-56847afe9799');
define('LBL_TEAM_RCG_AMERICAS', 'RCG Americas');
$usersInfo = array(
    // Fields: user_name, first_name, last_name, roles, teams
    array('un' => 'JR Conflict', 'fn' => 'Junior', 'ln' => 'Conflicts Apprentice', 'rl' => 'Conflicts Role', 'tm' => array(TEAM_CONFLICTS_DATA => 'Conflicts Data')),
    array('un' => 'SR Conflict', 'fn' => 'Senior', 'ln' => 'Conflicts Master', 'rl' => 'Senior Conflicts Role', 'tm' => array(TEAM_CONFLICTS_DATA => 'Conflicts Data')),
    array('un' => 'RB', 'fn' => 'Ză Requesting', 'ln' => 'Banker', 'rl' => ROLE_REQUESTING_BANKER, 'tm' => NULL),
    array('un' => 'RCG', 'fn' => 'Ză RCG', 'ln' => 'User', 'rl' => ROLE_RCG, 'tm' => array(TEAM_RCG_AMERICAS => LBL_TEAM_RCG_AMERICAS)),
    array('un' => 'AB', 'fn' => 'Ză Approving', 'ln' => 'Banker', 'rl' => ROLE_APPROVING_BANKER, 'tm' => NULL),
    array('un' => 'ClientID', 'fn' => 'Client ID', 'ln' => 'Compliance User', 'rl' => ROLE_CLIENT_ID_COMPLIANCE, 'tm' => array(TEAM_CID_COMPLIANCE => 'CID Compliance')),
    array('un' => 'El Revisor', 'fn' => 'El', 'ln' => 'Revisor', 'rl' => ROLE_RCG, 'tm' => array(TEAM_RCG_AMERICAS => LBL_TEAM_RCG_AMERICAS)),
    array('un' => 'El Aprobador', 'fn' => 'El', 'ln' => 'Aprobador', 'rl' => ROLE_RCG, 'tm' => array(TEAM_RCG_AMERICAS => LBL_TEAM_RCG_AMERICAS)),
);

# Put the data in the database
foreach ($usersInfo as $info) {
    printf("Create user '%s'", $info['un']); flush();
    /** @var User $user */
    $user = BeanFactory::newBean('Users');
    $user->user_name  = $info['un'];
    $user->first_name = $info['fn'];
    $user->last_name  = $info['ln'];

    $user->email1 = $email;
    $user->emailAddress->addAddress($email, TRUE, FALSE, FALSE, FALSE, NULL, FALSE);
    $user->emailAddress->save();
    $user->status = 'Active';
    $user->save();

    $user->setNewPassword($pass);

    // Teams
    if ($info['tm']) {
        /** @var Teams $focus */
        $focus = BeanFactory::getBean('Teams');
        foreach ($info['tm'] as $teamId => $teamName) {
            printf(", add to team '%s'", $teamName); flush();
            $focus->retrieve($teamId);
            $focus->add_user_to_team($user->id);
        }
    }

    // Roles
    if ($info['rl']) {
        printf(", set role '%s'", $info['rl']); flush();
        $role  = new ACLRole();
        $query = new SugarQuery();
        $query->from($role)->where()->equals('name', $info['rl']);
        $roles = $role->fetchFromQuery($query);
        /** @var ACLRole[] $roles */
        $role = reset($roles);
        $role->set_relationship('acl_roles_users', array('role_id' => $role->id, 'user_id' => $user->id), FALSE);
        $role->save();
    }

    unset($query, $role, $user, $helper);
    echo("... Done.\n"); flush();
}

# Make the changes persistent
DBManagerFactory::getInstance()->commit();


// This is the end of file; no closing PHP tag
