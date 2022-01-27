<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Каталог электронных книг</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/logo.svg" alt="">
        </div>
        <div class="menu">
            <ul>
                <li><a href="e_books.php" class="active">электронные книги</a></li>
                <li><a href="copies.php">бумажные книги</a></li>
                <li><a href="orders.php">заказы</a></li>
                <li><a href="account.php">личный кабинет</a></li>
            </ul>
        </div>
    </header>
    <main>
        <? include("php/connect.php"); ?>
        <fieldset>
            <legend>Поиск в каталоге книг</legend>
            <form action="e_books.php" method="post">
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
                <button type="submit">Найти</button>
            </form>
        </fieldset>
        <? session_start(); if ($_SESSION['grants'] == 'admin'): ?>
            <fieldset>
                <legend>Добавить электронную книгу</legend>
                <form action="e_books.php" method="post">
                    <label for="composition">
                        Произведение
                        <select id="composition" name="composition">
                            <option selected value="">Не выбрано</option>
                            <? $query = $connect -> query("SELECT id_composition, name FROM compositions");
                            while ($result = mysqli_fetch_array($query)): ?>
                                <option value="<? echo $result['id_composition'] ?>"><? echo $result['name'] ?></option>
                            <? endwhile; ?>
                        </select>
                    </label>
                    <label for="volume">
                        Кол-во томов <input type="number" name="volume" id="volume" value="">
                    </label>
                    <label for="pages">
                        Страниц <input type="number" name="pages" id="pages" value="">
                    </label>
                    <button type="submit">Добавить</button>
                </form>
            </fieldset>
            <? if($_POST['id_update'] != "") : ?>
                <fieldset>
                    <legend>Изменить электронную книгу</legend>
                    <? $query = $connect -> query("SELECT * FROM `e_books` WHERE id_e_book = " . $_POST['id_update']);
                    $result = mysqli_fetch_array($query); ?>
                    <form action="e_books.php" method="post">
                        <label for="new_comp">
                            Произведение <input type="number" name="composition" id="composition" value="<? echo $result['id_composition'] ?>">
                        </label>
                        <label for="new_vol">
                            Кол-во томов <input type="number" name="volume" id="volume" value="<? echo $result['num_volume'] ?>">
                        </label>
                        <label for="new_pages">
                            Страниц <input type="number" name="pages" id="pages" value="<? echo $result['pages'] ?>">
                        </label>
                        <button type="submit">Изменить</button>
                    </form>
                </fieldset>
        <? if($_POST['new_comp'] != $result['id_composition']) {
            $sql = "UPDATE e_books SET last_update = '2021-11-22', id_composition = '".$_POST['new_comp']."' WHERE id_e_book = " . $_POST['id_update'];
            $query = $connect -> query($sql);
        }
        if($_POST['new_vol'] != $result['num_volume']) {
            $sql = "UPDATE e_books SET last_update = '2021-11-22', num_volume = '".$_POST['new_vol']."' WHERE id_e_book = " . $_POST['id_update'];
            $query = $connect -> query($sql);
        }
        if($_POST['new_pages'] != $result['pages']) {
            $sql = "UPDATE e_books SET last_update = '2021-11-22', pages = '".$_POST['new_pages']."' WHERE id_e_book = " . $_POST['id_update'];
            $query = $connect -> query($sql);
        }
        endif; endif;
        if($_POST['id_delete'] != "") {
            $sql = "DELETE FROM e_books WHERE id_e_book = " . $_POST['id_delete'];
            $query = $connect -> query($sql);
        }
        if($_POST['composition'] != "") {
            $sql = "INSERT INTO `e_books`(`id_composition`, `num_volume`, `last_update`, `pages`) VALUES ('".$_POST['composition']."','".$_POST['volume']."','2021-11-22','".$_POST['pages']."')";
            $query = $connect -> query($sql);
        }

        $sql = "SELECT eb.id_e_book, cm.name AS book_name, au.full_name, gn.name AS genre, eb.pages FROM `e_books` eb, compositions cm, authors au, genres gn WHERE eb.id_composition = cm.id_composition AND cm.id_author = au.id_author AND cm.id_genre = gn.id_genre";
        if($_POST['name'] != "") $sql .= " AND cm.name LIKE '%". $_POST['name'] ."%'";
        if($_POST['author'] != "") $sql .= " AND au.full_name LIKE '%". $_POST['author'] ."%'";
        if($_POST['genre'] != "") $sql .= " AND cm.id_genre = ". $_POST['genre'] ."";
        $query = $connect -> query($sql);
        while ($result = mysqli_fetch_array($query)): ?>
        <section class="book">
            <div class="book-info">
                <p class="book-name">
                    <? echo $result['book_name'] ?>
                    <span class="book-page"><? echo $result['pages'] ?> стр.</span>
                </p>
                <p><? echo $result['full_name'] ?></p>
            </div>
            <p class="book-genre"><? echo $result['genre'] ?></p>
            <? if ($_SESSION['grants'] == 'user'): ?>
                <button class="btn">Открыть</button>
            <? endif;
            if ($_SESSION['grants'] == 'admin'): ?>
                <form action="e_books.php" method="post">
                    <input type="hidden" name="id_update" value="<? echo $result['id_e_book'] ?>">
                    <button class="btn">Изменить</button>
                </form>
                <form action="e_books.php" method="post">
                    <input type="hidden" name="id_delete" value="<? echo $result['id_e_book'] ?>">
                    <button class="btn">Удалить</button>
                </form>
            <? endif; ?>
        </section>
        <? endwhile; ?>
    </main>
    <footer></footer>
</body>
</html>