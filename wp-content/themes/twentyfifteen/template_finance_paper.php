<?php
/*
Template Name: Finance paper all
*/
?>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table cellspacing="0" cellpadding="0" border="0">
				<thead>
					<tr>
						<th>Н/З</th>
						<th>Клиент</th>
						<th>Себестоимость</th>
						<th>Цена продажи</th>
						<th>Доход</th>
						<th>Задолженность</th>
						<th>Тип заказа</th>
						<th>Действия</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$orderData = costPrice("paper");
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						foreach ( $orderData as $print ) {
							if($print['status'] == $userRoll || $userRoll=='all'){
					?>
					<tr>
						<td><?php echo $print['id'];?></td>
						<td><?php echo $print['customer'];?></td>
						<td><?php echo $print['cost_price'];?></td>
						<td contenteditable='true' id="selling_price"><?php echo $print['selling_price'];?></td>
						<td><?php echo $print['earnings'];?></td>
						<td contenteditable='true' id="debt"><?php echo $print['debt'];?></td>
						<td>
							<select name="order_type" class="order_type">
								<option value="" selected disabled>Выберите тип</option>
								<option value="Налич" <?php if($print['type'] && $print['type'] == "Налич") echo "selected";?>>Налич</option>
								<option value="Фактура" <?php if($print['type'] && $print['type'] == "Фактура") echo "selected";?>>Фактура</option>
							</select>
						</td>
					</tr>
					<?php }
					} ?>
				</tbody>
				<input type="hidden" value="paper" id="table_name">
			</table>
		</main>
	</div>
	
<?php get_footer(); ?>