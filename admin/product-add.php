<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

    if(empty($_POST['tcat_id'])) {
        $valid = 0;
        $error_message .= "Вам необходимо выбрать категорию верхнего уровня.<br>";
    }

    if(empty($_POST['mcat_id'])) {
        $valid = 0;
        $error_message .= "Вам необходимо выбрать категорию среднего уровня.<br>";
    }

    if(empty($_POST['ecat_id'])) {
        $valid = 0;
        $error_message .= "Вам необходимо выбрать категорию низкого уровня.<br>";
    }

    if(empty($_POST['p_name'])) {
        $valid = 0;
        $error_message .= "Название не должно быть пустым<br>";
    }

    if(empty($_POST['p_current_price'])) {
        $valid = 0;
        $error_message .= "Цена не может быть равна 0<br>";
    }

    if(empty($_POST['p_qty'])) {
        $valid = 0;
        $error_message .= "Количество не равно 0<br>";
    }

    $path = $_FILES['p_featured_photo']['name'];
    $path_tmp = $_FILES['p_featured_photo']['tmp_name'];

    if($path!='') {
        $ext = pathinfo( $path, PATHINFO_EXTENSION );
        $file_name = basename( $path, '.' . $ext );
        if( $ext!='jpg' && $ext!='png' && $ext!='jpeg' && $ext!='gif' ) {
            $valid = 0;
            $error_message .= 'Вам необходимо загрузить файл в формате jpg, jpeg, gif или png.<br>';
        }
    } else {
    	$valid = 0;
        $error_message .= 'Вам необходимо выбрать главное фото.<br>';
    }


    if($valid == 1) {

    	$statement = $pdo->prepare("SHOW TABLE STATUS LIKE 'tbl_product'");
		$statement->execute();
		$result = $statement->fetchAll();
		foreach($result as $row) {
			$ai_id=$row[10];
		}

    	if( isset($_FILES['photo']["name"]) && isset($_FILES['photo']["tmp_name"]) )
        {
        	$photo = array();
            $photo = $_FILES['photo']["name"];
            $photo = array_values(array_filter($photo));

        	$photo_temp = array();
            $photo_temp = $_FILES['photo']["tmp_name"];
            $photo_temp = array_values(array_filter($photo_temp));

        	$statement = $pdo->prepare("SHOW TABLE STATUS LIKE 'tbl_product_photo'");
			$statement->execute();
			$result = $statement->fetchAll();
			foreach($result as $row) {
				$next_id1=$row[10];
			}
			$z = $next_id1;

            $m=0;
            for($i=0;$i<count($photo);$i++)
            {
                $my_ext1 = pathinfo( $photo[$i], PATHINFO_EXTENSION );
		        if( $my_ext1=='jpg' || $my_ext1=='png' || $my_ext1=='jpeg' || $my_ext1=='gif' ) {
		            $final_name1[$m] = $z.'.'.$my_ext1;
                    move_uploaded_file($photo_temp[$i],"../assets/uploads/product_photos/".$final_name1[$m]);
                    $m++;
                    $z++;
		        }
            }

            if(isset($final_name1)) {
            	for($i=0;$i<count($final_name1);$i++)
		        {
		        	$statement = $pdo->prepare("INSERT INTO tbl_product_photo (photo,p_id) VALUES (?,?)");
		        	$statement->execute(array($final_name1[$i],$ai_id));
		        }
            }            
        }

		$final_name = 'product-featured-'.$ai_id.'.'.$ext;
        move_uploaded_file( $path_tmp, '../assets/uploads/'.$final_name );

		//Saving data into the main table tbl_product
		$statement = $pdo->prepare("INSERT INTO tbl_product(
										p_name,
										p_old_price,
										p_current_price,
										p_qty,
										p_featured_photo,
										p_description,
										p_short_description,
										p_system_require,
										p_total_view,
										p_is_featured,
										p_is_active,
										ecat_id
									) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
		$statement->execute(array(
										$_POST['p_name'],
										$_POST['p_old_price'],
										$_POST['p_current_price'],
										$_POST['p_qty'],
										$final_name,
										$_POST['p_description'],
										$_POST['p_short_description'],
										$_POST['p_system_require'],
										0,
										$_POST['p_is_featured'],
										$_POST['p_is_active'],
										$_POST['ecat_id']
									));

		

        
	
    	$success_message = 'Плагин успешно добавлен';
    }
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Добавить плагин</h1>
	</div>
	<div class="content-header-right">
		<a href="product.php" class="btn btn-primary btn-sm">Смотреть все</a>
	</div>
</section>


<section class="content">

	<div class="row">
		<div class="col-md-12">

			<?php if($error_message): ?>
			<div class="callout callout-danger">
			
			<p>
			<?php echo $error_message; ?>
			</p>
			</div>
			<?php endif; ?>

			<?php if($success_message): ?>
			<div class="callout callout-success">
			
			<p><?php echo $success_message; ?></p>
			</div>
			<?php endif; ?>

			<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">

				<div class="box box-info">
					<div class="box-body">
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">1 уровень категории <span>*</span></label>
							<div class="col-sm-4">
								<select name="tcat_id" class="form-control select2 top-cat">
									<option value="">выбрать 1 уровень</option>
									<?php
									$statement = $pdo->prepare("SELECT * FROM tbl_top_category ORDER BY tcat_name ASC");
									$statement->execute();
									$result = $statement->fetchAll(PDO::FETCH_ASSOC);	
									foreach ($result as $row) {
										?>
										<option value="<?php echo $row['tcat_id']; ?>"><?php echo $row['tcat_name']; ?></option>
										<?php
									}
									?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">2 уровень категории <span>*</span></label>
							<div class="col-sm-4">
								<select name="mcat_id" class="form-control select2 mid-cat">
									<option value="">выбрать 2 уровень</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">3 уровень категории <span>*</span></label>
							<div class="col-sm-4">
								<select name="ecat_id" class="form-control select2 end-cat">
									<option value="">выбрать 3 уровень</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Название плагина <span>*</span></label>
							<div class="col-sm-4">
								<input type="text" name="p_name" class="form-control">
							</div>
						</div>	
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Старая цена <br><span style="font-size:10px;font-weight:normal;">(₽)</span></label>
							<div class="col-sm-4">
								<input type="text" name="p_old_price" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Текущая цена <span>*</span><br><span style="font-size:10px;font-weight:normal;">(₽)</span></label>
							<div class="col-sm-4">
								<input type="text" name="p_current_price" class="form-control">
							</div>
						</div>	
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Количество <span>*</span></label>
							<div class="col-sm-4">
								<input type="text" name="p_qty" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Главное фото <span>*</span></label>
							<div class="col-sm-4" style="padding-top:4px;">
								<input type="file" name="p_featured_photo">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Другие картики</label>
							<div class="col-sm-4" style="padding-top:4px;">
								<table id="ProductTable" style="width:100%;">
			                        <tbody>
			                            <tr>
			                                <td>
			                                    <div class="upload-btn">
			                                        <input type="file" name="photo[]" style="margin-bottom:5px;">
			                                    </div>
			                                </td>
			                                <td style="width:28px;"><a href="javascript:void()" class="Delete btn btn-danger btn-xs">X</a></td>
			                            </tr>
			                        </tbody>
			                    </table>
							</div>
							<div class="col-sm-2">
			                    <input type="button" id="btnAddNew" value="Добавить" style="margin-top: 5px;margin-bottom:10px;border:0;color: #fff;font-size: 14px;border-radius:3px;" class="btn btn-warning btn-xs">
			                </div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Описание</label>
							<div class="col-sm-8">
								<textarea name="p_description" class="form-control" cols="30" rows="10" id="editor1"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Короткое описание</label>
							<div class="col-sm-8">
								<textarea name="p_short_description" class="form-control" cols="30" rows="10" id="editor2"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Системные требования</label>
							<div class="col-sm-8">
								<textarea name="p_system_require" class="form-control" cols="30" rows="10" id="editor5"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Является избранным?</label>
							<div class="col-sm-8">
								<select name="p_is_featured" class="form-control" style="width:auto;">
									<option value="0">Нет</option>
									<option value="1">Да</option>
								</select> 
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Активно?</label>
							<div class="col-sm-8">
								<select name="p_is_active" class="form-control" style="width:auto;">
									<option value="0">Нет</option>
									<option value="1">Да</option>
								</select> 
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label"></label>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-success pull-left" name="form1">Добавить плагин</button>
							</div>
						</div>
					</div>
				</div>

			</form>


		</div>
	</div>

</section>

<?php require_once('footer.php'); ?>