<?php 
/* 
Template Name: Sale Single
*/ 
?>
<?php get_header();
$index = $_GET["index"];
$type = $_GET["type"];
$material;
$page_count;
global $wpdb;
if(isset($_POST["submit_sale_status"])){ ?>
	
<?php }
?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<?php if($type == "paper"){ ?>
			<table>
				<thead>
					<tr>
						<th>Дата</th>
						<th>Кол. листов</th>
						<th>Статус</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_sale_paper  WHERE id={$index}" );
						foreach ( $result as $print ) {
					?>
					<tr>
						<th><?php echo $print->date;?></th>
						<td><?php echo $print->count;?></td>
						<td><?php echo $print->status;?></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<?php $material_id = $print->material_id; $page_count = $print->count; $orderIndex = $print->id;?>
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
					</tr>
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_product_paper WHERE id = '{$material_id}' " );
						foreach ( $result as $print ) {
					?>
					<tr>
						<th><?php echo $print->id;?></</th>
						<td><?php echo $print->name;?></td>
						<td><?php echo $print->company;?></td>
						<td><?php echo $print->density;?></td>
						<td><?php echo $print->type;?></td>
						<td><?php echo $print->size_x;?> x <?php echo $print->size_y;?></td>
						
					</tr>
					<?php } ?>
				</tbody>
			</table>
			
			<form method="POST" action="">
				<p>
					<select id="status" name="status" style="width:50%; margin-left:30px;padding:0.48em;" autocomplete="off">
						<option value="" disabled selected>Статус</option>
						<option value="Вышел со склада">Вышел со склада</option>
					</select>
				</p>
				<input type="hidden" name="url" value="sale-all-<?php echo $type; ?>/">
				<input type="hidden" name="product_table" value="wp_sale<? echo $type; ?>">
				<input type="hidden" name="product_id" value="<? echo $orderIndex; ?>">

				<input type="submit" name="submit_sale_status" value="Сохранить" style="margin:30px;">
				<input type="submit" name="submit_sale_remove" value="Удалить" style="margin-top:30px;">
			</form>
			<?php
				if(isset($_POST["submit_sale_status"]))
				{
					
					if($_POST["status"] == 'Вышел со склада')
					{
						calculate_stock_values('wp_product_paper', $material_id, $page_count);
					}
					
					$data = array(
						"status" =>  $_POST["status"]
					);
					
					$where = array(
						"id" =>  $index
					);
					
					$wpdb->update("wp_sale_paper", $data, $where);
				}
			?>
			<!---------------------------- roll side-------------------!-->
			<?php } else if ($type == "roll" ) { ?>
			<table>
				<thead>
					<tr>
						<th>Дата</th>
						<th>Количество(м²)</th>
						<th>Статус</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_sale_roll  WHERE id={$index}" );
						foreach ( $result as $print ) {
					?>
					<tr>
						<th><?php echo $print->date;?></th>
						<td><?php echo $print->area;?></td>
						<td><?php echo $print->status;?></td>
						<td></td>
						<td></td>
					</tr>
					<?php $material_id = $print->material_id; $page_area = $print->area; $orderIndex = $print->id;?>
					<?php } ?>
				</tbody>
				<thead>
					<tr>
						<th>Материал</th>
						<th>Имя</th>
						<th>Фирма</th>
						<th>Тип</th>
						<th>Формат</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$result = $wpdb->get_results ( "SELECT * FROM wp_product_roll WHERE id = '{$material_id}' " );
						foreach ( $result as $print ) {
					?>
					<tr>
						<th><?php echo $print->id;?></</th>
						<td><?php echo $print->name;?></td>
						<td><?php echo $print->company;?></td>
						<td><?php echo $print->type;?></td>
						<td><?php echo $print->size_x;?> x <?php echo $print->size_y;?></td>
						
					</tr>
					<?php } ?>
				</tbody>
			</table>
			<form method="POST" action="">
				<p>
					<select id="status" name="status" style="width:50%; margin-left:30px;padding:0.48em;" autocomplete="off">
						<option value="" disabled selected>Статус</option>
						<option value="Вышел со склада">Вышел со склада</option>
					</select>
				</p>
				
				
				<input type="submit" name="submit_sale_status" value="Сохранить" style="margin:30px;">
				<input type="submit" name="submit_sale_remove" value="Удалить" style="margin-top:30px;">
			</form>
			<?php
				if(isset($_POST["submit_sale_status"]))
				{
					
					if($_POST["status"] == 'Вышел со склада')
					{
						calculate_stock_values('wp_product_roll', $material_id, $page_area);
					}
					
					$data = array(
						"status" =>  $_POST["status"]
					);
					
					$where = array(
						"id" =>  $index
					);
					
					$wpdb->update("wp_sale_roll", $data, $where);
				}
			?>
			<!---------------------------- other side-------------------!-->
			<?php } else if ($type == "other" ) { ?>
			<div id="primary" class="content-area">	
				<main id="main" class="site-main" role="main">
					<div class="page-content">
					
					<form method="POST" action="">
						<p>
							<select id="status" name="status" style="width:50%; margin-left:30px;padding:0.48em;" autocomplete="off">
								<option value="" disabled selected>Статус</option>
								<option value="Вышел со склада">Вышел со склада</option>
							</select>
						</p>
						
						
						<input type="submit" name="submit_sale_status" value="Сохранить" style="margin:30px;">
						<input type="submit" name="submit_sale_remove" value="Удалить" style="margin-top:30px;">
					</form>
					<?php
					if(isset($_POST["submit_sale_status"]))
					{
						
						if($_POST["status"] == 'Вышел со склада')
						{
							calculate_stock_values('wp_product_roll', $material_id, $page_area);
						}
						
						$data = array(
							"status" =>  $_POST["status"]
						);
						
						$where = array(
							"id" =>  $index
						);
						
						$wpdb->update("wp_sale_roll", $data, $where);
					} ?>
					
					</div>
				</main>
			</div>
			<?php } ?>
		</main>
	</div>
	
<?php get_footer(); ?>


