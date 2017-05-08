
<?php
/*
Template Name: Order roll all
*/
?>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table>
				<thead>
					<tr>
						<th>Н/З</th>
						<th>Дата</th>
						<th>Клиент</th>
						<th>Материал</th>
						<th>Тип</th>
						<th>Тираж</th>
						<th>Тип заказа</th>
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_order_roll" );
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						foreach ( $result as $print ) {
							if($print->status == $userRoll || $userRoll=='all'){
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
					</tr>
					<?php }
					} ?>
				</tbody>
			</table>
		</main>
	</div>
	
<?php get_footer(); ?>