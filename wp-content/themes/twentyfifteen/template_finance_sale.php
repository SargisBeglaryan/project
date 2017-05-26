
<?php
/*
Template Name: Finance sale
*/
?>
<?php get_header(); ?>
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
					
							<th colum="1" class="tableProductName">Имя<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="2" class="tableOrderFormat">Формат<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="3" class="tableType">Тип<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="4" class="tableCount">Количество(м²)<br>
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
						?>
						<tr>
							<td><?php echo $roll->id; ?></td>
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
					
							<th colum="1" class="tableProductName">Имя<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="2" class="tableOrderFormat">Формат<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="3" class="tableTiraj">Тираж<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="4" class="tableCount">Количество<br>
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
						?>
						<tr>
							<td><?php echo $paper->id; ?></td>
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
					
							<th colum="1" class="tableProductName">Имя<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="2" class="tableType">Тип<br>
								<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
								<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
							</th>
							<th colum="3" class="tableCount">Количество<br>
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
						?>
						<tr>
							<td><?php echo $other->id; ?></td>
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
	
<?php get_footer(); ?>