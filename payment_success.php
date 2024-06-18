<?php require_once('header.php'); ?>

<?php
// данные пользователя из сессии
$customer_id = $_SESSION['customer']['cust_id'] ?? null;
$customer_name = $_SESSION['customer']['cust_name'] ?? null;
$customer_email = $_SESSION['customer']['cust_email'] ?? null;
$final_total = $_SESSION['final_total'] ?? null;

// Получение текущей даты и времени
$payment_date = date('Y-m-d H:i:s');

// Генерация случайного 10-значного payment_id
$payment_id = mt_rand(1000000000, 9999999999);

// Определение статуса платежа
$payment_status = 'Успешно';
$link = '';

try {
    // Вставка данных в таблицу tbl_payment
    $stmt = $pdo->prepare("INSERT INTO tbl_payment (customer_id, customer_name, customer_email, payment_date, paid_amount, payment_status, payment_id, link) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute(array(
        strip_tags($customer_id),
        strip_tags($customer_name),
        strip_tags($customer_email),
        $payment_date,
        $final_total,
        $payment_status,
        $payment_id,
        $link
    ));

    // Вставка данных в таблицу tbl_order
    if(isset($_SESSION['cart_p_id'])) {
        foreach($_SESSION['cart_p_id'] as $key => $p_id) {
            $p_name = $_SESSION['cart_p_name'][$key];
            $quantity = $_SESSION['cart_p_qty'][$key];
            $unit_price = $_SESSION['cart_p_current_price'][$key];

            $stmt = $pdo->prepare("INSERT INTO tbl_order (p_id, p_name, quantity, unit_price, payment_id) VALUES (?, ?, ?, ?, ?)");
            $stmt->execute(array(
                strip_tags($p_id),
                strip_tags($p_name),
                strip_tags($quantity),
                strip_tags($unit_price),
                strip_tags($payment_id)
            ));
        }
    }

    // Очистка корзины
    unset($_SESSION['cart_p_id']);
    unset($_SESSION['cart_p_name']);
    unset($_SESSION['cart_p_qty']);
    unset($_SESSION['cart_p_current_price']);
    unset($_SESSION['cart_p_featured_photo']);
    
    // Вывод успешного сообщения
    echo '<div class="page">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p>
                            <h3 style="margin-top:20px;">' . LANG_VALUE_121 . '</h3>
                            <a href="dashboard.php" class="btn btn-success">' . LANG_VALUE_91 . '</a>
                        </p>
                    </div>
                </div>
            </div>
          </div>';
} catch (Exception $e) {
    // Обработка ошибок
    error_log("Ошибка при вставке данных в таблицу: " . $e->getMessage());
    echo '<div class="page">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p>
                            <h3 style="margin-top:20px;">Произошла ошибка при обработке вашего платежа. Пожалуйста, свяжитесь с поддержкой.</h3>
                            <a href="dashboard.php" class="btn btn-danger">Вернуться на главную</a>
                        </p>
                    </div>
                </div>
            </div>
          </div>';
}
?>

<?php require_once('footer.php'); ?>
