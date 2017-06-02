<?php 
/* 
Template Name: Degt statistic 
*/ 
?>
<?php get_header(); ?>
<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table cellspacing="0" cellpadding="0" border="0">
				<thead>
					<tr>
						<th>Число выплат</th>
						<th>Клиент</th>
						<th>Статистика оплаты</th>
						<th>Дата</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$orderId = $_GET['index'];
						$paintNumber = 1;
						if(isset($_GET["table"])){
							$type = $_GET['type'];
							$tableName = "wp_debt_product_statistic";
							$result = $wpdb->get_results ("SELECT * FROM $tableName WHERE product_id='$orderId' AND sale_roll='$type'" );
						} else {
							$tableName = 'wp_debt_'.$_GET['type'].'_statistic';
							$result = $wpdb->get_results ( "SELECT * FROM $tableName WHERE order_id='$orderId'" );
						}
						foreach ($result as $print ) {
					?>
					<tr>
						<td><?php echo $paintNumber;?></td>
						<td><?php echo $print->customer;?></td>
						<td><?php echo $print->payed_number;?></td>
						<td><?php echo $print->date;?></td>
					</tr>
					<?php
						++$paintNumber;
					} ?>
				</tbody>
			</table>
			
		</main>
	</div>
<?php get_footer(); ?>