<?php
/*
Template Name: Stock paper
*/
?>
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table class="stockPaper">
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
						<th colum="3" class="tableDensity">Плотность<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="4" class="tableType">Тип<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="5" class="tableOrderFormat">Формат<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="6" class="tableList">Листы<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="7" class="tableWeight">КГ<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="8" class="tablePrice">Цена<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="9" class="tableProcent">Процент<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_product_paper" );
						foreach ( $result as $print ) {
					?>
					<tr onclick="window.document.location='stock_edit/?type=paper&index=<?php echo $print->id;?>';">
						<td class="tableIdRows"><?php echo $print->id;?></td>
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