<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Каталог бумажных книг</title>
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
                <li><a href="copies.php" class="active">бумажные книги</a></li>
                <li><a href="orders.php">заказы</a></li>
                <li><a href="account.php">личный кабинет</a></li>
            </ul>
        </div>
    </header>
    <main>
        <? include("php/connect.php"); ?>
        <fieldset>
            <legend>Поиск в каталоге книг</legend>
            <form action="copies.php" method="post">
                <label for="name">
                    Название <input type="text" name="name" id="name" value="">
                </label>
                <label for="author">
                    Автор <input type="text" name="author" id="author" value="">
                </label>
                <label for="genre">
                    Жанр
                    <select id="genre" name="genre">
                        <option selected value="">Не выбрано</option>
                        <? $query = $connect -> query("SELECT id_genre, name FROM genres");
                        while ($result = mysqli_fetch_array($query)): ?>
                            <option value="<? echo $result['id_genre'] ?>"><? echo $result['name'] ?></option>
                        <? endwhile; ?>
                    </select>
                </label>
                <label for="publisher">
                    Изд-во
                    <select id="publisher" name="publisher">
                        <option selected value="">Не выбрано</option>
                        <? $query = $connect -> query("SELECT id_publisher, name FROM publishers");
                        while ($result = mysqli_fetch_array($query)): ?>
                            <option value="<? echo $result['id_publisher'] ?>"><? echo $result['name'] ?></option>
                        <? endwhile; ?>
                    </select>
                </label>
                <button type="submit">Найти</button>
            </form>
        </fieldset>
        <? session_start(); if ($_SESSION['grants'] == 'admin'): ?>
            <fieldset>
                <legend>Добавить бумажную книгу</legend>
                <form action="copies.php" method="post">
                    <label for="composition">
                        Произ-е
                        <select id="composition" name="composition">
                            <option selected value="">Не выбрано</option>
                            <? $query = $connect -> query("SELECT id_composition, name FROM compositions");
                            while ($result = mysqli_fetch_array($query)): ?>
                                <option value="<? echo $result['id_composition'] ?>"><? echo $result['name'] ?></option>
                            <? endwhile; ?>
                        </select>
                    </label>
                    <label for="count">
                        Кол-во копий <input type="number" name="count" id="count" value="">
                    </label>
                    <label for="id_publisher">
                        Изд-во
                        <select id="id_publisher" name="id_publisher">
                            <option selected value="">Не выбрано</option>
                            <? $query = $connect -> query("SELECT id_publisher, name FROM publishers");
                            while ($result = mysqli_fetch_array($query)): ?>
                                <option value="<? echo $result['id_publisher'] ?>"><? echo $result['name'] ?></option>
                            <? endwhile; ?>
                        </select>
                    </label>
                    <label for="year">
                        Год <input type="number" name="year" id="year" value="">
                    </label>
                    <label for="storage">
                        Склад
                        <select id="storage" name="storage">
                            <option selected value="">Не выбрано</option>
                            <? $query = $connect -> query("SELECT id_storage, address FROM storages");
                            while ($result = mysqli_fetch_array($query)): ?>
                                <option value="<? echo $result['id_storage'] ?>"><? echo $result['address'] ?></option>
                            <? endwhile; ?>
                        </select>
                    </label>
                    <label for="price">
                        Цена <input type="number" name="price" id="price" value="">
                    </label>
                    <button type="submit">Добавить</button>
                </form>
            </fieldset>
            <? if($_POST['id_update'] != "") : ?>
                <fieldset>
                    <legend>Добавить бумажную книгу</legend>
                    <? $query = $connect -> query("SELECT * FROM `copies` WHERE id_copy = " . $_POST['id_update']);
                    $result = mysqli_fetch_array($query); ?>
                    <form action="copies.php" method="post">
                        <label for="new_comp">
                            Произ-е <input type="number" name="new_comp" id="new_comp" value="<? echo $result['id_composition'] ?>">
                        </label>
                        <label for="new_count">
                            Кол-во копий <input type="number" name="new_count" id="new_count" value="<? echo $result['copy_count'] ?>">
                        </label>
                        <label for="new_pub">
                            Изд-во <input type="number" name="new_pub" id="new_pub" value="<? echo $result['publisher'] ?>">
                        </label>
                        <label for="new_year">
                            Год <input type="number" name="new_year" id="new_year" value="<? echo $result['publish_year'] ?>">
                        </label>
                        <label for="new_stor">
                            Склад <input type="number" name="new_stor" id="new_stor" value="<? echo $result['id_storage'] ?>">
                        </label>
                        <label for="new_price">
                            Цена <input type="number" name="new_price" id="new_price" value="<? echo $result['price'] ?>">
                        </label>
                        <button type="submit">Изменить</button>
                    </form>
                </fieldset>
        <?
        if ($_POST['new_comp'] != $result['id_composition']) {
            $sql = "UPDATE `copies` SET `id_composition` = '" . $_POST['new_comp'] . "' WHERE id_copy = " . $_POST['id_update'];
            $query = $connect->query($sql);
        }
        if ($_POST['new_count'] != $result['copy_count']) {
            $sql = "UPDATE `copies` SET `copy_count` = '" . $_POST['new_count'] . "' WHERE id_copy = " . $_POST['id_update'];
            $query = $connect->query($sql);
        }
        if ($_POST['new_pub'] != $result['publisher']) {
            $sql = "UPDATE `copies` SET `publisher` = '" . $_POST['new_pub'] . "' WHERE id_copy = " . $_POST['id_update'];
            $query = $connect->query($sql);
        }
        if ($_POST['new_year'] != $result['publish_year']) {
            $sql = "UPDATE `copies` SET `publish_year` = '" . $_POST['new_year'] . "' WHERE id_copy = " . $_POST['id_update'];
            $query = $connect->query($sql);
        }
        if ($_POST['new_stor'] != $result['id_storage']) {
            $sql = "UPDATE `copies` SET `id_storage` = '" . $_POST['new_stor'] . "' WHERE id_copy = " . $_POST['id_update'];
            $query = $connect->query($sql);
        }
        if ($_POST['new_price'] != $result['price']) {
            $sql = "UPDATE `copies` SET `price` = '" . $_POST['new_price'] . "' WHERE id_copy = " . $_POST['id_update'];
            $query = $connect->query($sql);
        }
        endif; endif;
        if($_POST['id_delete'] != "") {
            $sql = "DELETE FROM copies WHERE id_copy = " . $_POST['id_delete'];
            $query = $connect -> query($sql);
        }
        if($_POST['composition'] != "") {
            $sql = "INSERT INTO `copies`(`id_composition`, `copy_count`, `publisher`, `publish_year`, `id_storage`, `price`) VALUES ('".$_POST['composition']."','".$_POST['count']."','".$_POST['id_publisher']."','".$_POST['year']."','".$_POST['storage']."','".$_POST['price']."')";
            $query = $connect -> query($sql);
        }

        $sql = "SELECT cp.id_copy, cm.name AS book_name, au.full_name, gn.name AS genre, pb.name AS publisher, cp.publish_year, cp.price FROM copies cp, compositions cm, authors au, genres gn, publishers pb WHERE cp.id_composition = cm.id_composition AND cm.id_author = au.id_author AND cm.id_genre = gn.id_genre AND cp.publisher = pb.id_publisher";
        if($_POST['name'] != "") $sql .= " AND cm.name LIKE '%". $_POST['name'] ."%'";
        if($_POST['author'] != "") $sql .= " AND au.full_name LIKE '%". $_POST['author'] ."%'";
        if($_POST['genre'] != "") $sql .= " AND cm.id_genre = ". $_POST['genre'] ."";
        if($_POST['publisher'] != "") $sql .= " AND pb.id_publisher = ". $_POST['publisher'] ."";
        $query = $connect -> query($sql);
        while ($result = mysqli_fetch_array($query)): ?>
        <section class="book">
            <div class="book-info">
                <p class="book-name">
                    <? echo $result['book_name'] ?>
                    <span class="book-page"><? echo $result['price'] ?> руб.</span>
                </p>
                <p><? echo $result['full_name'] ?></p>
            </div>
            <p class="book-genre">
                <? echo $result['genre'] ?><br>
                <? echo $result['publisher'] ?>, <? echo $result['publish_year'] ?> г.
            </p>
            <? if ($_SESSION['grants'] == 'user'): ?>
                <button class="btn">Открыть</button>
            <? endif;
            if ($_SESSION['grants'] == 'admin'): ?>
                <form action="copies.php" method="post">
                    <input type="hidden" name="id_update" value="<? echo $result['id_copy'] ?>">
                    <button class="btn">Изменить</button>
                </form>
                <form action="copies.php" method="post">
                    <input type="hidden" name="id_delete" value="<? echo $result['id_copy'] ?>">
                    <button class="btn">Удалить</button>
                </form>
            <? endif; ?>
        </section>
        <? endwhile; ?>
    </main>
    <footer></footer>
</body>
</html>