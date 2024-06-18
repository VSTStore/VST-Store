<?php require_once('header.php'); ?>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
foreach ($result as $row) {
    $banner_checkout = $row['banner_checkout'];
}
?>

<?php
if(!isset($_SESSION['cart_p_id'])) {
    header('location: cart.php');
    exit;
}
?>

<div class="page-banner" style="background-image: url(assets/uploads/<?php echo $banner_checkout; ?>)">
    <div class="overlay"></div>
    <div class="page-banner-inner">
        <h1><?php echo LANG_VALUE_22; ?></h1>
    </div>
</div>

<div class="page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <?php if(!isset($_SESSION['customer'])): ?>
                    <p>
                        <a href="login.php" class="btn btn-md btn-danger"><?php echo LANG_VALUE_160; ?></a>
                    </p>
                <?php else: ?>

                <h3 class="special"><?php echo LANG_VALUE_26; ?></h3>
                <div class="cart">
                    <table class="table table-responsive table-hover table-bordered">
                        <tr>
                            <th><?php echo '#' ?></th>
                            <th><?php echo LANG_VALUE_8; ?></th>
                            <th><?php echo LANG_VALUE_47; ?></th>
                            <th><?php echo LANG_VALUE_159; ?></th>
                            <th><?php echo LANG_VALUE_55; ?></th>
                            <th class="text-right"><?php echo LANG_VALUE_82; ?></th>
                        </tr>
                         <?php
                        $table_total_price = 0;

                        $i=0;
                        foreach($_SESSION['cart_p_id'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_id[$i] = $value;
                        }

                      
                        $i=0;
                        foreach($_SESSION['cart_p_qty'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_qty[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_p_current_price'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_current_price[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_p_name'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_name[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_p_featured_photo'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_featured_photo[$i] = $value;
                        }
                        ?>
                        <?php for($i=1;$i<=count($arr_cart_p_id);$i++): ?>
                        <tr>
                            <td><?php echo $i; ?></td>
                            <td>
                                <img src="assets/uploads/<?php echo $arr_cart_p_featured_photo[$i]; ?>" alt="">
                            </td>
                            <td><?php echo $arr_cart_p_name[$i]; ?></td>
                            <td><?php echo LANG_VALUE_1; ?><?php echo $arr_cart_p_current_price[$i]; ?></td>
                            <td><?php echo $arr_cart_p_qty[$i]; ?></td>
                            <td class="text-right">
                                <?php
                                $row_total_price = $arr_cart_p_current_price[$i]*$arr_cart_p_qty[$i];
                                $table_total_price = $table_total_price + $row_total_price;
                                ?>
                                <?php echo LANG_VALUE_1; ?><?php echo $row_total_price; ?>
                            </td>
                        </tr>
                        <?php endfor; ?>           
                        
                        
                        <tr>
                            <th colspan="5" class="total-text"><?php echo LANG_VALUE_82; ?></th>
                            <th class="total-amount">
                                <?php
                                $final_total = $table_total_price;
                                $_SESSION['final_total'] = $final_total; // Сохранение итоговой суммы в сессии
                                ?>
                                <?php echo LANG_VALUE_1; ?><?php echo $final_total; ?>
                            </th>
                        </tr>
                    </table> 
                </div>

                

                <div class="cart-buttons">
                    <ul>
                        <li><a href="cart.php" class="btn btn-primary"><?php echo LANG_VALUE_21; ?></a></li>
                    </ul>
                </div>
                <div class="cart-buttons">
                    <ul>
                        <li><a href="payment.php" class="btn btn-primary"><?php echo LANG_VALUE_164; ?></a></li>
                    </ul>
                </div>

                <?php endif; ?>

            </div>
        </div>
    </div>
</div>


<?php require_once('footer.php'); ?>