<?php
/*
Template Name: Sale roll all
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
						<th>Материал</th>
						<th>Формат</th>
						<th>Тип</th>
						<th>Количество(м²)</th>
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_sale_roll" );
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						foreach ( $result as $print ) {
							if($print->status == $userRoll || $userRoll=='all'){
					?>
					<tr onclick="window.document.location='sale-single/?type=roll&index=<?php echo $print->id;?>';">
						<th><?php echo $print->id;?></th>
						<td><?php echo $print->date;?></td>
						<td><?php 
							if (preg_match('/[0-9]+/', $print->material_id)){
								echo $wpdb->get_var('SELECT name FROM wp_product_roll WHERE id = "'.$print->material_id.'"');
							}else {
								echo $print->material_id;
							}
							?>
						</td>
						<td><?php 
							if (preg_match('/[0-9]+/', $print->material_id)){
								echo $wpdb->get_var('SELECT size_x FROM wp_product_roll WHERE id = "'.$print->material_id.'"');
								echo "x";
								echo $wpdb->get_var('SELECT size_y FROM wp_product_roll WHERE id = "'.$print->material_id.'"');
							}else {
								echo $print->material_id;
							}
							?>
						</td>
						<td><?php 
							if (preg_match('/[0-9]+/', $print->material_id)){
								echo $wpdb->get_var('SELECT type FROM wp_product_paper WHERE id = "'.$print->material_id.'"');
							}else {
								echo $print->material_id;
							}
							?>
						</td>
						<td><?php echo $print->area;?></td>
					</tr>
					<?php }
					} ?>
				</tbody>
			</table>
		</main>
	</div>
	
<?php get_footer(); ?>