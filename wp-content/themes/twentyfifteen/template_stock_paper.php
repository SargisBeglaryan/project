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
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allCustomersList"></i>
						</th>
						<th colum="2" class="tableFirm">Фирма<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allFirmList"></i>
						</th>
						<th colum="3" class="tableDensity">Плотность<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allDensityList"></i>
						</th>
						<th colum="4" class="tableType">Тип<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allTypeList"></i>
						</th>
						<th colum="5" class="tableOrderFormat">Формат<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allFormatList"></i>
						</th>
						<th colum="6" class="tableList">Листы<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allPageCountList"></i>
						</th>
						<th colum="7" class="tableWeight">КГ<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allWeightList"></i>
						</th>
						<th colum="8" class="tablePrice">Цена<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allPriceList"></i>
						</th>
						<th colum="9" class="tableProcent">Процент<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allPercentList"></i>
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
						<td class="allCustomersList"><?php echo $print->name;?></td>
						<td class="allFirmList"><?php echo $print->company;?></td>
						<td class="allDensityList"><?php echo $print->density;?></td>
						<td class="allTypeList"><?php echo $print->type;?></td>
						<td class="allFormatList"><?php echo $print->size_x;?>x<?php echo $print->size_y;?></td>
						<td class="allPageCountList"><?php echo $print->page_count;?></td>
						<td class="allWeightList"><?php echo $print->weight;?></td>
						<td class="allPriceList"><?= $print->price ?></td>
						<td class="allPercentList"><?= $print->percent ?></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>			
		</main>
	</div>
	<div class="modal fade" tableName="paperTable" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		    <h4 class="modal-title" id="gridSystemModalLabel">Имя клиентов</h4>
		  </div>
		  <div class="modal-body">
		  </div>
		  <div class="modal-footer">
		    <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
		    <button type="button" class="btn showFiltredCustomers">Показать</button>
		  </div>
		</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
<?php get_footer(); ?>