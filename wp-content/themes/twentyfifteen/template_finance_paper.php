<?php
/*
Template Name: Finance paper all
*/
?>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script> -->
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table cellspacing="0" cellpadding="0" border="0" class="financePaper">
				<thead>
					<tr>
						<th  colum="0" class="tableId">Н/З<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="1" class="tableCustomer">Клиент<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							<i class="fa fa-list-ol showClientsModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true"></i>
						</th>
						<th colum="2" class="tableCostPrice">Себестоимость<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="3" class="tablePrice">Цена продажи<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="4" class="tableIncome">Доход<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="5" class="tableDept">Задолженность<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th>Тип</th>
						<th>Действия</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$orderData = costPrice("paper");
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						foreach ( $orderData as $print ) {
							if($print['status'] == $userRoll || $userRoll=='all'){
					?>
					<tr>
						<td><?php echo $print['id'];?></td>
						<td onclick="window.document.location='customer-orders/?type=paper&customer=<?php echo $print['customer'];?>';"  class="allCustomersList customerName"><?php echo $print['customer'];?></td>
						<td><?php echo $print['cost_price'];?></td>
						<td contenteditable='true' id="selling_price"><?php echo $print['selling_price'];?></td>
						<td><?php echo $print['earnings'];?></td>
						<td contenteditable='true' id="debt"><?php echo $print['debt'];?></td>
						<td>
							<select name="order_type" class="order_type">
								<option value="" selected disabled>Выберите тип</option>
								<option value="Налич" <?php if($print['type'] && $print['type'] == "Налич") echo "selected";?>>Налич</option>
								<option value="Фактура" <?php if($print['type'] && $print['type'] == "Фактура") echo "selected";?>>Фактура</option>
							</select>
						</td>
					</tr>
					<?php }
					} ?>
				</tbody>
				<input type="hidden" value="paper" id="table_name">
			</table>
		</main>
	</div>
	<div class="modal fade" tableName="financePaper" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
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