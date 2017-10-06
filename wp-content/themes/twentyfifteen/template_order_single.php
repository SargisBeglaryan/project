<?php 
/* 
Template Name: Order Single
*/ 
?>
<?php get_header();
$index = $_GET["index"];
$type = $_GET["type"];
$material;
global $wpdb;
if(isset($_POST["submit_status"])){ ?>
	<script>
		location.href = "all-<?php echo $type; ?>-orders/";
	</script>
<?php }
?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<?php if($type == "paper"){ ?>
			<table>
				<thead>
					<tr>
						<th>Дата</th>
						<th>Клиент</th>
						<th>Тел.</th>
						<th>Тип</th>
						<th>Тираж</th>
						<th>Кол. листов</th>
						<th>Формат</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_order_paper WHERE id={$index}" );
						foreach ( $result as $print ) {
							if($print->customer == null){
								$customerWithTable = $wpdb->get_row( "SELECT name FROM wp_customers WHERE id = $print->customer_id" );
								$print->customer = $customerWithTable->name;
							}
					?>
					<tr>
						<th><?php echo $print->date;?></th>
						<td><?php echo $print->customer;?></td>
						<td><?php echo $print->phone;?></td>
						<td><?php echo $print->order_type;?></td>
						<td><?php echo $print->printing_count;?></td>
						<td><?php $page_count = $print->page_count; echo $page_count; ?></td>
						<td><?php echo $print->size_x;?> x <?php echo $print->size_y;?></td>
					</tr>
					<?php  $material = $print->material; $orderIndex = $print->id;?>
					<?php } ?>
				</tbody>
				<thead>
					<tr>
						<th>Материал</th>
						<th>Имя</th>
						<th>Фирма</th>
						<th>Плотность</th>
						<th>Тип</th>
						<th>Формат</th>
						<th>П/П</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_product_paper WHERE id = '{$material}' " );
						foreach ( $result as $print ) {
					?>
					<tr>
						<th></th>
						<td><?php echo $print->name;?></td>
						<td><?php echo $print->company;?></td>
						<td><?php echo $print->density;?></td>
						<td><?php echo $print->type;?></td>
						<td><?php echo $print->size_x;?> x <?php echo $print->size_y;?></td>
						<td><?= $material_id = $print->id; ?></td>
						
					</tr>
					<?php } ?>
				</tbody>
				<thead>
					<tr>
						<th></th>
						<th>Форма</th>
						<th>Фольга</th>
						<th>Резина</th>
						<th>Лак</th>
						<th>Статус</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_order_paper WHERE id={$index}" );
						foreach ( $result as $print ) {
					?>
					<tr>
						<th></th>
						<td><?php echo $print->form;?></td>
						<td><?php echo $print->foil;?></td>
						<td><?php echo $print->rubber;?></td>
						<td><?php echo $print->lacquer;?></td>
						<td><?php echo $print->status;?></td>
						<td></td>
						
					</tr>
					<?php } ?>
				</tbody>
			</table>
			
			<form method="POST" action="">
				<p>
					<select id="status" name="status" style="margin-left:30px;padding:0.48em;" autocomplete="off">
						<option value="" disabled selected>Статус</option>
						<option value="Склад">Выход со склада</option>
						<option value="Резка">Выхол с резки</option>
						<option value="Печать">Выход из печати</option>
						<option value="Готово">Готово</option>
					</select>
				</p>
				<input type="hidden" name="url" value="/all-<?php echo $type; ?>-orders/">
				<input type="hidden" name="product_table" value="wp_order_<?php echo $type; ?>">
				<input type="hidden" name="product_id" value="<?php echo $orderIndex; ?>">

				<input type="submit" name="submit_status" value="Сохранить" style="margin:30px;">
				<?php if(get_current_user_role() == 'administrator' || get_current_user_role() == 'subscriber'){ ?>
				<input type="submit" name="submit_remove" value="Удалить" style="margin-top:30px;">
				<?php } ?>
			</form>
			<?php
			if(isset($_POST["submit_status"]))
				{
					if($_POST["status"] == 'Склад')
					{
						calculate_stock_values('wp_product_paper', $material_id, $page_count);
					}
				
					$data = array(
						"status" =>  $_POST["status"]
					);
					
					$where = array(
						"id" =>  $index
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
						$wpdb->update("wp_order_paper", $data, $where);
					}else {
						$wpdb->update("wp_order_paper", $data, $where);	
					}
				}
			?>
			<!--- roll side-->
			<?php } else if ($type == "roll" ) { ?>
			<table>
				<thead>
					<tr>
						<th>Дата</th>
						<th>Клиент</th>
						<th>Тел.</th>
						<th>Тип</th>
						<th>Тираж</th>
						<th>На одну стр</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_order_roll WHERE id={$index}" );
						foreach ( $result as $print ) {
					?>
					<tr>
						<th><?php echo $print->date;?></th>
						<td><?php echo $print->customer;?></td>
						<td><?php echo $print->phone;?></td>
						<td><?php echo $print->order_type;?></td>
						<td><?php echo $print->printing_count;?></td>
						<td><?php $page_count = $print->count_per_page; echo $page_count;?></td>
						<td></td>
					</tr>
					<?php $material = $print->material; $orderIndex = $print->id;?>
					<?php } ?>
				</tbody>
				
				<thead>
					<tr>
						<th>Материал</th>
						<th>Имя</th>
						<th>Фирма</th>
						<th>Тип</th>
						<th>Формат</th>
						<th>П/П</th>
						<th></th>
					</tr>
					
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_product_roll WHERE id = '{$material}' " );
						foreach ( $result as $print ) {
					?>
					<tr>
						<th></th>
						<td><?php echo $print->name;?></td>
						<td><?php echo $print->company;?></td>
						<td><?php echo $print->type;?></td>
						<td><?php echo $print->size_x;?> x <?php echo $print->size_y;?></td>
						<td><?= $material_id = $print->id; ?></td>
						<td></td>
						
					</tr>
					<?php } ?>
				</tbody>
				
				<thead>
					<tr>
						<th></th>
						<th>Форма</th>
						<th>Фольга</th>
						<th>Резина</th>
						<th>Лак</th>
						<th>Статус</th>
						<th></th>
					</tr>
					
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_order_roll WHERE id={$index}" );
						foreach ( $result as $print ) {
					?>
					<tr>
						<th></th>
						<td><?php echo $print->form;?></td>
						<td><?php echo $print->foil;?></td>
						<td><?php echo $print->rubber;?></td>
						<td><?php echo $print->lacquer;?></td>
						<td><?php echo $print->status;?></td>
						<td></td>
						
					</tr>
					<?php } ?>
				</tbody>
			</table>
			
			<form method="POST" action="">
				<p>
					<select id="status" name="status" style="margin-left:30px;padding:0.48em;" autocomplete="off">
						<option value="" disabled selected>Статус</option>
						<option value="Склад">Выход со склада</option>
						<option value="Резка">Выхол с резки</option>
						<option value="Печать">Выход из печати</option>
						<option value="Готово">Готово</option>
					</select>
				</p>
				<input type="hidden" name="url" value="/all-<?php echo $type; ?>-orders/">
				<input type="hidden" name="product_table" value="wp_order_<?php echo $type; ?>">
				<input type="hidden" name="product_id" value="<?php echo $orderIndex ?>">

				<input type="submit" name="submit_status" value="Сохранить" style="margin:30px;">
				<input type="submit" name="submit_remove" value="Удалить" style="margin-top:30px;">
			</form>
			<?php
				if(isset($_POST["submit_status"]))
				{
					if($_POST["status"] == 'Склад')
					{
						calculate_stock_values('wp_product_roll', $material_id, $page_count);
					}
				
					$data = array(
						"status" =>$_POST["status"]
					);
					
					$where = array(
						"id" =>  $index
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
			<?php } ?>
		</main>
	</div>
	
<?php get_footer(); ?>


