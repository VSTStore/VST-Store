<?php require_once('header.php'); ?>

<?php
// Проверка, зашел ли пользователь
if (!isset($_SESSION['customer'])) {
    header('location: ' . BASE_URL . 'logout.php');
    exit;
} else {
    // Если клиент вошел в систему, но администратор сделал его неактивным, принудительно выйдите из системы.
    $statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_id=? AND cust_status=?");
    $statement->execute(array($_SESSION['customer']['cust_id'], 0));
    $total = $statement->rowCount();
    if ($total) {
        header('location: ' . BASE_URL . 'logout.php');
        exit;
    }
}
?>

<div class="page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-content">
                    <h3>Заказы</h3>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover" style="border: 1px solid black;">
                            <thead>
                                <tr>
                                    <th style="border: 1px solid black;">#</th>
                                    <th style="border: 1px solid black;">Покупатель</th>
                                    <th style="border: 1px solid black;">Детали заказа</th>
                                    <th style="border: 1px solid black;">ID Транзакции</th>
                                    <th style="border: 1px solid black;">Сумма</th>
                                    <th style="border: 1px solid black;">Статус платежа</th>
                                    <th style="border: 1px solid black;">Ссылка на скачивание</th>
                                </tr>
                            </thead>
                            <tbody>

                                <?php
                                // Пагинация
                                $adjacents = 5;
                                $statement = $pdo->prepare("SELECT * FROM tbl_payment ORDER BY id DESC");
                                $statement->execute(array($_SESSION['customer']['cust_email']));
                                $total_pages = $statement->rowCount();

                                $targetpage = BASE_URL . 'customer-order.php';
                                $limit = 10;
                                $page = @$_GET['page'];
                                if ($page)
                                    $start = ($page - 1) * $limit;
                                else
                                    $start = 0;

                                $statement = $pdo->prepare("SELECT * FROM tbl_payment ORDER BY id DESC LIMIT $start, $limit");
                                $statement->execute(array($_SESSION['customer']['cust_email']));
                                $result = $statement->fetchAll(PDO::FETCH_ASSOC);

                                if ($page == 0) $page = 1;
                                $prev = $page - 1;
                                $next = $page + 1;
                                $lastpage = ceil($total_pages / $limit);
                                $lpm1 = $lastpage - 1;
                                $pagination = "";
                                if ($lastpage > 1) {
                                    $pagination .= "<div class=\"pagination\">";
                                    if ($page > 1)
                                        $pagination .= "<a href=\"$targetpage?page=$prev\">&#171; предыдущая</a>";
                                    else
                                        $pagination .= "<span class=\"disabled\">&#171; предыдущая</span>";
                                    if ($lastpage < 7 + ($adjacents * 2)) {
                                        for ($counter = 1; $counter <= $lastpage; $counter++) {
                                            if ($counter == $page)
                                                $pagination .= "<span class=\"current\">$counter</span>";
                                            else
                                                $pagination .= "<a href=\"$targetpage?page=$counter\">$counter</a>";
                                        }
                                    } elseif ($lastpage > 5 + ($adjacents * 2)) {
                                        if ($page < 1 + ($adjacents * 2)) {
                                            for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++) {
                                                if ($counter == $page)
                                                    $pagination .= "<span class=\"current\">$counter</span>";
                                                else
                                                    $pagination .= "<a href=\"$targetpage?page=$counter\">$counter</a>";
                                            }
                                            $pagination .= "...";
                                            $pagination .= "<a href=\"$targetpage?page=$lpm1\">$lpm1</a>";
                                            $pagination .= "<a href=\"$targetpage?page=$lastpage\">$lastpage</a>";
                                        } elseif ($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2)) {
                                            $pagination .= "<a href=\"$targetpage?page=1\">1</a>";
                                            $pagination .= "<a href=\"$targetpage?page=2\">2</a>";
                                            $pagination .= "...";
                                            for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++) {
                                                if ($counter == $page)
                                                    $pagination .= "<span class=\"current\">$counter</span>";
                                                else
                                                    $pagination .= "<a href=\"$targetpage?page=$counter\">$counter</a>";
                                            }
                                            $pagination .= "...";
                                            $pagination .= "<a href=\"$targetpage?page=$lpm1\">$lpm1</a>";
                                            $pagination .= "<a href=\"$targetpage?page=$lastpage\">$lastpage</a>";
                                        } else {
                                            $pagination .= "<a href=\"$targetpage?page=1\">1</a>";
                                            $pagination .= "<a href=\"$targetpage?page=2\">2</a>";
                                            $pagination .= "...";
                                            for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++) {
                                                if ($counter == $page)
                                                    $pagination .= "<span class=\"current\">$counter</span>";
                                                else
                                                    $pagination .= "<a href=\"$targetpage?page=$counter\">$counter</a>";
                                            }
                                        }
                                    }
                                    if ($page < $counter - 1)
                                        $pagination .= "<a href=\"$targetpage?page=$next\">следующая &#187;</a>";
                                    else
                                        $pagination .= "<span class=\"disabled\">следующая &#187;</span>";
                                    $pagination .= "</div>\n";
                                }
                                // Конец пагинации
                                ?>

                                <?php
                                $tip = $page * 10 - 10;
                                foreach ($result as $row) {
                                    $tip++;
                                ?>
                                    <tr>
                                        <td style="border: 1px solid black;"><?php echo $tip; ?></td>
                                        <td style="border: 1px solid black;">
                                            <?php
                                            echo '<b>Имя:</b> ' . $row['customer_name'] . '<br>';
                                            echo '<b>Email:</b> ' . $row['customer_email'] . '<br>';
                                            ?>
                                        </td>
                                        <td style="border: 1px solid black;">
                                            <?php
                                            $statement1 = $pdo->prepare("SELECT * FROM tbl_order WHERE payment_id=?");
                                            $statement1->execute(array($row['payment_id']));
                                            $result1 = $statement1->fetchAll(PDO::FETCH_ASSOC);
                                            foreach ($result1 as $row1) {
                                                echo 'Название продукта: ' . $row1['p_name'] . '<br>';
                                                echo 'Количество: ' . $row1['quantity'] . '<br>';
                                                echo 'Цена за единицу: ₽' . $row1['unit_price'] . '<br><br>';
                                            }
                                            ?>
                                        </td>
                                        <td style="border: 1px solid black;"><?php echo $row['payment_id']; ?></td>
                                        <td style="border: 1px solid black;"><?php echo '₽' . $row['paid_amount']; ?></td>
                                        <td style="border: 1px solid black;"><?php echo $row['payment_status']; ?></td>
                                        <td style="border: 1px solid black;">
                                            <form action="link.php" method="post">
                                                <input type="hidden" name="payment_id" value="<?php echo $row['payment_id']; ?>">
                                                <input type="text" name="link" value="<?php echo $row['link']; ?>">
                                                <input type="submit" value="Сохранить">
                                            </form>
                                        </td>
                                    </tr>
                                <?php
                                }
                                ?>
                            </tbody>
                        </table>
                        <div class="pagination" style="overflow: hidden;">
                            <?php
                            echo $pagination;
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require_once('footer.php'); ?>
