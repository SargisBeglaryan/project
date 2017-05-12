<?php
/*
Template Name: Stock other
*/
?>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/ jquery.ba-throttle-debounce.min.js"></script>-->
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table class="stockOther">
				<thead>
					<tr>
						<th  colum="0" class="tableId">Н/З<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="1" class="tableName">Имя<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="2" class="tableCategory">Категория<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="3" class="tableCount">Количество<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="4" class="tablePrice">Цена<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="4" class="tableProcent">Процент<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_product_other" );
						foreach ( $result as $print ) {
					?>
					<tr onclick="window.document.location='stock_edit/?type=other&index=<?php echo $print->id;?>';">
						<td class="tableIdRows"><?php echo $print->id;?></td>
						<td><?php echo $print->name;?></td>
						<td><?php echo $print->type;?></td>
						<td><?php echo $print->count;?></td>
						<td><?= $print->price ?></td>
						<td><?= $print->percent ?></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
			
		</main>
	</div>
	
<?php get_footer(); ?>