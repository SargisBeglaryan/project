<?php
/*
Template Name: Stock roll
*/
?>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script> -->
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table class="stockRoll">
				<thead>
					<tr>
						<th colum="0" class="tableId">П/Н<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="1" class="tableName">Имя<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="2" class="tableFirm">Фирма<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="3" class="tableType">Тип<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="4" class="tableOrderFormat">Формат<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="5" class="tableMass">М<sup><small>2</small></sup><br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="6" class="tablePrice">Цена<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="7" class="tableProcent">Процент<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_product_roll" );
						foreach ( $result as $print ) {
					?>
					<tr onclick="window.document.location='stock_edit/?type=roll&index=<?php echo $print->id;?>';">
						<td class="tableIdRows"><?php echo $print->id;?></td>
						<td><?php echo $print->name;?></td>
						<td><?php echo $print->company;?></td>
						<td><?php echo $print->type;?></td>
						<td><?php echo $print->size_x;?> x <?php echo $print->size_y;?></td>
						<td><?php echo $print->area;?></td>
						<td><?= $print->price ?></td>
						<td><?= $print->percent ?></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
			
		</main>
	</div>
	
<?php get_footer(); ?>