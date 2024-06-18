<?php require_once('header.php'); ?>

<?php
if(!isset($_REQUEST['id'])) {
    header('location: index.php');
    exit;
} else {
    // валидность id
    $statement = $pdo->prepare("SELECT * FROM tbl_product WHERE p_id=?");
    $statement->execute(array($_REQUEST['id']));
    $total = $statement->rowCount();
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);
    if( $total == 0 ) {
        header('location: index.php');
        exit;
    }
}

foreach($result as $row) {
    $p_name = $row['p_name'];
    $p_old_price = $row['p_old_price'];
    $p_current_price = $row['p_current_price'];
    $p_featured_photo = $row['p_featured_photo'];
    $p_description = $row['p_description'];
    $p_short_description = $row['p_short_description'];
    $p_system_require = $row['p_system_require'];
    $p_total_view = $row['p_total_view'];
    $p_is_featured = $row['p_is_featured'];
    $p_is_active = $row['p_is_active'];
    $ecat_id = $row['ecat_id'];
}

// Получение всех категорий
$statement = $pdo->prepare("SELECT
                        t1.ecat_id,
                        t1.ecat_name,
                        t1.mcat_id,

                        t2.mcat_id,
                        t2.mcat_name,
                        t2.tcat_id,

                        t3.tcat_id,
                        t3.tcat_name

                        FROM tbl_end_category t1
                        JOIN tbl_mid_category t2
                        ON t1.mcat_id = t2.mcat_id
                        JOIN tbl_top_category t3
                        ON t2.tcat_id = t3.tcat_id
                        WHERE t1.ecat_id=?");
$statement->execute(array($ecat_id));
$total = $statement->rowCount();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
foreach ($result as $row) {
    $ecat_name = $row['ecat_name'];
    $mcat_id = $row['mcat_id'];
    $mcat_name = $row['mcat_name'];
    $tcat_id = $row['tcat_id'];
    $tcat_name = $row['tcat_name'];
}


$p_total_view = $p_total_view + 1;

$statement = $pdo->prepare("UPDATE tbl_product SET p_total_view=? WHERE p_id=?");
$statement->execute(array($p_total_view,$_REQUEST['id']));







if(isset($_POST['form_add_to_cart'])) {

	// получение текущего колличества в наличие
	$statement = $pdo->prepare("SELECT * FROM tbl_product WHERE p_id=?");
	$statement->execute(array($_REQUEST['id']));
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
	foreach ($result as $row) {
		$current_p_qty = $row['p_qty'];
	}
	if($_POST['p_qty'] > $current_p_qty):
		$temp_msg = 'Извини! Есть только '.$current_p_qty.' в наличие';
		?>
		<script type="text/javascript">alert('<?php echo $temp_msg; ?>');</script>
		<?php
	else:
    if(isset($_SESSION['cart_p_id']))
    {
        $arr_cart_p_id = array();
        $arr_cart_p_qty = array();
        $arr_cart_p_current_price = array();

        $i=0;
        foreach($_SESSION['cart_p_id'] as $key => $value) 
        {
            $i++;
            $arr_cart_p_id[$i] = $value;
        }

        


        $added = 0;
        
        for($i=1;$i<=count($arr_cart_p_id);$i++) {
            if( ($arr_cart_p_id[$i]==$_REQUEST['id'])) {
                $added = 1;
                break;
            }
        }
        if($added == 1) {
           $error_message1 = 'Плагин уже есть в вашей корзине';
        } else {

            $i=0;
            foreach($_SESSION['cart_p_id'] as $key => $res) 
            {
                $i++;
            }
            $new_key = $i+1;

            
            $_SESSION['cart_p_id'][$new_key] = $_REQUEST['id'];
            $_SESSION['cart_p_qty'][$new_key] = $_POST['p_qty'];
            $_SESSION['cart_p_current_price'][$new_key] = $_POST['p_current_price'];
            $_SESSION['cart_p_name'][$new_key] = $_POST['p_name'];
            $_SESSION['cart_p_featured_photo'][$new_key] = $_POST['p_featured_photo'];

            $success_message1 = 'Плагин успешно добавлен в корзину!';
        }
        
    }
    else
    {

        $_SESSION['cart_p_id'][1] = $_REQUEST['id'];
        $_SESSION['cart_p_qty'][1] = $_POST['p_qty'];
        $_SESSION['cart_p_current_price'][1] = $_POST['p_current_price'];
        $_SESSION['cart_p_name'][1] = $_POST['p_name'];
        $_SESSION['cart_p_featured_photo'][1] = $_POST['p_featured_photo'];

        $success_message1 = 'Плагин успешно помещён в корзину!';
    }
	endif;
}
?>

<?php
if($error_message1 != '') {
    echo "<script>alert('".$error_message1."')</script>";
}
if($success_message1 != '') {
    echo "<script>alert('".$success_message1."')</script>";
    header('location: product.php?id='.$_REQUEST['id']);
}
?>


<div class="page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
                <div class="breadcrumb mb_30">
                    <ul>
                        <li><a href="<?php echo BASE_URL; ?>">Меню</a></li>
                        <li>></li>
                        <li><a href="<?php echo BASE_URL.'product-category.php?id='.$tcat_id.'&type=top-category' ?>"><?php echo $tcat_name; ?></a></li>
                        <li>></li>
                        <li><a href="<?php echo BASE_URL.'product-category.php?id='.$mcat_id.'&type=mid-category' ?>"><?php echo $mcat_name; ?></a></li>
                        <li>></li>
                        <li><a href="<?php echo BASE_URL.'product-category.php?id='.$ecat_id.'&type=end-category' ?>"><?php echo $ecat_name; ?></a></li>
                        <li>></li>
                        <li><?php echo $p_name; ?></li>
                    </ul>
                </div>

				<div class="product">
					<div class="row">
						<div class="col-md-5">
							<ul class="prod-slider">
                                
								<li style="background-image: url(assets/uploads/<?php echo $p_featured_photo; ?>);">
                                    <a class="popup" href="assets/uploads/<?php echo $p_featured_photo; ?>"></a>
								</li>
                                <?php
                                $statement = $pdo->prepare("SELECT * FROM tbl_product_photo WHERE p_id=?");
                                $statement->execute(array($_REQUEST['id']));
                                $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                foreach ($result as $row) {
                                    ?>
                                    <li style="background-image: url(assets/uploads/product_photos/<?php echo $row['photo']; ?>);">
                                        <a class="popup" href="assets/uploads/product_photos/<?php echo $row['photo']; ?>"></a>
                                    </li>
                                    <?php
                                }
                                ?>
							</ul>
							<div id="prod-pager">
								<a data-slide-index="0" href=""><div class="prod-pager-thumb" style="background-image: url(assets/uploads/<?php echo $p_featured_photo; ?>"></div></a>
                                <?php
                                $i=1;
                                $statement = $pdo->prepare("SELECT * FROM tbl_product_photo WHERE p_id=?");
                                $statement->execute(array($_REQUEST['id']));
                                $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                foreach ($result as $row) {
                                    ?>
                                    <a data-slide-index="<?php echo $i; ?>" href=""><div class="prod-pager-thumb" style="background-image: url(assets/uploads/product_photos/<?php echo $row['photo']; ?>"></div></a>
                                    <?php
                                    $i++;
                                }
                                ?>
							</div>
						</div>
						<div class="col-md-7">
							<div class="p-title"><h2><?php echo $p_name; ?></h2></div>
							
							<div class="p-short-des">
								<p>
									<?php echo $p_short_description; ?>
								</p>
							</div>
                            <form action="" method="post">
                            
							<div class="p-price">
                                <span style="font-size:14px;"><?php echo LANG_VALUE_54; ?></span><br>
                                <span>
                                    <?php if($p_old_price!=''): ?>
                                        <del><?php echo LANG_VALUE_1; ?><?php echo $p_old_price; ?></del>
                                    <?php endif; ?> 
                                        <?php echo LANG_VALUE_1; ?><?php echo $p_current_price; ?>
                                </span>
                            </div>
                            <input type="hidden" name="p_current_price" value="<?php echo $p_current_price; ?>">
                            <input type="hidden" name="p_name" value="<?php echo $p_name; ?>">
                            <input type="hidden" name="p_featured_photo" value="<?php echo $p_featured_photo; ?>">
							<div class="p-quantity">
                                <?php echo LANG_VALUE_55; ?> <br>
								<input type="number" class="input-text qty" step="1" min="1" max="" name="p_qty" value="1" title="Qty" size="4" pattern="[0-9]*" inputmode="numeric">
							</div>
							<div class="btn-cart btn-cart1">
                                <input type="submit" value="<?php echo LANG_VALUE_154; ?>" name="form_add_to_cart">
							</div>
                            </form>
							<div class="share">
                                <?php echo LANG_VALUE_58; ?> <br>
								<div class="sharethis-inline-share-buttons"></div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<!-- tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#description" aria-controls="description" role="tab" data-toggle="tab"><?php echo LANG_VALUE_59; ?></a></li>
                                <li role="presentation"><a href="#system_require" aria-controls="system_require" role="tab" data-toggle="tab"><?php echo LANG_VALUE_62; ?></a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="description" style="margin-top: -30px;">
									<p>
                                        <?php
                                        if($p_description == '') {
                                            echo LANG_VALUE_70;
                                        } else {
                                            echo $p_description;
                                        }
                                        ?>
									</p>
								</div>
                                
                                
                                <div role="tabpanel" class="tab-pane" id="system_require" style="margin-top: -30px;">
                                    <p>
                                        <?php
                                        if($p_system_require == '') {
                                            echo LANG_VALUE_73;
                                        } else {
                                            echo $p_system_require;
                                        }
                                        ?>
                                    </p>
                                </div>
								<div role="tabpanel" class="tab-pane" id="review" style="margin-top: -30px;">

                                    

								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</div>

<div class="product bg-gray pt_70 pb_70">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headline">
                    <h2><?php echo LANG_VALUE_155; ?></h2>
                    <h3><?php echo LANG_VALUE_156; ?></h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">

                <div class="product-carousel">

                    <?php
                    $statement = $pdo->prepare("SELECT * FROM tbl_product WHERE ecat_id=? AND p_id!=?");
                    $statement->execute(array($ecat_id,$_REQUEST['id']));
                    $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                    foreach ($result as $row) {
                        ?>
                        <div class="item">
                            <div class="thumb">
                                <div class="photo" style="background-image:url(assets/uploads/<?php echo $row['p_featured_photo']; ?>);"></div>
                                <div class="overlay"></div>
                            </div>
                            <div class="text">
                                <h3><a href="product.php?id=<?php echo $row['p_id']; ?>"><?php echo $row['p_name']; ?></a></h3>
                                <h4>
                                    <?php echo LANG_VALUE_1; ?><?php echo $row['p_current_price']; ?> 
                                    <?php if($row['p_old_price'] != ''): ?>
                                    <del>
                                        <?php echo LANG_VALUE_1; ?><?php echo $row['p_old_price']; ?>
                                    </del>
                                    <?php endif; ?>
                                </h4>
                                
                                <p><a href="product.php?id=<?php echo $row['p_id']; ?>"><?php echo LANG_VALUE_154; ?></a></p>
                            </div>
                        </div>
                        <?php
                    }
                    ?>

                </div>

            </div>
        </div>
    </div>
</div>

<?php require_once('footer.php'); ?>
