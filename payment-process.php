<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once 'header.php';

use YooKassa\Model\Notification\NotificationSucceeded;
use YooKassa\Model\Notification\NotificationCanceled;
use YooKassa\Model\Notification\NotificationWaitingForCapture;
use YooKassa\Model\NotificationEventType;
use YooKassa\Client;

// данные из POST-запроса от ЮKassa
try {
    $source = file_get_contents('php://input');
    if ($source === false) {
        throw new Exception('Failed to read input stream');
    }

    // Логирование входящих данных
    if (empty($source)) {
        error_log("Received empty input");
        throw new Exception('Received empty input');
    } else {
        error_log("Received JSON: " . $source);
    }

    // Декодирование JSON
    $requestBody = json_decode($source, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Invalid JSON received: ' . json_last_error_msg());
    }

    if (!isset($requestBody['event'])) {
        throw new Exception('Event type not set in request');
    }

    // объект класса уведомлений
    $notification = null;

    switch ($requestBody['event']) {
        case NotificationEventType::PAYMENT_SUCCEEDED:
            $notification = new NotificationSucceeded($requestBody);
            break;
        case NotificationEventType::PAYMENT_CANCELED:
            $notification = new NotificationCanceled($requestBody);
            break;
        case NotificationEventType::PAYMENT_WAITING_FOR_CAPTURE:
            $notification = new NotificationWaitingForCapture($requestBody);
            break;
        default:
            throw new Exception('Unhandled event type: ' . $requestBody['event']);
    }

    // данные пользователя из сессии
    $customer_id = $_SESSION['customer']['cust_id'] ?? null;
    $customer_name = $_SESSION['customer']['cust_name'] ?? null;
    $customer_email = $_SESSION['customer']['cust_email'] ?? null;
    $final_total = $_SESSION['final_total'] ?? null;

    if ($notification !== null) {
        $payment = $notification->getObject();

        // Вставка данных в таблицу tbl_payment
        $stmt = $pdo->prepare("INSERT INTO tbl_payment (customer_id, customer_name, customer_email, payment_date, paid_amount, payment_status, payment_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute(array(
            strip_tags($customer_id),
            strip_tags($customer_name),
            strip_tags($customer_email),
            $payment->created_at,
            $final_total,
            $payment->status,
            $payment->id
        ));

        // Подтверждение получения уведомления
        http_response_code(200);
    } else {
        // Если уведомление не распознано, возвращаем ошибку
        http_response_code(400);
    }
} catch (Exception $e) {
    // Логирование ошибки
    error_log($e->getMessage());
    // Обработка ошибок при неверных данных
    http_response_code(500);
}
?>
