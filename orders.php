<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Все заказы</title>
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
                <li><a href="orders.php" class="active">заказы</a></li>
                <li><a href="account.php">личный кабинет</a></li>
            </ul>
        </div>
    </header>
    <main>
        <? include("php/connect.php"); ?>
        <fieldset>
            <legend>Найти заказ в базе</legend>
            <form action="orders.php" method="post">
                <label for="number">
                    Номер заказа <input type="number" name="number" id="number" value="">
                </label>
                <label for="name">
                    Название <input type="text" name="name" id="name" value="">
                </label>
                <button type="submit">Найти</button>
            </form>
        </fieldset>
        <?
        session_start();
        if($_POST['id_delete'] != "") {
            $sql = "DELETE FROM orders WHERE id_order = " . $_POST['id_delete'];
            $query = $connect -> query($sql);
        }

        $sql = "SELECT ord.id_order, cm.name AS book_name, au.full_name, rd.email, cp.price FROM orders ord, compositions cm, authors au, copies cp, sold_copies sc, readers rd WHERE cp.id_composition = cm.id_composition AND cm.id_author = au.id_author AND ord.id_order = sc.id_order AND sc.id_copy = cp.id_copy AND ord.id_reader = rd.id_reader";
        if ($_SESSION['grants'] == 'user') $sql .= " AND rd.id_reader = " . $_SESSION['id'];
        if($_POST['name'] != "") $sql .= " AND cm.name LIKE '%". $_POST['name'] ."%'";
        if($_POST['number'] != "") $sql .= " AND ord.id_order = ". $_POST['number'];
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
            <p class="order-num">Заказ №<? echo $result['id_order'] ?></p>
            <p class="reader"><? echo $result['email'] ?></p>
            <? if ($_SESSION['grants'] == 'admin'): ?>
                <form action="orders.php" method="post">
                    <input type="hidden" name="id_delete" value="<? echo $result['id_order'] ?>">
                    <button>Удалить</button>
                </form>
            <? endif; ?>
        </section>
        <? endwhile; ?>
    </main>
    <footer></footer>
</body>
</html>