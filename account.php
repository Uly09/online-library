<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Личный кабинет</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/logo.svg" alt="">
        </div>
        <div class="menu">
            <ul>
                <li><a href="e_books.php">электронные книги</a></li>
                <li><a href="copies.php">бумажные книги</a></li>
                <li><a href="orders.php">заказы</a></li>
                <li><a href="account.php" class="active">личный кабинет</a></li>
            </ul>
        </div>
    </header>
    <main class="account-section">
        <? session_start(); include("php/connect.php");

        if($_POST['username'] != $result['full_name']) {
            $sql = "UPDATE readers SET full_name = '" .$_POST['username']. "' WHERE id_reader = " . $_SESSION['id'];
            $query = $connect -> query($sql);
        }
        if($_POST['email'] != $result['email']) {
            $sql = "UPDATE readers SET email = '" .$_POST['email']. "' WHERE id_reader = " . $_SESSION['id'];
            $query = $connect -> query($sql);
        }
        if($_POST['password'] != $result['password']) {
            $sql = "UPDATE readers SET password = '" .$_POST['password']. "' WHERE id_reader = " . $_SESSION['id'];
            $query = $connect -> query($sql);
        }
        $query = $connect -> query("SELECT * FROM `readers` WHERE id_reader = " . $_SESSION['id']);
        $result = mysqli_fetch_array($query);
        ?>
        <fieldset class="account">
            <legend>Редактирование профиля</legend>
            <form action="account.php" method="post">
                <label for="username">
                    Полное имя:
                    <input type="text" name="username" id="username" value="<? echo $result['full_name'] ?>">
                </label>
                <label for="email">
                    Адрес электронной почты:
                    <input type="email" name="email" id="email" value="<? echo $result['email'] ?>">
                </label>
                <label for="password">
                    Пароль:
                    <input type="password" name="password" id="password" value="<? echo $result['password'] ?>">
                </label>
                <button type="submit">Сохранить</button>
            </form>
        </fieldset>
    </main>
    <footer></footer>
</body>
</html>