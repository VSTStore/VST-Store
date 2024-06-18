<?php require_once('header.php');?>
<?
// Проверка, зашел ли пользователь
if(!isset($_SESSION['customer'])) {
    header('location: '.BASE_URL.'logout.php');
    exit;
}

// Проверка, отправлена ли форма
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Получение данных из формы
    $payment_id = $_POST['payment_id'];
    $link = $_POST['link'];

    // Обновление ссылки в базе данных
    $statement = $pdo->prepare("UPDATE tbl_payment SET link=? WHERE payment_id=?");
    $statement->execute(array($link, $payment_id));

    // Перенаправление обратно на страницу заказов с сообщением об успешном обновлении
    $_SESSION['success_message'] = 'Ссылка на скачивание обновлена успешно.';
    header('location: order.php');
    exit;
} else {
    header('location: order.php');
    exit;
}
?>
<?php require_once('footer.php'); ?>