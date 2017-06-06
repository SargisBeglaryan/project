
<?php
/*
Template Name: Finance sale
*/
?>
<?php get_header(); 
$clients = $wpdb->get_results ( "SELECT * FROM  wp_customers");
?>

	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<div class="financeSaleTab">
			  <ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active"><a href="#roleSaleContent" aria-controls="home" role="tab" data-toggle="tab">Рулон</a></li>
			    <li role="presentation"><a href="#paperSaleContent" aria-controls="profile" role="tab" data-toggle="tab">Бумага</a></li>
			    <li role="presentation"><a href="#otherSaleContent" aria-controls="messages" role="tab" data-toggle="tab">Разные</a></li>
			  </ul>

			  <!-- Tab panes -->
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="roleSaleContent">
			    	<table cellspacing="0" cellpadding="0" border="0" class="financeRollSale">
					<thead>
						<tr>
							<th  colum="0" class="tableId">Н/З<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="1" class="tableDate">Дата<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal" id="allDateList" data-toggle="modal" data-target="#customerModal" aria-hidden="true"></i>
							</th>
							<th colum="2" class="tableCustomer">Клиент<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allCustomersList" aria-hidden="true"></i>
							</th>
							<th colum="3" class="tableMaterials">Материал<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allMaterialsList"aria-hidden="true"></i>
							</th>
							<th colum="4" class="tableOrderFormat">Формат<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allFormatList" aria-hidden="true"></i>
							</th>
							<th colum="5" class="tableType">Тип<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="6" class="tableCount">Количество(м²)<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="7" class="tableCostPrice">Себестоимость<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allCostPriceList" aria-hidden="true"></i>
							</th>
							<th colum="8" class="tablePrice">Цена продажи<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allSellingPriceList" aria-hidden="true"></i>
							</th>
							<th colum="9" class="tableIncome">Доход<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol class="sale_product_debt"Modal"  data-toggle="modal" data-target="#customerModal" id="allEarningList" aria-hidden="true"></i>
							</th>
							<th colum="10" class="tableDept">Задолженность<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allDebtList" aria-hidden="true"></i>
							</th>
							<th>
								Действия
							</th>
						</tr>
					</thead>
					<tbody>
						<?php
						global $wpdb;
						$allRoll = $wpdb->get_results ( "SELECT * FROM wp_sale_roll_product" );
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						foreach($allRoll as $roll){
							if($roll->customer == null){
								$customerWithTable = $wpdb->get_row( "SELECT name FROM wp_customers WHERE id = '$roll->customer_id'" );
								$roll->customer = $customerWithTable->name;
							}
						?>
						<tr>
							<td><?php echo $roll->id; ?></td>
							<td class="allDateList"><?php echo $roll->date; ?></td>
							<td class="allCustomersList"><?php echo $roll->customer; ?></td>
							<td class="allMaterialsList"><?php echo $roll->name; ?></td>
							<td class="allFormatList"><?php echo $roll->size_x."x".$roll->size_y; ?></td>
							<td><?php echo $roll->type; ?></td>
							<td><?php echo $roll->count; ?></td>
							<td class="allCostPriceList"><?php echo $roll->cost_price;?></td>
							<td contenteditable='true' class="allSellingPriceList sale_product_selling_price"><?php echo $roll->selling_price;?></td>
							<td class="allEarningList"><?php echo $roll->selling_price - $roll->cost_price;?></td>
							<td contenteditable='true' class="allDebtList sale_product_debt"><?php echo $roll->debt;?></td>
						</tr>
						<?php
						}
						?>
					</tbody>
					<input type="hidden" value="roll" id="table_name">
				</table>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="paperSaleContent">
			    	<table cellspacing="0" cellpadding="0" border="0" class="financePaperSale">
					<thead>
						<tr>
							<th  colum="0" class="tableId">Н/З<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
								<th colum="1" class="tableDate">Дата<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal" id="allDateList" data-toggle="modal" data-target="#customerModal" aria-hidden="true"></i>
							</th>
							<th colum="2" class="tableCustomer">Клиент<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allCustomersList" aria-hidden="true"></i>
							</th>
							<th colum="3" class="tableMaterials">Материал<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allMaterialsList"aria-hidden="true"></i>
							</th>
							<th colum="4" class="tableOrderFormat">Формат<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allFormatList" aria-hidden="true"></i>
							</th>
							<th colum="5" class="tableTiraj">Тираж<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="6" class="tableCount">Количество<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="7" class="tableCostPrice">Себестоимость<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allCostPriceList"aria-hidden="true"></i>
							</th>
							<th colum="8" class="tablePrice">Цена продажи<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allSellingPriceList"aria-hidden="true"></i>
							</th>
							<th colum="9" class="tableIncome">Доход<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol class="sale_product_debt"Modal"  data-toggle="modal" data-target="#customerModal" id="allEarningList"aria-hidden="true"></i>
							</th>
							<th colum="10" class="tableDept">Задолженность<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allDebtList" aria-hidden="true"></i>
							</th>
							<th>
								Действия
							</th>
						</tr>
					</thead>
					<tbody>
						<?php
						global $wpdb;
						$allPaper = $wpdb->get_results ( "SELECT * FROM wp_sale_paper_product" );
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						foreach($allPaper as $paper){
							if($paper->customer == null){
								$customerWithTable = $wpdb->get_row( "SELECT name FROM wp_customers WHERE id = '$paper->customer_id'" );
								$paper->customer = $customerWithTable->name;
							}
						?>
						<tr>
							<td><?php echo $paper->id; ?></td>
							<td class="allDateList"><?php echo $paper->date; ?></td>
							<td class="allCustomersList"><?php echo $paper->customer; ?></td>
							<td class="allMaterialsList"><?php echo $paper->name; ?></td>
							<td class="allFormatList"><?php echo $paper->size_x."x".$paper->size_y; ?></td>
							<td><?php echo $paper->density; ?></td>
							<td><?php echo $paper->count; ?></td>
							<td class="allCostPriceList"><?php echo $paper->cost_price;?></td>
							<td contenteditable='true' class="allSellingPriceList sale_product_selling_price"><?php echo $paper->selling_price;?></td>
							<td class="allEarningList"><?php echo $paper->selling_price - $paper->cost_price;?></td>
							<td contenteditable='true' class="allDebtList sale_product_debt"><?php echo $paper->debt;?></td>
						</tr>
						<?php
						}
						?>
					</tbody>
					<input type="hidden" value="paper" id="table_name">
				</table>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="otherSaleContent">
			    	<table cellspacing="0" cellpadding="0" border="0" class="financeOtherSale">
					<thead>
						<tr>
							<th  colum="0" class="tableId">Н/З<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="1" class="tableDate">Дата<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal" id="allDateList" data-toggle="modal" data-target="#customerModal" aria-hidden="true"></i>
							</th>
							<th colum="2" class="tableCustomer">Клиент<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allCustomersList" aria-hidden="true"></i>
							</th>
							<th colum="3" class="tableMaterials">Материал<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allMaterialsList" aria-hidden="true"></i>
							</th>
							<th colum="4" class="tableType">Тип<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="5" class="tableCount">Количество<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="7" class="tableCostPrice">Себестоимость<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allCostPriceList"aria-hidden="true"></i>
							</th>
							<th colum="8" class="tablePrice">Цена продажи<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allSellingPriceList"aria-hidden="true"></i>
							</th>
							<th colum="9" class="tableIncome">Доход<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol class="sale_product_debt"Modal"  data-toggle="modal" data-target="#customerModal" id="allEarningList"aria-hidden="true"></i>
							</th>
							<th colum="10" class="tableDept">Задолженность<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showFilterModal"  data-toggle="modal" data-target="#customerModal" id="allDebtList"aria-hidden="true"></i>
							</th>
							<th>
								Действия
							</th>
						</tr>
					</thead>
					<tbody>
						<?php
						global $wpdb;
						$allOther = $wpdb->get_results ( "SELECT * FROM wp_sale_other_product" );
						$userRoll = apply_filters( 'wp_nav_menu_args', '' )['status'];
						foreach($allOther as $other){
							if($other->customer == null){
								$customerWithTable = $wpdb->get_row( "SELECT name FROM wp_customers WHERE id = '$other->customer_id'" );
								$other->customer = $customerWithTable->name;
							}
						?>
						<tr>
							<td><?php echo $other->id; ?></td>
							<td class="allDateList"><?php echo $other->date; ?></td>
							<td class="allCustomersList"><?php echo $other->customer; ?></td>
							<td class="allMaterialsList"><?php echo $other->name; ?></td>
							<td class="allFormatList"><?php echo $other->type; ?></td>
							<td><?php echo $other->count; ?></td>
							<td><?php echo $other->cost_price;?></td>
							<td class="allCostPriceList"><?php echo $other->cost_price;?></td>
							<td contenteditable='true' class="allSellingPriceList sale_product_selling_price"><?php echo $other->selling_price;?></td>
							<td class="allEarningList"><?php echo $other->selling_price - $other->cost_price;?></td>
							<td contenteditable='true' class="allDebtList sale_product_debt"><?php echo $other->debt;?></td>
						</tr>
						<?php
						}
						?>
					</tbody>
					<input type="hidden" value="other" id="table_name">
				</table>
			    </div>
			  </div>
			</div>
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