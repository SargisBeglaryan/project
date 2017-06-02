
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
							</th>
							<th colum="2" class="tableCustomer">Клиент<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showClientsModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true"></i>
							</th>
							<th colum="3" class="tableProductName">Имя<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="4" class="tableOrderFormat">Формат<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="5" class="tableType">Тип<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="6" class="tableCount">Количество(м²)<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
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
							<td><?php echo $roll->date; ?></td>
							<td class="allCustomersList"><?php echo $roll->customer; ?></td>
							<td><?php echo $roll->name; ?></td>
							<td><?php echo $roll->size_x." x ".$roll->size_y; ?></td>
							<td><?php echo $roll->type; ?></td>
							<td><?php echo $roll->count; ?></td>
						</tr>
						<?php
						}
						?>
					</tbody>
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
							</th>
							<th colum="2" class="tableCustomer">Клиент<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showClientsModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true"></i>
							</th>
							<th colum="3" class="tableProductName">Имя<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="4" class="tableOrderFormat">Формат<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="5" class="tableTiraj">Тираж<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="6" class="tableCount">Количество<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
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
							<td><?php echo $paper->date; ?></td>
							<td class="allCustomersList"><?php echo $paper->customer; ?></td>
							<td><?php echo $paper->name; ?></td>
							<td><?php echo $paper->size_x." x ".$paper->size_y; ?></td>
							<td><?php echo $paper->density; ?></td>
							<td><?php echo $paper->count; ?></td>
						</tr>
						<?php
						}
						?>
					</tbody>
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
							</th>
							<th colum="2" class="tableCustomer">Клиент<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
								<i class="fa fa-list-ol showClientsModal"  data-toggle="modal" data-target="#customerModal" aria-hidden="true"></i>
							</th>
							<th colum="3" class="tableProductName">Имя<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="4" class="tableType">Тип<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="5" class="tableCount">Количество<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
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
							<td><?php echo $other->date; ?></td>
							<td class="allCustomersList"><?php echo $other->customer; ?></td>
							<td><?php echo $other->name; ?></td>
							<td><?php echo $other->type; ?></td>
							<td><?php echo $other->count; ?></td>
						</tr>
						<?php
						}
						?>
					</tbody>
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