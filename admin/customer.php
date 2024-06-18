<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Просмотр пользователей</h1>
	</div>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-info">
				<div class="box-body table-responsive">
					<table id="example1" class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th width="10">#</th>
								<th width="180">Имя</th>
								<th width="150">Email</th>
								<th>Статус</th>
								<th width="100">Изменить статус</th>
								<th width="100">Действие</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$i=0;
							$statement = $pdo->prepare("SELECT * 
														FROM tbl_customer t1
														
													");
							$statement->execute();
							$result = $statement->fetchAll(PDO::FETCH_ASSOC);						
							foreach ($result as $row) {
								$i++;
								?>
								<tr class="<?php if($row['cust_status']==1) {echo 'bg-g';}else {echo 'bg-r';} ?>">
									<td><?php echo $i; ?></td>
									<td><?php echo $row['cust_name']; ?></td>
									<td><?php echo $row['cust_email']; ?></td>
									
									<td><?php if($row['cust_status']==1) {echo 'Активно';} else {echo 'Неактивно';} ?></td>
									<td>
										<a href="customer-change-status.php?id=<?php echo $row['cust_id']; ?>" class="btn btn-success btn-xs">Изменить статус</a>
									</td>
									<td>
										<a href="#" class="btn btn-danger btn-xs" data-href="customer-delete.php?id=<?php echo $row['cust_id']; ?>" data-toggle="modal" data-target="#confirm-delete">Удалить</a>
									</td>
								</tr>
								<?php
							}
							?>							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


</section>


<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Подтверждение удаления</h4>
            </div>
            <div class="modal-body">
                <p>Вы хотите удалить пользователя?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                <a class="btn btn-danger btn-ok">Удалить</a>
            </div>
        </div>
    </div>
</div>


<?php require_once('footer.php'); ?>