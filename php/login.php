<?php
$username = $_POST['email'];
$password = $_POST['password'];
if (empty($username) OR empty($password)) exit("Вы ввели не всю информацию! <a href='/login.html'>Вернуться</a>");

include("connect.php");
$query = $connect -> query("SELECT * FROM readers WHERE email = '$username'");
$result = mysqli_fetch_array($query);
if (empty($result['email'])) {
    exit ("Вы ввели не всю информацию! <a href='/login.html'>Вернуться</a>");
}
else {
    if ($result['password'] == $password) {
        session_start();
        $_SESSION['id'] = $result['id_reader'];
        $_SESSION['grants'] = $result['grants'];
        header("Location: http://library/e_books.php");
    }
    else exit ("Неверный пароль! <a href='/login.html'>Вернуться</a>");
}