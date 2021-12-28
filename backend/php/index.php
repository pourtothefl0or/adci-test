<?php
    $text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore u fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";

    $words = $_GET['words'];
    $arr = implode("|", str_getcsv($words, ' '));
    $text = preg_replace("~($arr)~iu", "<b style='color: red;'>$1</b>", $text);
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP</title>
    <style>
        .container {
            margin: 0 auto;
            max-width: 768px;
        }
    </style>
</head>
<body>
    <main>
        <section>
            <div class="container">
                <h1>Найти строку в тексте</h1>
                <form action="" method="GET">
                    <div>
                        <label>Ключевая строка:</label>
                        <input type="text" name="words" placeholder="Введите текст" value="<?php echo htmlspecialchars($words); ?>">
                    </div>
                    <br>
                    <button type="submit">Поиск</button>
                </form>
                <hr>
                <p><?php echo $text; ?></p>
            </div>
        </section>
    </main>
</body>
</html>