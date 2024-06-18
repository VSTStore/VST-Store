<?php require_once('header.php'); ?>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_page WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
foreach ($result as $row) {
    $contact_title = $row['contact_title'];
    $contact_banner = $row['contact_banner'];
}
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
foreach ($result as $row) {
    $contact_email = $row['contact_email'];
    $contact_phone = $row['contact_phone'];
    $contact_address = $row['contact_address'];
}
?>

<div class="page-banner" style="background-image: url(assets/uploads/<?php echo $contact_banner; ?>);">
    <div class="inner">
        <h1><?php echo $contact_title; ?></h1>
    </div>
</div>

<div class="page">
    <div class="container">
        <div class="row">            
            <div class="col-md-12">
                <h3>Форма связи</h3>
                <div class="row cform">
                    <div class="col-md-8">
                        <div class="well well-sm">
                            
                            <?php
// После отправки формы проверяем все для отправки по электронной почте
if(isset($_POST['form_contact']))
{
    $error_message = '';
    $success_message = '';
    $statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
    $statement->execute();
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);                           
    foreach ($result as $row) 
    {
        $receive_email = $row['receive_email'];
        $receive_email_subject = $row['receive_email_subject'];
        $receive_email_thank_you_message = $row['receive_email_thank_you_message'];
    }

    $valid = 1;

    if(empty($_POST['visitor_name']))
    {
        $valid = 0;
        $error_message .= 'Введите имя.\n';
    }


    if(empty($_POST['visitor_email']))
    {
        $valid = 0;
        $error_message .= 'Введите email.\n';
    }
    else
    {
        // валидация Email
        if(!filter_var($_POST['visitor_email'], FILTER_VALIDATE_EMAIL))
        {
            $valid = 0;
            $error_message .= 'Пожалуйста, введите действительный адрес почты.\n';
        }
    }

    if(empty($_POST['visitor_message']))
    {
        $valid = 0;
        $error_message .= 'Введите сообщение.\n';
    }

    if($valid == 1)
    {
        
        $visitor_name = strip_tags($_POST['visitor_name']);
        $visitor_email = strip_tags($_POST['visitor_email']);
        $visitor_message = strip_tags($_POST['visitor_message']);

        // Отправка
        $to_admin = $receive_email;
        $subject = $receive_email_subject;
        $message = '
<html><body>
<table>
<tr>
<td>Имя</td>
<td>'.$visitor_name.'</td>
</tr>
<tr>
<td>Email</td>
<td>'.$visitor_email.'</td>
</tr>
<tr>
<td>Сообщение</td>
<td>'.nl2br($visitor_message).'</td>
</tr>
</table>
</body></html>
';
        $headers = 'От: ' . $visitor_email . "\r\n" .
                   'Ответить на: ' . $visitor_email . "\r\n" .
                   'X-Mailer: PHP/' . phpversion() . "\r\n" . 
                   "MIME-Version: 1.0\r\n" . 
                   "Content-Type: text/html; charset=ISO-8859-1\r\n";
             
        mail($to_admin, $subject, $message, $headers); 
        
        $success_message = $receive_email_thank_you_message;

    }
}
?>
                
                <?php
                if($error_message != '') {
                    echo "<script>alert('".$error_message."')</script>";
                }
                if($success_message != '') {
                    echo "<script>alert('".$success_message."')</script>";
                }
                ?>


                            <form action="" method="post">
                            <?php $csrf->echoInputField(); ?>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">Имя</label>
                                        <input type="text" class="form-control" name="visitor_name" placeholder="Введите имя">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" name="visitor_email" placeholder="Введите email">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">Сообщение</label>
                                        <textarea name="visitor_message" class="form-control" rows="9" cols="25" placeholder="Введите сообщение"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <input type="submit" value="Отправить" class="btn btn-primary pull-right" name="form_contact">
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <legend><span class="glyphicon glyphicon-globe"></span> Наш офис</legend>
                        <address>
                            <?php echo nl2br($contact_address); ?>
                        </address>
                        <address>
                            <strong>Email:</strong><br>
                            <a href="mailto:<?php echo $contact_email; ?>"><span><?php echo $contact_email; ?></span></a>
                        </address>
                    </div>
                </div>

                
                
            </div>
        </div>
    </div>
</div>

<?php require_once('footer.php'); ?>