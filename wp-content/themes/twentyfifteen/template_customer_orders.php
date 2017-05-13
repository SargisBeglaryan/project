<?php 
/* 
Template Name: Customer all orders
*/ 
?>
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
					</tr>
				</thead>
				<tbody>
					<?php
						$type = $_GET['type'];
						$customerName = $_GET['customer'];
						$orderData = costumerOrderPrice($type, $customerName);
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						foreach ( $orderData as $print ) {
							if($print['status'] == $userRoll || $userRoll=='all'){
					?>
					<tr>
						<td><?php echo $print['id'];?></td>
						<td><?php echo $print['customer'];?></td>
						<td><?php echo $print['cost_price'];?></td>
						<td><?php echo $print['selling_price'];?></td>
						<td><?php echo $print['earnings'];?></td>
						<td onclick="window.document.location='degt-statistic/?type=<?php echo $type;?>&index=<?php echo $print['id'];?>';">
							<?php echo $print['debt'];?>
						</td>
						<td>
							<?php 
							if($print['type']) {
								echo $print['type'];
							}
							?>
						</td>
					</tr>
					<?php }
					} ?>
				</tbody>
			</table>
			<div class="allSumDiv">Общая сумма</div>
			<table cellspacing="0" cellpadding="0" border="0">
				<thead>
				<tr>
					<th>Себестоимость</th>
					<th>Цена продажи</th>
					<th>Доход</th>
					<th>Задолженность</th>
				</tr>
				</thead>
				<tbody>
				<?php
				$costPriceSum = $orderSum = $incomeSum =$debtSum = 0;
				foreach ( $orderData as $print ) {
					$costPriceSum += $print['cost_price'];
					$orderSum += $print['selling_price'];
					$incomeSum += $print['earnings'];
					$debtSum += $print['debt'];
				}
				?>
					<tr>
						<td><?php echo $costPriceSum; ?></td>
						<td><?php echo $orderSum;?></td>
						<td><?php echo $incomeSum;?></td>
						<td><?php echo $debtSum;?></td>
					</tr>
				</tbody>
			</table>
		</main>
	</div>
<?php get_footer(); ?>