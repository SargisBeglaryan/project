
<?php
/*
Template Name: Order roll all
*/
?>

<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table class="rollTable">
				<thead>
					<tr id="rollTableColums">
						<th  colum="0" class="tableId">Н/З<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="1" class="tableDate">Дата<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="2" class="tableCustomer">Клиент<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showClientsModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true"></i>
						</th>
						<th colum="3" class="tableMaterials">Материал<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="4" class="tableType">Тип<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="5" class="tableTiraj">Тираж<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="6" class="tableOrderType">Тип заказа<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th class="tableStatus">Статус</th>
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_order_roll" );
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						$allStatuses = ['Склад'=>'Выход со склада', 'Резка'=>'Выход с резки', 'Печать'=>'Выход из печати', 'Готово'=>'Готово'];
						foreach ( $result as $print ) {
							if($print->status == $userRoll || $userRoll=='all'){
								if($print->customer == null){
									$customerFromTable = $wpdb->get_row( "SELECT name FROM wp_customers WHERE id = '".$print->customer_id."'" );
									$print->customer = $customerFromTable->name;
								}
					?>
					<tr onclick="window.document.location='order-single/?type=roll&index=<?php echo $print->id;?>';">
						<td class="tableIdRows"><?php echo $print->id;?></td>
						<td><?php echo $print->date;?></td>
						<td class="allCustomersList"><?php echo $print->customer;?></td>
						<td><?php 
							if (preg_match('/[0-9]+/', $print->material)){
								echo $wpdb->get_var('SELECT name FROM wp_product_roll WHERE id = "'.$print->material.'"');
							}else {
								echo $print->material;
							}
							?>
						</td>
						<td><?php echo $print->order_type;?></td>
						<td><?php echo $print->printing_count;?></td>
						<td><?php echo $print->type_of_order; ?></td>
						<td onclick="window.event.cancelBubble = true">
							<form method="POST" action="">
								<p style="    margin-bottom: 10px; text-align: center;">
									<select id="status" name="status" autocomplete="off">
										<?php

										foreach($allStatuses as $key=>$value){
											if($print->status == $key){
												echo "<option value=".$key." disabled selected>".
														$value."</option>";
											} else {
												echo "<option value=".$key.">".$value."</option>";
											}
										}
										?>
									</select>
								</p>
								<input type="hidden" name="url" value="/all-roll-orders/">
								<input type="hidden" name="product_table" value="wp_order_roll">
								<input type="hidden" name="product_id" class="orderProductId" value="<?php echo $print->id ?>">
								<button type="button" class="submitStatus" name="submit_status" style="margin: 0px auto;width: 110px;height: 30px;padding: 5px;">Сохранить</button>
							</form>
						</td>
					</tr>
					<?php }
					} ?>
				</tbody>
			</table>
		</main>
	</div>
	<div class="modal fade" tableName="rollTable" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		    <h4 class="modal-title" id="gridSystemModalLabel">Имя клиентов</h4>
		  </div>
		  <div class="modal-body">
		  </div>
		  <div class="modal-footer">
		    <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
		    <button type="button" class="btn showFiltredCustomers">Показать</button>
		  </div>
		</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
<?php get_footer(); ?>