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
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allCustomersList"></i>
						</th>
						<th colum="2" class="tableCategory">Категория<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allTypeList"></i>
						</th>
						<th colum="3" class="tableCount">Количество<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allPageCountList"></i>
						</th>
						<th colum="4" class="tablePrice">Цена<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allPriceList"></i>
						</th>
						<th colum="4" class="tableProcent">Процент<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true" id="allPercentList"></i>
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
						<td class="allCustomersList"><?php echo $print->name;?></td>
						<td class="allTypeList"><?php echo $print->type;?></td>
						<td class="allPageCountList"><?php echo $print->count;?></td>
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
	</div><!-- /.modal --
	
<?php get_footer(); ?>