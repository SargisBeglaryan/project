<?php
/*
Template Name: Stock customer
*/
?>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script> -->
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<table class="stockCustomer">
				<thead>
					<tr>
						<th colum="0" class="tableId">П/Н<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th colum="0" class="tableCustomer">Имя клиента<br>
							<i sort="asc" class="fa fa-arrow-down" aria-hidden="true"></i>
							<i sort="desc" class="fa fa-arrow-up" aria-hidden="true"></i>
						</th>
						<th>Изменить</th>
					</tr>
				</thead>
				<tbody>
					<?php
						global $wpdb;
						$result = $wpdb->get_results ( "SELECT * FROM wp_customers" );
						foreach ( $result as $print ) {
					?>
					<tr>
						<td class="tableIdRows"><?php echo $print->id;?></th>
						<td><?php echo $print->name;?></td>
						<td>
							<a class="changeCustomer" href="/create-customer?id=<?= $print->id?>" name="submit_status">Изменить</a>
							<form method="POST" action="">
								<input type="hidden" name="delete_customer" value="<?= $print->id?>">
								<input type="submit" name="submit_status" value="Удалить" style="    margin: 5px auto;width: 110px;height: 30px;padding: 5px; display: block">
							</form>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>			
		</main>
	</div>
	
<?php get_footer(); ?>