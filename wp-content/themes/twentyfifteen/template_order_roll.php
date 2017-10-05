
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
							<i class="fa fa-list-ol showFilterModal" id="allDateList" data-toggle="modal" data-target="#customerModal" aria-hidden="true"></i>
						</th>
						<th colum="2" class="tableCustomer">Клиент<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allCustomersList"aria-hidden="true"></i>
						</th>
						<th colum="3" class="tableMaterials">Материал<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allMaterialsList"aria-hidden="true"></i>
						</th>
						<th colum="4" class="tableType">Тип<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allTypeList"aria-hidden="true"></i>
						</th>
						<th colum="5" class="tableTiraj">Тираж<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allTirajList"aria-hidden="true"></i>
						</th>
						<th colum="6" class="tableOrderType">Тип заказа<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allOrderTypeList"aria-hidden="true"></i>
						</th>
						<th class="tableStatus">Статус</th>
						<th colum="7" class="tableCostPrice">Себестоимость<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allCostPriceList"aria-hidden="true"></i>
						</th>
						<th colum="8" class="tablePrice">Цена продажи<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allSellingPriceList"aria-hidden="true"></i>
						</th>
						<th colum="9" class="tableIncome">Доход<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allEarningList" aria-hidden="true"></i>
						</th>
						<th colum="10" class="tableDept">Задолженность<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allDebtList"aria-hidden="true"></i>
						</th>
						<th>Oплата</th>
						<th>Действия</th>
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_order_roll" );
						$orderData = costPrice("roll");
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						$allStatuses = ['Sklad'=>'Выход со склада', 'Rezka'=>'Выход с резки', 'Pechat'=>'Выход из печати', 'Gotovo'=>'Готово'];
						foreach ( $result as $print ) {
							if($print->status == $userRoll || $userRoll=='all'){
								if($print->customer == null){
									$customerFromTable = $wpdb->get_row( "SELECT name FROM wp_customers WHERE id = '".$print->customer_id."'" );
									$print->customer = $customerFromTable->name;
								}
					?>
					<tr onclick="window.document.location='order-single/?type=roll&index=<?php echo $print->id;?>';">
						<td class="tableIdRows"><?php echo $print->id;?></td>
						<td class="allDateList"><?php echo $print->date;?></td>
						<td class="allCustomersList"><?php echo $print->customer;?></td>
						<td class="allMaterialsList"><?php 
							if (preg_match('/[0-9]+/', $print->material)){
								echo $wpdb->get_var('SELECT name FROM wp_product_roll WHERE id = "'.$print->material.'"');
							}else {
								echo $print->material;
							}
							?>
						</td>
						<td class="allTypeList"><?php echo $print->type;?></td>
						<td class="allTirajList"><?php echo $print->printing_count;?></td>
						<td class="allOrderTypeList"><?php echo $print->type_of_order; ?></td>
						<td onclick="window.event.cancelBubble = true">
							<form method="POST" action="">
								<p style="    margin-bottom: 10px; text-align: center;">
									<select id="status"  class="class" name="status" autocomplete="off">
										<?php
										if($print->status == "Оформлен"){
											echo "<option value='' disabled selected>Виберите статус</option>";
										}
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
						<td class=" allCostPriceList"><?php echo $print->cost_price;?></td>
						<td class="allSellingPriceList" contenteditable='true' id="selling_price"><?php echo $print->selling_price;?></td>
						<td class="allEarningList"><?php echo $print->selling_price - $print->cost_price;?></td>
						<td class="allDebtList"contenteditable='true' id="debt"><?php echo $print->debt;?></td>
						<td class="allDebtList" contenteditable='true' id="debt"><?php echo $print->order_type;?></td>
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