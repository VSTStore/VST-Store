<?php require_once('header.php'); ?>

<?php
if ( (!isset($_REQUEST['email'])) || (isset($_REQUEST['token'])) )
{
    $var = 1;

    // проверьте, правильный ли токен и соответствует ли он базе данных.
    $statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_email=?");
    $statement->execute(array($_REQUEST['email']));
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);                           
    foreach ($result as $row) {
        if($_REQUEST['token'] != $row['cust_token']) {
            header('location: '.BASE_URL);
            exit;
        }
    }

    // все правильно. теперь активируйте пользователя, удалив значение токена из базы данных.
    if($var != 0)
    {
        $statement = $pdo->prepare("UPDATE tbl_customer SET cust_token=?, cust_status=? WHERE cust_email=?");
        $statement->execute(array('',1,$_GET['email']));

        $success_message = '<p style="color:green;">Ваш адрес электронной почты успешно подтвержден. Теперь вы можете войти на наш сайт.</p><p><a href="'.BASE_URL.'login.php" style="color:#167ac6;font-weight:bold;">Click here to login</a></p>';     
    }
}
?>

<div class="page-banner" style="background-color:#444;">
    <div class="inner">
        <h1>Регистрация прошла успешно</h1>
    </div>
</div>

<div class="page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-content">
                    <?php 
                        echo $error_message;
                        echo $success_message;
                    ?>
                </div>                
            </div>
        </div>
    </div>
</div>

<?php require_once('footer.php'); ?>