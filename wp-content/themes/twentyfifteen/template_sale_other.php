<?php
/*
Template Name: Sale other all
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
						<th>Краска</th>
						<th>Колич.</th>
						<th>Форма</th>
						<th>Колич.</th>
						<th>Резина</th>
						<th>Колич.</th>
						<th>Фольга</th>
						<th>Колич.</th>
						<th>Лак</th>
						<th>Колич.</th>
						
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_sale_other" );
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						foreach ( $result as $print ) {
							if($print->status == $userRoll || $userRoll=='all'){
					?>
					<tr onclick="window.document.location='sale-single/?type=other&index=<?php echo $print->id;?>';">
						<th><?php echo $print->id;?></th>
						<td><?php echo $print->date;?></td>
						
						<td><?php 
							if (preg_match('/[0-9]+/', $print->paint_count)) {
								echo $wpdb->get_var('SELECT name FROM wp_product_other WHERE id = "'.$print->paint_id.'"');
							}else {
								echo $print->paint_id;
							}
							?>
						</td>
						<td> <?php echo $print->paint_count; ?></td>
						
						<td><?php 
							if (preg_match('/[0-9]+/', $print->form_count)) {
								echo $wpdb->get_var('SELECT name FROM wp_product_other WHERE id = "'.$print->form_id.'"');
							}else {
								echo $print->form_id;
							}
							?>
						</td>
						<td> <?php echo $print->form_count; ?></td>
						
						<td><?php 
							if (preg_match('/[0-9]+/', $print->rubber_count)) {
								echo $wpdb->get_var('SELECT name FROM wp_product_other WHERE id = "'.$print->rubber_id.'"');
							}else {
								echo $print->rubber_id;
							}
							?>
						</td>
						<td> <?php echo $print->rubber_count; ?></td>
						
						<td><?php 
							if (preg_match('/[0-9]+/', $print->foil_count)) {
								echo $wpdb->get_var('SELECT name FROM wp_product_other WHERE id = "'.$print->foil_id.'"');
							}else {
								echo $print->foil_id;
							}
							?>
						</td>
						<td> <?php echo $print->foil_count; ?></td>
						
						<td><?php 
							if (preg_match('/[0-9]+/', $print->lacquer_count)) {
								echo $wpdb->get_var('SELECT name FROM wp_product_other WHERE id = "'.$print->lacquer_id.'"');
							}else {
								echo $print->lacquer_id;
							}
							?>
						</td>
						<td> <?php echo $print->lacquer_count; ?></td>
						
					</tr>
					<?php }
					} ?>
				</tbody>
			</table>
		</main>
	</div>
	
<?php get_footer(); ?>