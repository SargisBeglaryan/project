<?php
/*
Template Name: Create Other
*/
?>

<?php get_header(); ?>

	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">

			<section class="bla">	
				<div class="page-content">
					<h3 class="page-title"><?php _e( 'Создать Разное' ); ?></h3>
					
					<div class="DbRequesAction">
						<form method="POST" action="">
						
							<p>
								<input type="text" name="product_name" placeholder="Название" style="width:46%;" required>
								<select name="product_type" id="product_type" style="width:46%;padding:0.48em" required>
									<option value="Краска">Краска</option>
									<option value="Фольга">Фольга</option>
									<option value="Форма">Форма</option>
									<option value="Лак">Лак</option>
									<option value="Резина">Резина</option>
								</select>
							</p>
							<p>
								<input type="text" name="price" placeholder="Цена на одну единицу" style="width:46%;" required>
								<input type="number" name="percent" placeholder="Процент (%)" style="width:43%;padding:0.48em" min="0" required>
								<span>%</span>
							</p>
							
							<input type="submit" name="submit_create" value="Создать" style="margin-top:30px;">
						
						</form>
					</div>
					
					<?php
					if(isset($_POST["submit_create"]))
					{			
						// Prepare array to insert in database
						$data = array(
						"name" => $_POST["product_name"],
						"type" => $_POST["product_type"],
						"price"=> $_POST["price"],
						"percent"=> $_POST["percent"],
						"count" => 0
						);
						//Insert new row
						$wpdb->insert("wp_product_other", $data);
					
					}?>
					
				</div>
			</section>
		</main>
	</div>
	
<?php get_footer(); ?>


