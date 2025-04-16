<?php
$v = true;
$v ? print "True" : print "False";

echo "<br>";

function longdate($timestamp) {
    $result = date("l F jS Y", $timestamp);
    return $result;
}

echo longdate(time());