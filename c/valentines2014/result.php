<?php 
include ('inc-functions.php');

$prize = getPrize($_POST['frmmobile'], $_POST['ticket']);

file_put_contents('aaa.txt', $prize);

$prizetext = translatePrize($prize);
echo $prizetext;