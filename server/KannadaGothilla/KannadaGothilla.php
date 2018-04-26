<?php

class KannadaGothilla {

    public function login($email, $pass, DBUtil $db) {
        $sql = "SELECT * FROM user WHERE u_mail = '" . $email . "' AND u_pass='" . $pass . "'";
        $res = $db->executeSelect($sql);
        if (count($res) > 0) {
            return $res;
        } else
            return 0;
    }

    public function getNewUsers($db) {
        $sql = "SELECT u_id,u_mail,u_name FROM user WHERE u_role=3 AND u_gid=0";
        $res = $db->executeSelect($sql);
        return $res;
    }

    public function getMentors($db) {
        $sql = "SELECT u_id,u_mail,u_name FROM user WHERE u_role=2";
        $res = $db->executeSelect($sql);
        return $res;
    }

    public function getActiveGroups($uid, $urole, $db) {
        if ($urole == "1") {
            $sql = "SELECT g_id,g_name,g_mcount FROM chatgroup ";
        }
        if ($urole == "2") {
            $sql = "SELECT g_id,g_name,g_mcount FROM chatgroup WHERE g_mentor1=" . $uid . " OR g_mentor2=" . $uid . "  ";
        }

        $res = $db->executeSelect($sql);
        return $res;
    }

    public function getUserChats($uid, $urole, $db) {
        if ($urole == "1") {
            $sql = "SELECT u.u_id,u.u_name,u.u_role,DATE_FORMAT(m.m_created,'%l:%i %p') AS u_time FROM USER u "
                    . "INNER JOIN message m ON (u.u_id=m.m_from_id OR u.u_id=m.m_to_id) "
                    . "WHERE m.m_created=(SELECT m2.m_created FROM message m2  "
                    . "WHERE (m2.m_from_id=" . $uid . " AND m2.m_to_id=u.u_id) OR "
                    . "(m2.m_to_id=" . $uid . " AND m2.m_from_id=u.u_id) GROUP BY m_created DESC LIMIT 1) "
                    . "ORDER BY m_created DESC";
        }
        if ($urole == "2") {
            $sql = "SELECT u.u_id,u.u_name,u.u_role,DATE_FORMAT(m.m_created,'%l:%i %p') AS u_time FROM USER u "
                    . "INNER JOIN message m ON (u.u_id=m.m_from_id OR u.u_id=m.m_to_id) "
                    . "WHERE m.m_created=(SELECT m2.m_created FROM message m2  "
                    . "WHERE (m2.m_from_id=" . $uid . " AND m2.m_to_id=u.u_id) OR "
                    . "(m2.m_to_id=" . $uid . " AND m2.m_from_id=u.u_id) GROUP BY m_created DESC LIMIT 1) "
                    . "AND (u.u_role=1 OR u.u_role=2) "
                    . "ORDER BY m.m_created DESC";
        }
        if ($urole == "3") {
            $sql = "SELECT u.u_id,u.u_name,u.u_role,DATE_FORMAT(m.m_created,'%l:%i %p') AS u_time FROM USER u "
                    . "INNER JOIN message m ON (u.u_id=m.m_from_id OR u.u_id=m.m_to_id) "
                    . "WHERE m.m_created=(SELECT m2.m_created FROM message m2  "
                    . "WHERE (m2.m_from_id=" . $uid . " AND m2.m_to_id=u.u_id) OR "
                    . "(m2.m_to_id=" . $uid . " AND m2.m_from_id=u.u_id) GROUP BY m_created DESC LIMIT 1) "
                    . "AND u.u_role=1 "
                    . "ORDER BY m.m_created DESC";
        }


        $res = $db->executeSelect($sql);
        return $res;
    }

    public function getUserList($uid, $urole, $db) {
        if ($urole == "1") {
            $sql = "SELECT u_id,u_name,u_role from user where u_id<>" . $uid;
        }
        if ($urole == "2") {
            $sql = "SELECT u_id,u_name,u_role from user where u_id<>" . $uid . " AND (u_role=1 OR u_role=2)";
        }
        if ($urole == "3") {
            $sql = "SELECT u_id,u_name,u_role from user where u_role=1";
        }

        $res = $db->executeSelect($sql);
        return $res;
    }

    public function createGroup($uid, $uarr, $marr, $db) {
        try {
            $count = count($uarr);
            $s = "INSERT INTO chatgroup (g_name,g_mentor1,g_mentor2,g_mcount,g_created,g_created_by) VALUES ('Group'," . $marr[0] . "," . $marr[1] . "," . $count . ",NOW()," . $uid . ")";
            $gid = $db->executeInsertAndGetId($s);
            if ($gid == 0) {
                return -1;
            } else {
                $sql = "";
                $sql.="UPDATE user SET u_gid = " . $gid . " WHERE u_id  IN (";
                for ($i = 0; $i < ($count - 1); $i++) {
                    $sql.=$uarr[$i] . ",";
                }
                $sql.=$uarr[$count - 1] . ")";

                $res = $db->executeInsertAndGetId($sql);
                if ($res == 0) {
                    return -1;
                } else {
                    return $res;
                }
            }
        } catch (Exception $e) {
            echo $e;
        }
    }

    public function getMessages($db, $uid, $tid, $gid) {
        try {
            if ($tid === "0") {
                $sql = "SELECT m.m_id,m.m_body,m.m_from_id,u.u_name AS m_from_name,DATE_FORMAT(m.m_created,'%l:%i %p') AS m_time FROM message m"
                        . " INNER JOIN user u on m.m_from_id=u.u_id where m.m_group_id=" . $gid . " ORDER BY m.m_created  LIMIT 100";
            } else {
                $sql = "SELECT m_id,m_body,m_from_id,DATE_FORMAT(m_created,'%l:%i %p') AS m_time FROM message where "
                        . "(m_from_id=" . $uid . " AND m_to_id=" . $tid . ") OR"
                        . "(m_to_id=" . $uid . " AND m_from_id=" . $tid . ") ORDER BY m_created LIMIT 100";
            }
            $res = $db->executeSelect($sql);
            return $res;
        } catch (Exception $ex) {
            echo $ex;
        }
    }

    public function sendMessage($db, $msg, $uid, $tid, $gid) {
        $sql = "INSERT INTO message(m_body,m_from_id,m_to_id,m_group_id,m_created)"
                . " values('" . $msg . "'," . $uid . "," . $tid . "," . $gid . ",NOW())";

        $mesId = $db->executeInsertAndGetId($sql);

       /* if ($mesId != null && $mesId > 0) {
            updateNotification($db, $mesId, $tid, $gid);
        }*/


        return $mesId;
    }

    public function updateNotification($db, $mes_id, $tid, $gid) {
        if($gid > 0){
            $sql = "INSERT INTO notify(to_id,mes_id) "
                    . " SELECT $mes_id,u_id FROM user WHERE u_gid = $gid";
            $db->executeInsert($sql);
        }else{
            $sql = "INSERT INTO notify(to_id,mes_id) "
                    . " VALUES($mes_id,$tid)";
            $db->executeInsert($sql);
        }
        
    }

}
