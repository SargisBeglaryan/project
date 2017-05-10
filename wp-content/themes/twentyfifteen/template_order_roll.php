
<?php
/*
Template Name: Order roll all
*/
?>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table>
				<thead>
					<tr id="rollTableColums">
						<th  class="tableId">Н/З<br>
							<i class="fa fa-arrow-down" aria-hidden="true"></i>
							<i class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th class="tableDate">Дата<br>
							<i class="fa fa-arrow-down" aria-hidden="true"></i>
							<i class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th class="tableCustomer">Клиент<br>
							<i class="fa fa-arrow-down" aria-hidden="true"></i>
							<i class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th class="tableMaterials">Материал<br>
							<i class="fa fa-arrow-down" aria-hidden="true"></i>
							<i class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th class="tableType">Тип<br>
							<i class="fa fa-arrow-down" aria-hidden="true"></i>
							<i class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th class="tableTiraj">Тираж<br>
							<i class="fa fa-arrow-down" aria-hidden="true"></i>
							<i class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th class="tableOrderFormat">Формат<br>
							<i class="fa fa-arrow-down" aria-hidden="true"></i>
							<i class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th class="tableOrderType">Тип заказа<br>
							<i class="fa fa-arrow-down" aria-hidden="true"></i>
							<i class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th class="tableStatus">Статус<br>
							<i class="fa fa-arrow-down" aria-hidden="true"></i>
							<i class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
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
						<th><?php echo $print->id;?></th>
						<td><?php echo $print->date;?></td>
						<td><?php echo $print->customer;?></td>
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
								<input type="hidden" name="product_id" value="<?php echo $print->id ?>">
								<input type="submit" name="submit_status" value="Сохранить" style="    margin: 0px auto;width: 110px;height: 30px;padding: 5px; display: block">
							</form>
						</td>
					</tr>
					<?php }
					} ?>
				</tbody>
			</table>
			<?php
				if(isset($_POST["submit_status"]))
				{
					if($_POST["status"] == 'Склад')
					{
						calculate_stock_values('wp_product_roll', $_POST["product_id"], $page_count);
					}
					$data = array(
						"status" =>$_POST["status"]
					);
					$where = array(
						"id" =>  $_POST["product_id"]
					);
					$materialCountArray = array();
					$form = ($result[0]->form_id)?[$result[0]->form_id => $result[0]->form]:'';
					$foil = ($result[0]->foil_id)?[$result[0]->foil_id => $result[0]->foil]:'';
					$rubber = ($result[0]->rubber_id)?[$result[0]->rubber_id => $result[0]->rubber]:'';
					$lacquer = ($result[0]->lacquer_id)?[$result[0]->lacquer_id => $result[0]->lacquer]:'';
					array_push($materialCountArray,$form,$foil,$rubber,$lacquer);

					$countStatus = checkProductCount($materialCountArray);
					if($_POST["status"] == 'Склад' && $countStatus){
						materialTransaction($form,$foil,$rubber,$lacquer,$wpdb);
						$wpdb->update("wp_order_roll", $data, $where);
					}else {
						$wpdb->update("wp_order_roll", $data, $where);
					}
				}
			?>
		</main>
	</div>
	
<?php get_footer(); ?>