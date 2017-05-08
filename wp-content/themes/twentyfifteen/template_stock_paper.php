<?php
/*
Template Name: Stock paper
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
						<th>П/Н</th>
						<th>Имя</th>
						<th>Фирма</th>
						<th>Плотность</th>
						<th>Тип</th>
						<th>Формат</th>
						<th>Листы</th>
						<th>КГ</th>
						<th>Цена</th>
						<th>Процент</th>
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_product_paper" );
						foreach ( $result as $print ) {
					?>
					<tr onclick="window.document.location='stock_edit/?type=paper&index=<?php echo $print->id;?>';">
						<th><?php echo $print->id;?></th>
						<td><?php echo $print->name;?></td>
						<td><?php echo $print->company;?></td>
						<td><?php echo $print->density;?></td>
						<td><?php echo $print->type;?></td>
						<td><?php echo $print->size_x;?> x <?php echo $print->size_y;?></td>
						<td><?php echo $print->page_count;?></td>
						<td><?php echo $print->weight;?></td>
						<td><?= $print->price ?></td>
						<td><?= $print->percent ?></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>			
		</main>
	</div>
	
<?php get_footer(); ?>