
<?php
/*
Template Name: Finance roll all
*/
?>
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table cellspacing="0" cellpadding="0" border="0" class="financeRoll">
				<thead>
					<tr>
						<th  colum="0" class="tableId">Н/З<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="1" class="tableCustomer">Клиент<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="2" class="tableCostPrice">Себестоимость<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="3" class="tablePrice">Цена продажи<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="4" class="tableIncome">Доход<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="5" class="tableDept">Задолженность<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th>Тип заказа</th>
						<th>Действия</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$orderData = costPrice("roll");
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
				<input type="hidden" value="roll" id="table_name">
			</table>
		</main>
	</div>
	
<?php get_footer(); ?>