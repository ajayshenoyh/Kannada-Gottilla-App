<?php

require_once './dbutil.class.php';
require_once './JSONUtil.php';
require_once './KannadaGothilla.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $command = $_POST['command'];


    if ($command == "login") {
        $db = new DBUtil();
        $json = new JSONUtil();
        $kg = new KannadaGothilla();

        $email = $_POST['email'];
        $pass = $_POST['pass'];
        $loginDet = $kg->login($email, $pass, $db);
        if ($loginDet == 0) {
            $json->addKeyValue("loginStat", "NO");
        } else {
            $json->addKeyValue("loginStat", "YES");
            $json->addKeyValue("loginDet", $loginDet);
        }
        echo $json->getJSON();
    }
    if ($command == "createGroup") {
        $db = new DBUtil();
        $json = new JSONUtil();
        $kg = new KannadaGothilla();

        $uid = $_POST['uid'];
        $uarr = json_decode($_POST['uarr']);
        $marr = json_decode($_POST['marr']);
        $res = $kg->createGroup($uid, $uarr, $marr, $db);
        if ($res == -1) {
            echo "YES";
        } else {
            echo "NO";
        }
    }

    if ($command == "getActiveGroups") {
        $db = new DBUtil();
        $json = new JSONUtil();
        $kg = new KannadaGothilla();

        $uid = $_POST['uid'];
        $urole = $_POST['urole'];
        $res = $kg->getActiveGroups($uid, $urole, $db);
        if (count($res) != 0) {
            $json->addKeyValue("status", "YES");
            $json->addKeyValue("activeGroups", $res);
        } else {
            $json->addKeyValue("status", "NO");
        }
        echo $json->getJSON();
    }

    if ($command == "getUserList") {
        $db = new DBUtil();
        $json = new JSONUtil();
        $kg = new KannadaGothilla();

        $uid = $_POST['uid'];
        $urole = $_POST['urole'];
        $res = $kg->getUserList($uid, $urole, $db);
        if (count($res) != 0) {
            $json->addKeyValue("status", "YES");
            $json->addKeyValue("userList", $res);
        } else {
            $json->addKeyValue("status", "NO");
        }
        echo $json->getJSON();
    }

    if ($command == "getUserChats") {
        $db = new DBUtil();
        $json = new JSONUtil();
        $kg = new KannadaGothilla();

        $uid = $_POST['uid'];
        $urole = $_POST['urole'];
        $res = $kg->getUserChats($uid, $urole, $db);
        if (count($res) != 0) {
            $json->addKeyValue("status", "YES");
            $json->addKeyValue("userChats", $res);
        } else {
            $json->addKeyValue("status", "NO");
        }
        echo $json->getJSON();
    }

    if ($command == "sendMessage") {
        $db = new DBUtil();
        $json = new JSONUtil();
        $kg = new KannadaGothilla();

        $uid = $_POST['uid'];
        $gid = $_POST['gid'];
        $tid = $_POST['tid'];
        $msg = $_POST['msg'];

        $res = $kg->sendMessage($db, $msg, $uid, $tid, $gid);
        if ($res != null || $res != 0) {
            echo "YES";
        } else {
            echo "NO";
        }
    }
}

if (isset($_GET['command'])) {

    $com = $_GET['command'];

    if ($com == "getNewUsers") {
        $db = new DBUtil();
        $json = new JSONUtil();
        $kg = new KannadaGothilla();

        $new = $kg->getNewUsers($db);
        $json->addKeyValue("newUsers", $new);
        echo $json->getJSON();
    }

    if ($com == "getMentors") {
        $db = new DBUtil();
        $json = new JSONUtil();
        $kg = new KannadaGothilla();

        $mentors = $kg->getMentors($db);
        $json->addKeyValue("mentors", $mentors);
        echo $json->getJSON();
    }

    if ($com == "getMessages") {
        $db = new DBUtil();
        $json = new JSONUtil();
        $kg = new KannadaGothilla();

        $uid = $_GET['uid'];
        $gid = $_GET['gid'];
        $tid = $_GET['tid'];

        $msg = $kg->getMessages($db, $uid, $tid, $gid);
        $json->addKeyValue("messages", $msg);
        echo $json->getJSON();
    }
}


