<?php
require_once __DIR__ . '/vendor/autoload.php';
session_start(); // Начало сессии

use YooKassa\Client;

// Инициализация клиента YooKassa
$client = new Client();
$client->setAuth('399108', 'test_W_1NzcQVXgjDsy_0o3fsqJMhZ8ds2x4y-YBPAFqtw3w');

// Проверка наличия итоговой суммы в сессии
if (!isset($_SESSION['final_total'])) {
    die("Не удалось получить итоговую сумму.");
}

// Получение итоговой суммы из сессии
$final_total = $_SESSION['final_total'];
// Кнопка отмены платежа

if (isset($_POST['cancel_payment'])) {
    // Перенаправление на страницу отмены платежа
    header('Location: https://vststore.ru/cart.php');
    exit();
}

// Создание платежа
$payment = $client->createPayment(
    array(
        'amount' => array(
            'value' => number_format($final_total, 2, '.', ''),
            'currency' => 'RUB',
        ),
        'confirmation' => array(
            'type' => 'redirect',
            'return_url' => 'https://vststore.ru/payment_success.php',
        ),
        'capture' => true,
        'description' => 'Order Payment',
    ),
    uniqid('', true)
);

// Сохранение ID платежа для дальнейшей проверки
$_SESSION['payment_id'] = $payment->getId();

// Перенаправление на страницу подтверждения платежа
header('Location: ' . $payment->getConfirmation()->getConfirmationUrl());
exit();
?>
